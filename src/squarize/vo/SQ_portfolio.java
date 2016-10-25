package squarize.vo;

public class SQ_portfolio {
	private int sq_port_id;
	private String sq_member_id;
	private String sq_port_inst;
	private String sq_port_career;
	private String sq_port_pr;
	private String sq_port_file = "";
	private String sq_port_media = "";
	
	public SQ_portfolio() {}

	public int getSq_port_id() {
		return sq_port_id;
	}

	public void setSq_port_id(int sq_port_id) {
		this.sq_port_id = sq_port_id;
	}

	public String getSq_member_id() {
		return sq_member_id;
	}

	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
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

	public String getSq_port_media() {
		return sq_port_media;
	}

	public void setSq_port_media(String sq_port_media) {
		this.sq_port_media = sq_port_media;
	}

	@Override
	public String toString() {
		return "SQ_portfolio [sq_port_id=" + sq_port_id + ", sq_member_id=" + sq_member_id + ", sq_port_inst="
				+ sq_port_inst + ", sq_port_career=" + sq_port_career + ", sq_port_pr=" + sq_port_pr + ", sq_port_file="
				+ sq_port_file + ", sq_port_media=" + sq_port_media + "]";
	}

}
