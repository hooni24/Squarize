package squarize.vo;

public class SQ_recruit_artist {
	private String sq_member_id;
	private String sq_member_name;
	private String sq_member_email;
	private String sq_artist_photo;
	private String sq_artist_phone;
	private int sq_recruit_id;
	private String sq_recruit_title;
	private String sq_recruit_location;
	private String sq_recruit_info;
	private String sq_recruit_input_date;
	private String sq_recruit_date;
	private String sq_recruit_genre;
	private String sq_recruit_part;
	private String sq_recruit_photo;
	private String sq_recruit_latitude;
	private String sq_recruit_longitude;
	
	public SQ_recruit_artist(){}

	public String getSq_member_id() {
		return sq_member_id;
	}

	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}

	public String getSq_member_email() {
		return sq_member_email;
	}
	
	public String getSq_member_name() {
		return sq_member_name;
	}

	public void setSq_member_name(String sq_member_name) {
		this.sq_member_name = sq_member_name;
	}

	public void setSq_member_email(String sq_member_email) {
		this.sq_member_email = sq_member_email;
	}

	public String getSq_artist_photo() {
		return sq_artist_photo;
	}

	public void setSq_artist_photo(String sq_artist_photo) {
		this.sq_artist_photo = sq_artist_photo;
	}

	public String getSq_artist_phone() {
		return sq_artist_phone;
	}

	public void setSq_artist_phone(String sq_artist_phone) {
		this.sq_artist_phone = sq_artist_phone;
	}

	public int getSq_recruit_id() {
		return sq_recruit_id;
	}

	public void setSq_recruit_id(int sq_recruit_id) {
		this.sq_recruit_id = sq_recruit_id;
	}
	
	public String getSq_recruit_title() {
		return sq_recruit_title;
	}

	public void setSq_recruit_title(String sq_recruit_title) {
		this.sq_recruit_title = sq_recruit_title;
	}

	public String getSq_recruit_location() {
		return sq_recruit_location;
	}

	public void setSq_recruit_location(String sq_recruit_location) {
		this.sq_recruit_location = sq_recruit_location;
	}

	public String getSq_recruit_info() {
		return sq_recruit_info;
	}

	public void setSq_recruit_info(String sq_recruit_info) {
		this.sq_recruit_info = sq_recruit_info;
	}

	public String getSq_recruit_input_date() {
		return sq_recruit_input_date;
	}

	public void setSq_recruit_input_date(String sq_recruit_input_date) {
		this.sq_recruit_input_date = sq_recruit_input_date;
	}

	public String getSq_recruit_date() {
		return sq_recruit_date;
	}

	public void setSq_recruit_date(String sq_recruit_date) {
		this.sq_recruit_date = sq_recruit_date;
	}

	public String getSq_recruit_genre() {
		return sq_recruit_genre;
	}

	public void setSq_recruit_genre(String sq_recruit_genre) {
		this.sq_recruit_genre = sq_recruit_genre;
	}

	public String getSq_recruit_part() {
		return sq_recruit_part;
	}

	public void setSq_recruit_part(String sq_recruit_part) {
		this.sq_recruit_part = sq_recruit_part;
	}

	public String getSq_recruit_photo() {
		return sq_recruit_photo;
	}
	
	public void setSq_recruit_photo(String sq_recruit_photo) {
		this.sq_recruit_photo = sq_recruit_photo;
	}
	
	public String getSq_recruit_latitude() {
		return sq_recruit_latitude;
	}

	public void setSq_recruit_latitude(String sq_recruit_latitude) {
		this.sq_recruit_latitude = sq_recruit_latitude;
	}

	public String getSq_recruit_longitude() {
		return sq_recruit_longitude;
	}

	public void setSq_recruit_longitude(String sq_recruit_longitude) {
		this.sq_recruit_longitude = sq_recruit_longitude;
	}

	@Override
	public String toString() {
		return "SQ_recruit_artist [sq_member_id=" + sq_member_id + ", sq_member_name=" + sq_member_name
				+ ", sq_member_email=" + sq_member_email + ", sq_artist_photo=" + sq_artist_photo + ", sq_artist_phone="
				+ sq_artist_phone + ", sq_recruit_id=" + sq_recruit_id + ", sq_recruit_title=" + sq_recruit_title
				+ ", sq_recruit_location=" + sq_recruit_location + ", sq_recruit_info=" + sq_recruit_info
				+ ", sq_recruit_input_date=" + sq_recruit_input_date + ", sq_recruit_date=" + sq_recruit_date
				+ ", sq_recruit_genre=" + sq_recruit_genre + ", sq_recruit_part=" + sq_recruit_part
				+ ", sq_recruit_photo=" + sq_recruit_photo + ", sq_recruit_latitude=" + sq_recruit_latitude
				+ ", sq_recruit_longitude=" + sq_recruit_longitude + "]";
	}
	
}
