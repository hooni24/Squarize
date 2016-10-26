package squarize.vo;

public class SQ_human {
	private String sq_member_id;
	private String sq_member_name;
	private String sq_member_email;
	private String sq_member_favorite;
	private String sq_member_isartist;
	private String sq_artist_phone="";
	private String sq_artist_photo = "";
	private String sq_artist_intro="";
	private int sq_port_id;
	private String sq_port_inst;
	private String sq_port_career;
	private String sq_port_pr;
	private String sq_port_file = "";
	
	public SQ_human() {}

	public String getSq_member_id() {
		return sq_member_id;
	}

	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
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
	
	public int getSq_port_id() {
		return sq_port_id;
	}

	public void setSq_port_id(int sq_port_id) {
		this.sq_port_id = sq_port_id;
	}

	public String getSq_port_inst() {
		return sq_port_inst;
	}

	public void setSq_port_inst(String sq_port_inst) {
		this.sq_port_inst = sq_port_inst;
	}

	public String getSq_port_career() {
		return sq_port_career;
	}

	public void setSq_port_career(String sq_port_career) {
		this.sq_port_career = sq_port_career;
	}

	public String getSq_port_pr() {
		return sq_port_pr;
	}

	public void setSq_port_pr(String sq_port_pr) {
		this.sq_port_pr = sq_port_pr;
	}

	public String getSq_port_file() {
		return sq_port_file;
	}

	public void setSq_port_file(String sq_port_file) {
		this.sq_port_file = sq_port_file;
	}

	@Override
	public String toString() {
		return "SQ_human [sq_member_id=" + sq_member_id + ", sq_member_name="
				+ sq_member_name + ", sq_member_email=" + sq_member_email + ", sq_member_favorite=" + sq_member_favorite
				+ ", sq_member_isartist=" + sq_member_isartist + ", sq_artist_phone=" + sq_artist_phone
				+ ", sq_artist_photo=" + sq_artist_photo + ", sq_artist_intro=" + sq_artist_intro + ", sq_port_id="
				+ sq_port_id + ", sq_port_inst=" + sq_port_inst + ", sq_port_career=" + sq_port_career + ", sq_port_pr="
				+ sq_port_pr + ", sq_port_file=" + sq_port_file + "]";
	}

	
	

}
