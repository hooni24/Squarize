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

	@Override
	public String toString() {
		return "SQ_favorite [sq_member_id=" + sq_member_id + ", sq_favorite_genre=" + sq_favorite_genre
				+ ", sq_favorite_location=" + sq_favorite_location + ", sq_favorite_inst=" + sq_favorite_inst + "]";
	}
	
	
	
	
}
