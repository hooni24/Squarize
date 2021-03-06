package squarize.vo;

public class SQ_rent {
	private String sq_rent_id;
	private String sq_member_id;
	private String sq_rent_band_name;
	private String sq_rent_concert_date;
	private String sq_rent_input_date;
	private String sq_rent_limit;
	private String sq_rent_info;
	private String sq_rent_photo = "";
	private String sq_rent_photo_original = "";
	private String sq_rent_region;
	private String sq_rent_genre;
	private int sq_rent_running_time;
	private int sq_rent_team_count;
	private double sq_rent_lat;
	private double sq_rent_lng;
	
	private double latRange;
	private double lngRange;
	private int range;
	
	
	public SQ_rent() {}

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

	public String getSq_rent_photo_original() {
		return sq_rent_photo_original;
	}

	public void setSq_rent_photo_original(String sq_rent_photo_original) {
		this.sq_rent_photo_original = sq_rent_photo_original;
	}

	public String getSq_rent_concert_date() {
		return sq_rent_concert_date;
	}

	public void setSq_rent_concert_date(String sq_rent_concert_date) {
		this.sq_rent_concert_date = sq_rent_concert_date;
	}

	public String getSq_rent_region() {
		return sq_rent_region;
	}

	public void setSq_rent_region(String sq_rent_region) {
		this.sq_rent_region = sq_rent_region;
	}

	public String getSq_rent_genre() {
		return sq_rent_genre;
	}

	public void setSq_rent_genre(String sq_rent_genre) {
		this.sq_rent_genre = sq_rent_genre;
	}

	public int getSq_rent_running_time() {
		return sq_rent_running_time;
	}

	public void setSq_rent_running_time(int sq_rent_running_time) {
		this.sq_rent_running_time = sq_rent_running_time;
	}

	public int getSq_rent_team_count() {
		return sq_rent_team_count;
	}

	public void setSq_rent_team_count(int sq_rent_team_count) {
		this.sq_rent_team_count = sq_rent_team_count;
	}

	public double getSq_rent_lat() {
		return sq_rent_lat;
	}

	public void setSq_rent_lat(double sq_rent_lat) {
		this.sq_rent_lat = sq_rent_lat;
	}

	public double getSq_rent_lng() {
		return sq_rent_lng;
	}

	public void setSq_rent_lng(double sq_rent_lng) {
		this.sq_rent_lng = sq_rent_lng;
	}

	public double getLatRange() {
		return latRange;
	}

	public void setLatRange(double latRange) {
		this.latRange = latRange;
	}

	public double getLngRange() {
		return lngRange;
	}

	public void setLngRange(double lngRange) {
		this.lngRange = lngRange;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	@Override
	public String toString() {
		return "SQ_rent [sq_rent_id=" + sq_rent_id + ", sq_member_id=" + sq_member_id + ", sq_rent_band_name="
				+ sq_rent_band_name + ", sq_rent_concert_date=" + sq_rent_concert_date + ", sq_rent_input_date="
				+ sq_rent_input_date + ", sq_rent_limit=" + sq_rent_limit + ", sq_rent_info=" + sq_rent_info
				+ ", sq_rent_photo=" + sq_rent_photo + ", sq_rent_photo_original=" + sq_rent_photo_original
				+ ", sq_rent_region=" + sq_rent_region + ", sq_rent_genre=" + sq_rent_genre + ", sq_rent_running_time="
				+ sq_rent_running_time + ", sq_rent_team_count=" + sq_rent_team_count + ", sq_rent_lat=" + sq_rent_lat
				+ ", sq_rent_lng=" + sq_rent_lng + ", latRange=" + latRange + ", lngRange=" + lngRange + ", range="
				+ range + "]";
	}




	

}
