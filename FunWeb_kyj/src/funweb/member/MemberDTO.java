package funweb.member;

public class MemberDTO {
	private String id;
	private String pass1;
	private String pass2;
	private String name;
	private String email;
	private String zipCode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	
	
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPass1() {
		return pass1;
	}



	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}



	public String getPass2() {
		return pass2;
	}



	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getZipCode() {
		return zipCode;
	}



	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getDetailAddress() {
		return detailAddress;
	}



	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}



	public String getExtraAddress() {
		return extraAddress;
	}



	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}



	

	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pass1=" + pass1 + ", pass2=" + pass2 + ", name=" + name + ", email=" + email
				+ ", zipCode=" + zipCode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", extraAddress=" + extraAddress + "]";
	}
	
	
	
	
	
}
