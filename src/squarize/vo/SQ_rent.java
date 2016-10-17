package squarize.vo;

public class SQ_rent {
	private String sq_rent_id;
	private String sq_member_id;
	private String sq_rent_band_name;
	private String sq_rent_input_date;
	private String sq_rent_limit;
	private String sq_rent_info;
	private String sq_rent_photo;
	
	public SQ_rent() {}

	public SQ_rent(String sq_rent_id, String sq_member_id, String sq_rent_band_name, String sq_rent_input_date,
			String sq_rent_limit, String sq_rent_info, String sq_rent_photo) {
		super();
		this.sq_rent_id = sq_rent_id;
		this.sq_member_id = sq_member_id;
		this.sq_rent_band_name = sq_rent_band_name;
		this.sq_rent_input_date = sq_rent_input_date;
		this.sq_rent_limit = sq_rent_limit;
		this.sq_rent_info = sq_rent_info;
		this.sq_rent_photo = sq_rent_photo;
	}

	public String getSq_rent_id() {
		return sq_rent_id;
	}

	public void setSq_rent_id(String sq_rent_id) {
		this.sq_rent_id = sq_rent_id;
	}

	public String getSq_member_id() {
		return sq_member_id;
	}

	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}

	public String getSq_rent_band_name() {
		return sq_rent_band_name;
	}

	public void setSq_rent_band_name(String sq_rent_band_name) {
		this.sq_rent_band_name = sq_rent_band_name;
	}

	public String getSq_rent_input_date() {
		return sq_rent_input_date;
	}

	public void setSq_rent_input_date(String sq_rent_input_date) {
		this.sq_rent_input_date = sq_rent_input_date;
	}

	public String getSq_rent_limit() {
		return sq_rent_limit;
	}

	public void setSq_rent_limit(String sq_rent_limit) {
		this.sq_rent_limit = sq_rent_limit;
	}

	public String getSq_rent_info() {
		return sq_rent_info;
	}

	public void setSq_rent_info(String sq_rent_info) {
		this.sq_rent_info = sq_rent_info;
	}

	public String getSq_rent_photo() {
		return sq_rent_photo;
	}

	public void setSq_rent_photo(String sq_rent_photo) {
		this.sq_rent_photo = sq_rent_photo;
	}

	@Override
	public String toString() {
		return "SQ_rent [sq_rent_id=" + sq_rent_id + ", sq_member_id=" + sq_member_id + ", sq_rent_band_name="
				+ sq_rent_band_name + ", sq_rent_input_date=" + sq_rent_input_date + ", sq_rent_limit=" + sq_rent_limit
				+ ", sq_rent_info=" + sq_rent_info + ", sq_rent_photo=" + sq_rent_photo + "]";
	}
	
}
