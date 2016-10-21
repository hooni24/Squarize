package squarize.vo;

public class SQ_artist {
	private String sq_member_id="";
	private String sq_artist_phone="";
	private String sq_artist_photo = "";
	private String sq_artist_intro="";
	
	public SQ_artist() {}

	public String getSq_member_id() {
		return sq_member_id;
	}

	public SQ_artist(String sq_member_id, String sq_artist_phone, String sq_artist_photo, String sq_artist_intro) {
		super();
		this.sq_member_id = sq_member_id;
		this.sq_artist_phone = sq_artist_phone;
		this.sq_artist_photo = sq_artist_photo;
		this.sq_artist_intro = sq_artist_intro;
	}

	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
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
		return "SQ_artist [sq_member_id=" + sq_member_id + ", sq_artist_phone=" + sq_artist_phone + ", sq_artist_photo="
				+ sq_artist_photo + ", sq_artist_intro=" + sq_artist_intro + "]";
	}
	
	
	
}
