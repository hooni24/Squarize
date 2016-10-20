package squarize.vo;

public class SQ_recruit {
	private int sq_recruit_id;	//구인정보 고유번호
	private String sq_member_id;	//회원 아이디 : 일반회원 ID
	private String sq_recruit_input_date;	//구인정보 등록 날짜
	private String sq_recruit_part;	//모집중인 악기 파트
	private String sq_recruit_photo;	//구인정보 사진 경로
	private String sq_recruit_genre;	//구인중인 장르
	private String sq_recruit_date;	//구인정보 공연날짜
	private String sq_recruit_location;	//구인정보 공연장소
	private String sq_recruit_info;		//구인정보 소개글 내용
	
	public SQ_recruit(){}

	public int getSq_recruit_id() {
		return sq_recruit_id;
	}

	public void setSq_recruit_id(int sq_recruit_id) {
		this.sq_recruit_id = sq_recruit_id;
	}

	public String getSq_member_id() {
		return sq_member_id;
	}

	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}

	public String getSq_recruit_input_date() {
		return sq_recruit_input_date;
	}

	public void setSq_recruit_input_date(String sq_recruit_input_date) {
		this.sq_recruit_input_date = sq_recruit_input_date;
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

	public String getSq_recruit_genre() {
		return sq_recruit_genre;
	}

	public void setSq_recruit_genre(String sq_recruit_genre) {
		this.sq_recruit_genre = sq_recruit_genre;
	}

	public String getSq_recruit_date() {
		return sq_recruit_date;
	}

	public void setSq_recruit_date(String sq_recruit_date) {
		this.sq_recruit_date = sq_recruit_date;
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

	@Override
	public String toString() {
		return "SQ_recruit [sq_recruit_id=" + sq_recruit_id + ", sq_member_id=" + sq_member_id
				+ ", sq_recruit_input_date=" + sq_recruit_input_date + ", sq_recruit_part=" + sq_recruit_part
				+ ", sq_recruit_photo=" + sq_recruit_photo + ", sq_recruit_genre=" + sq_recruit_genre
				+ ", sq_recruit_date=" + sq_recruit_date + ", sq_recruit_location=" + sq_recruit_location
				+ ", sq_recruit_info=" + sq_recruit_info + "]";
	}
	
}
