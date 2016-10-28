package squarize.vo;

public class SQ_ad {
	String sq_ad_id;
	String sq_ad_title;
	String sq_ad_file;
	String sq_ad_url;
	String sq_ad_part;
	
	public SQ_ad() {}

	public String getSq_ad_id() {
		return sq_ad_id;
	}

	public void setSq_ad_id(String sq_ad_id) {
		this.sq_ad_id = sq_ad_id;
	}

	public String getSq_ad_title() {
		return sq_ad_title;
	}

	public void setSq_ad_title(String sq_ad_title) {
		this.sq_ad_title = sq_ad_title;
	}

	public String getSq_ad_file() {
		return sq_ad_file;
	}

	public void setSq_ad_file(String sq_ad_file) {
		this.sq_ad_file = sq_ad_file;
	}

	public String getSq_ad_url() {
		return sq_ad_url;
	}

	public void setSq_ad_url(String sq_ad_url) {
		this.sq_ad_url = sq_ad_url;
	}

	public String getSq_ad_part() {
		return sq_ad_part;
	}

	public void setSq_ad_part(String sq_ad_part) {
		this.sq_ad_part = sq_ad_part;
	}

	@Override
	public String toString() {
		return "SQ_ad [sq_ad_id=" + sq_ad_id + ", sq_ad_title=" + sq_ad_title + ", sq_ad_file=" + sq_ad_file
				+ ", sq_ad_url=" + sq_ad_url + ", sq_ad_part=" + sq_ad_part + "]";
	}
	
	

}
