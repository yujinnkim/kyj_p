package funweb.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import funweb.member.MemberDTO;




public class BoardDAO {

	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String sql="";
	
	//DB연결
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqldb");
		con = ds.getConnection();

		return con;
	}
	//DB연결
	
	//자원 해제
	private void closeDB() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//자원 해제
	
	//insertBoard
	public void insertBoard(BoardDTO dto) {
		int num=0;
		
		try {
			con = getCon();
			sql = "select max(num) from fw_board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1; // 1번 인덱스 컬럼
			}

			System.out.print("글 번호: " + num);
			///////////////////////////////////////////////////////////////////////
			sql = "insert into fw_board(num,name,subject,content,star,readcount,re_ref,re_lev,re_seq,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getStar());
			pstmt.setInt(6, 0);// 조회수 0으로 초기화
			pstmt.setInt(7, num);  // re_ref 그룹번호
			pstmt.setInt(8, 0);   //re_lev 레벨값
			pstmt.setInt(9, 0);   // re_seq 순서
			pstmt.setString(10, dto.getIp());
			pstmt.setString(11, dto.getFile());
			
			pstmt.executeUpdate();
			
			System.out.println(" / 글작성완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//insertBoard
	
	//updateBoard
	public int updateBoard(BoardDTO bdto) {
		int result=-1;
		
		try {
			con=getCon();
			sql="select name from fw_board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bdto.getNum());
			
			rs = pstmt.executeQuery();	
			
			if(rs.next()) {
				if(bdto.getName().equals(rs.getString("name"))) {
					sql = "update fw_board set subject=?,content=?,star=? "
							+ "where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bdto.getSubject());
					pstmt.setString(2, bdto.getContent());
					pstmt.setInt(3, bdto.getStar());
					pstmt.setInt(4, bdto.getNum());
					result = pstmt.executeUpdate();
				}else {
					
					result=0;
				}
			}else {
				result=-1;
			}
			
			System.out.println("updateboard " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	//updateBoard

	//deleteBoard
	public int deleteBoard(int num,String name) {
		int result=-1;
		
		try {
			con=getCon();
			sql="select name from fw_board where num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				if(name.equals(rs.getString("name"))) {
					sql="delete from fw_board where num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num);
					
					result=pstmt.executeUpdate();
					
				}else {
					result=0;
				}
			}
		
			System.out.println("삭제결과  " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		return result;
	}
	//deleteBoard
	
	//reInsertBoard
	public void reInsertBoard(BoardDTO bdto) {
		int num = 0;
		
		
		try {
			con= getCon();
			sql = "select max(num) from fw_board";
			pstmt=con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				num= rs.getInt(1)+1;
			}
			System.out.println("글번호 " + num);
			
			sql ="update fw_board set re_seq = re_seq + 1 "
					+ "where re_ref=? and re_seq>?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, bdto.getRe_ref());
			pstmt.setInt(2, bdto.getRe_seq());
			
			pstmt.executeUpdate();
			
			sql = "insert into fw_board(num,name,subject,content,star,readcount,re_ref,re_lev,re_seq,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bdto.getName());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getContent());
			pstmt.setInt(5, bdto.getStar());
			pstmt.setInt(6, 0);// 조회수 0으로 초기화
			pstmt.setInt(7, bdto.getRe_ref());  
			pstmt.setInt(8, bdto.getRe_lev()+1);  
			pstmt.setInt(9, bdto.getRe_seq()+1);
			pstmt.setString(10, bdto.getIp());
			pstmt.setString(11, bdto.getFile());

			// 4. sql ����
			pstmt.executeUpdate();
			
			System.out.println("답글입력완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	//reInsertBoard
	
	
	
	//getBoardCount
	public int getBoardCount() {
		int cnt=0;
		try {
			con=getCon();
			sql="select count(*) from fw_board";
			pstmt =con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt(1);
			
			}
			System.out.println("총 "+cnt+"개의 글");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return cnt;
	}
	//getBoardCount
	
	//getBoardList
	public List getBoardList() {
		List boardList = new ArrayList();
		
		try {
			con = getCon();
			sql = "select * from fw_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				//데이터 있을때 마다 글 1개의 정보를 저장하는 객체 생성
				BoardDTO bdto = new BoardDTO();
				
				bdto.setContent(rs.getString("content"));
				bdto.setDate(rs.getDate("date"));
				bdto.setFile(rs.getString("file"));
				bdto.setIp(rs.getString("ip"));
				bdto.setNum(rs.getInt("num"));
				bdto.setRe_lev(rs.getInt("re_lev"));
				bdto.setRe_ref(rs.getInt("re_ref"));
				bdto.setRe_seq(rs.getInt("re_seq"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setStar(rs.getInt("star"));
				bdto.setName(rs.getString("name"));
				
				// DTO 객체를 ArrayList 한칸에 저장
				boardList.add(bdto);				
				
			}//while
			
			System.out.println("글정보저장완료List "+boardList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return boardList;
		
	}
	//getBoardList
	
	//getBoardList(startRow, pageSize)
	public List getBoardList(int startRow, int pageSize) {
		List boardList=new ArrayList();
		
		try {
			con=getCon();
			sql="select * from fw_board order by re_ref desc, re_seq asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);	//시작행 -1 (시작 row인덱스 번호)
			pstmt.setInt(2, pageSize); //페이지크기( 한번에 출력되는 수)
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto=new BoardDTO();
				
				bdto.setContent(rs.getString("content"));
				bdto.setDate(rs.getDate("date"));
				bdto.setFile(rs.getString("file"));
				bdto.setIp(rs.getString("ip"));
				bdto.setNum(rs.getInt("num"));
				bdto.setRe_lev(rs.getInt("re_lev"));
				bdto.setRe_ref(rs.getInt("re_ref"));
				bdto.setRe_seq(rs.getInt("re_seq"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setStar(rs.getInt("star"));
				bdto.setName(rs.getString("name"));
				
				boardList.add(bdto);
			}//while
			
			System.out.println("글정보저장완료 " + boardList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardList;
	}
	//getBoardList(startRow, pageSize)
	
	//getBoard
	public BoardDTO getBoard(int num) {
		BoardDTO bdto=null;
		
		try {
			con=getCon();
			sql="select * from fw_board where num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bdto=new BoardDTO();
				
				bdto.setContent(rs.getString("content"));
				bdto.setDate(rs.getDate("date"));
				bdto.setFile(rs.getString("file"));
				bdto.setIp(rs.getString("ip"));
				bdto.setNum(rs.getInt("num"));
				bdto.setRe_lev(rs.getInt("re_lev"));
				bdto.setRe_ref(rs.getInt("re_ref"));
				bdto.setRe_seq(rs.getInt("re_seq"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setStar(rs.getInt("star"));
				bdto.setName(rs.getString("name"));
			}
			
			System.out.println("정보가져오기");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return bdto;
	}
	//getBoard
	
	
	// updateReadcount
		public void updateReadcount(int num) {
			try {
				con=getCon();
				sql="update fw_board set readcount = readcount + 1 where num=?";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				
				pstmt.executeUpdate();
				
				System.out.println("조회수 증가+");
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}	
			

		// updateReadcount
		
		// sendEmail
		public void sendEmail(String email, String title, String context) {
	    
	    Properties p = System.getProperties();
	    p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
	    p.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
	    p.put("mail.smtp.auth","true");                 // gmail은 true 고정
	    p.put("mail.smtp.port", "465");                 // 네이버 포트
	    p.put("mail.smtp.port", "587");                 // 네이버 포트
	       
	    Authenticator auth = new MyAuthentication();
	    //session 생성 및  MimeMessage생성
	    Session session = Session.getDefaultInstance(p, auth);
	    MimeMessage msg = new MimeMessage(session);
	     
	    try{
	        //편지보낸시간
	        msg.setSentDate(new Date());
	        InternetAddress from = new InternetAddress() ;
	        from = new InternetAddress("yujin4114@naver.com"); //발신자 아이디
	        // 이메일 발신자
	        msg.setFrom(from);
	        // 이메일 수신자
	        InternetAddress to = new InternetAddress(email);
	        msg.setRecipient(Message.RecipientType.TO, to);
	        // 이메일 제목
	        msg.setSubject(title, "UTF-8");
	        // 이메일 내용
	        msg.setText(context, "UTF-8");
	        // 이메일 헤더
	        msg.setHeader("content-Type", "text/html");
	        //메일보내기
	        javax.mail.Transport.send(msg, msg.getAllRecipients());
	         
	    }catch (AddressException addr_e) {
	        addr_e.printStackTrace();
	    }catch (MessagingException msg_e) {
	        msg_e.printStackTrace();
	    }catch (Exception msg_e) {
	        msg_e.printStackTrace();
	    }
	}
	}

	class MyAuthentication extends Authenticator {
	  
	PasswordAuthentication pa;
	public MyAuthentication(){
	     
	    String id = "yujin4114";  //네이버 이메일 아이디
	    String pw = "rladbwls30207";        //네이버 비밀번호

	    // ID와 비밀번호를 입력한다.
	    pa = new PasswordAuthentication(id, pw);
	}

	// 시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
	    return pa;
	}
	//sendEmail
	
	
	
}
