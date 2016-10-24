package squarize.vo;

public class SQ_favorite {
	private String sq_member_id;
	private String sq_favorite_genre;
	private String sq_favorite_location;
	private String sq_favorite_inst;
	
	
	public SQ_favorite() {
		// TODO Auto-generated constructor stub
	}
	
	public SQ_favorite(String sq_member_id, String sq_favorite_genre, String sq_favorite_location,
			String sq_favorite_inst) {
		super();
		this.sq_member_id = sq_member_id;
		this.sq_favorite_genre = sq_favorite_genre;
		this.sq_favorite_location = sq_favorite_location;
		this.sq_favorite_inst = sq_favorite_inst;
	}
	
	

	public String getSq_member_id() {
		return sq_member_id;
	}

	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}

	public String getSq_favorite_genre() {
		return sq_favorite_genre;
	}

	public void setSq_favorite_genre(String sq_favorite_genre) {
		this.sq_favorite_genre = sq_favorite_genre;
	}

	public String getSq_favorite_location() {
		return sq_favorite_location;
	}

	public void setSq_favorite_location(String sq_favorite_location) {
		this.sq_favorite_location = sq_favorite_location;
	}

	public String getSq_favorite_inst() {
		return sq_favorite_inst;
	}

	public void setSq_favorite_inst(String sq_favorite_inst) {
		this.sq_favorite_inst = sq_favorite_inst;
	}

	@Override
	public String toString() {
		return "SQ_favorite [sq_member_id=" + sq_member_id + ", sq_favorite_genre=" + sq_favorite_genre
				+ ", sq_favorite_location=" + sq_favorite_location + ", sq_favorite_inst=" + sq_favorite_inst + "]";
	}
	
	
	
	
}
