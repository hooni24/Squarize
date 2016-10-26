package squarize.vo;

public class SQ_count {
	private String busking;
	private String seeking;
	private String rent;
	
	public SQ_count() {}

	public String getBusking() {
		return busking;
	}

	public void setBusking(String busking) {
		this.busking = busking;
	}

	public String getSeeking() {
		return seeking;
	}

	public void setSeeking(String seeking) {
		this.seeking = seeking;
	}

	public String getRent() {
		return rent;
	}

	public void setRent(String rent) {
		this.rent = rent;
	}

	@Override
	public String toString() {
		return "SQ_count [busking=" + busking + ", seeking=" + seeking + ", rent=" + rent + "]";
	}
	
	

}
