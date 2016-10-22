package squarize.vo;

public class SQ_human {
	private String sq_member_id;
	private String sq_member_pw;
	private String sq_member_name;
	private String sq_member_email;
	private String sq_member_favorite;
	private String sq_member_isartist;
	private String sq_artist_phone="";
	private String sq_artist_photo = "";
	private String sq_artist_intro="";
	
	public SQ_human() {}

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

	public String getSq_artist_phone() {
		return sq_artist_phone;
	}

	public void setSq_artist_phone(String sq_artist_phone) {
		this.sq_artist_phone = sq_artist_phone;
	}

	public String getSq_artist_photo() {
		return sq_artist_photo;
	}

	public void setSq_artist_photo(String sq_artist_photo) {
		this.sq_artist_photo = sq_artist_photo;
	}

	public String getSq_artist_intro() {
		return sq_artist_intro;
	}

	public void setSq_artist_intro(String sq_artist_intro) {
		this.sq_artist_intro = sq_artist_intro;
	}

	@Override
	public String toString() {
		return "SQ_human [sq_member_id=" + sq_member_id + ", sq_member_pw=" + sq_member_pw + ", sq_member_name="
				+ sq_member_name + ", sq_member_email=" + sq_member_email + ", sq_member_favorite=" + sq_member_favorite
				+ ", sq_member_isartist=" + sq_member_isartist + ", sq_artist_phone=" + sq_artist_phone
				+ ", sq_artist_photo=" + sq_artist_photo + ", sq_artist_intro=" + sq_artist_intro + "]";
	}
	
	

}
