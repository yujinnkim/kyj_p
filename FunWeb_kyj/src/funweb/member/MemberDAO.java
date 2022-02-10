package funweb.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	
	// 디비 연결
	private Connection getCon() throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fwdb", "root", "1234");
		System.out.println("DB연결");

		return con;
	}
	// 디비 연결
	
	// 자원 해제
	public void closeDB() {
		try {
			if(rs!=null)	rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null)	con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 자원 해제
	
	// insertMember
	public void insertMember(MemberDTO mdto) {
		try {
			con=getCon();
			sql="insert into fw_member(id, pass1, pass2, name, email, zipCode, address, detailAddress, extraAddress) values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPass1());
			pstmt.setString(3, mdto.getPass2());
			pstmt.setString(4, mdto.getName());
			pstmt.setString(5, mdto.getEmail());
			pstmt.setString(6, mdto.getZipCode());
			pstmt.setString(7, mdto.getAddress());
			pstmt.setString(8, mdto.getDetailAddress());
			pstmt.setString(9, mdto.getExtraAddress());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// insertMember
	
	
	//loginCheck
	public int loginCheck(String id, String pass1) {
		int result=-1;
		
		try {
			con=getCon();
			sql="select pass1 from fw_member where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			// 아이디X -1 / 아이디O 비밀번호X 0/ 아이디O 비밀번호O 1
			if(rs.next()) {
				if(pass1.equals(rs.getString("pass1"))) {
					result=1;
				}else {
					result=0;
				}
			}else {
				result=-1;
			}
			
			System.out.println("실행결과 : "+result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
	}
	//loginCheck
	
	
	// Checkid
	public int checkId(String id) {
		int result=-1;
		
		try {
			con=getCon();
			sql="select id from fw_member where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=0;
			}else {
				result=1;
			}
			System.out.println("중복체크" + result);
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		
		return result;
	}
	// Checkid
	
	// Checkname
	public int checkName(String name) {
		int result=-1;
		
		try {
			con=getCon();
			sql="select name from fw_member where name=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=0;
			}else {
				result=1;
			}
			System.out.println("중복체크" + result);
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		
		return result;
	}
	// nameCheck
	
	
	
	//getMember(id)
	public MemberDTO getMember(String id) {
		MemberDTO mdto=null;
		
		try {
			con=getCon();
			sql="select * from fw_member where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mdto=new MemberDTO();
				
				mdto.setId(rs.getString("id"));
				mdto.setPass1(rs.getString("pass1"));
				mdto.setName(rs.getString("name"));
				mdto.setEmail(rs.getString("email"));
				mdto.setZipCode(rs.getString("zipCode"));
				mdto.setAddress(rs.getString("address"));
				mdto.setDetailAddress(rs.getString("detailAddress"));
				mdto.setExtraAddress(rs.getString("extraAddress"));
				
			}
			System.out.println("sql구문실행완료 " +mdto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return mdto;
	}
	//getMember(id)
	
	
	
	//updateMember
	public int updateMember(MemberDTO mdto) {
		int result=-1;
		
		try {
			con=getCon();
			sql="select pass1 from fw_member where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, mdto.getId());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(mdto.getPass1().equals(rs.getString("pass1"))) {
					sql="update fw_member set pass1=?, pass2=?, email=?, zipCode=?, address=?, detailAddress=?, extraAddress=? where id=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, mdto.getPass1());
					pstmt.setString(2, mdto.getPass2());
					pstmt.setString(3, mdto.getEmail());
					pstmt.setString(4, mdto.getZipCode());
					pstmt.setString(5, mdto.getAddress());
					pstmt.setString(6, mdto.getDetailAddress());
					pstmt.setString(7, mdto.getExtraAddress());
					pstmt.setString(8, mdto.getId());
					
					pstmt.executeUpdate();
					System.out.println("수정완료");
					result=1;
				}else {
					result=0;
				}
			}else {
				result=-1;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		return result;
	}
	//updateMember
	
	
	//deleteMember
	public int deleteMember(String id, String pass1) {
		int result=-1;
			try {
				con=getCon();
				sql="select pass1 from fw_member where id=?";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					if(pass1.equals(rs.getString("pass1"))) {
						sql="delete from fw_member where id=?";
						pstmt=con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						result=pstmt.executeUpdate();
						System.out.println("삭제완료");
						result=1;
					}else {
						result=0;
					}
				}else {
					result=-1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
					
					
		return result;
	}
	//deleteMember
	
	//getMemberList()
			public ArrayList getMemberList(){
				ArrayList memberList = new ArrayList();
				
				try {
					con = getCon();
					sql = "select * from fw_member where id != 'admin'";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						
						MemberDTO mdto=new MemberDTO();
						
						mdto.setId(rs.getString("id"));
						mdto.setPass1(rs.getString("pass1"));
						mdto.setName(rs.getString("name"));
						mdto.setEmail(rs.getString("email"));
						mdto.setZipCode(rs.getString("zipCode"));
						mdto.setAddress(rs.getString("address"));
						mdto.setDetailAddress(rs.getString("detailAddress"));
						mdto.setExtraAddress(rs.getString("extraAddress"));
						
						memberList.add(mdto);
					}
					System.out.println("*********회원 목록 저장완료*********");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				return memberList;
			}
			// getMemberList()	
	
	//changePass
	public boolean changePass(String id, String newPass1, String newPass2) {
		boolean result = false;
		
		try {
			con=getCon();
			sql="update fw_member set pass1=?, pass2=? where id=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, newPass1);
			pstmt.setString(2, newPass2);
			pstmt.setString(3, id);
			
			int i=pstmt.executeUpdate();
			
			if(i == 1) {
				result = true;
			} else {
				result = false;
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	//changePass
	
}
