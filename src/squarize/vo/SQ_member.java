
package squarize.vo;

public class SQ_member {
	
	private String sq_member_id;
	private String sq_member_pw;
	private String sq_member_name;
	private String sq_member_email;
	private String sq_member_favorite;
	private String sq_member_isartist="N";
	private String sq_member_email_key;
	private String sq_member_email_auth="N";
	private String sq_member_mile;
	
	public SQ_member() {
		// TODO Auto-generated constructor stub
	}
	
	
	public SQ_member(String sq_member_id, String sq_member_pw, String sq_member_name, String sq_member_email,
			String sq_member_favorite, String sq_member_isartist, String sq_member_email_key,
			String sq_member_email_auth, String sq_member_mile) {
		super();
		this.sq_member_id = sq_member_id;
		this.sq_member_pw = sq_member_pw;
		this.sq_member_name = sq_member_name;
		this.sq_member_email = sq_member_email;
		this.sq_member_favorite = sq_member_favorite;
		this.sq_member_isartist = sq_member_isartist;
		this.sq_member_email_key = sq_member_email_key;
		this.sq_member_email_auth = sq_member_email_auth;
		this.sq_member_mile = sq_member_mile;
	}


	public String getSq_member_id() {
		return sq_member_id;
	}
	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}
	public String getSq_member_pw() {
		return sq_member_pw;
	}
	public void setSq_member_pw(String sq_member_pw) {
		this.sq_member_pw = sq_member_pw;
	}
	public String getSq_member_name() {
		return sq_member_name;
	}
	public void setSq_member_name(String sq_member_name) {
		this.sq_member_name = sq_member_name;
	}
	public String getSq_member_email() {
		return sq_member_email;
	}
	public void setSq_member_email(String sq_member_email) {
		this.sq_member_email = sq_member_email;
	}
	public String getSq_member_favorite() {
		return sq_member_favorite;
	}
	public void setSq_member_favorite(String sq_member_favorite) {
		this.sq_member_favorite = sq_member_favorite;
	}
	public String getSq_member_isartist() {
		return sq_member_isartist;
	}
	public void setSq_member_isartist(String sq_member_isartist) {
		this.sq_member_isartist = sq_member_isartist;
	}

	public String getSq_member_email_key() {
		return sq_member_email_key;
	}

	public void setSq_member_email_key(String sq_member_email_key) {
		this.sq_member_email_key = sq_member_email_key;
	}

	public String getSq_member_email_auth() {
		return sq_member_email_auth;
	}

	public void setSq_member_email_auth(String sq_member_email_auth) {
		this.sq_member_email_auth = sq_member_email_auth;
	}



	public String getSq_member_mile() {
		return sq_member_mile;
	}


	public void setSq_member_mile(String sq_member_mile) {
		this.sq_member_mile = sq_member_mile;
	}


	@Override
	public String toString() {
		return "SQ_member [sq_member_id=" + sq_member_id + ", sq_member_pw=" + sq_member_pw + ", sq_member_name="
				+ sq_member_name + ", sq_member_email=" + sq_member_email + ", sq_member_favorite=" + sq_member_favorite
				+ ", sq_member_isartist=" + sq_member_isartist + ", sq_member_email_key=" + sq_member_email_key
				+ ", sq_member_email_auth=" + sq_member_email_auth + ", sq_member_mile=" + sq_member_mile + "]";
	}



	
}
