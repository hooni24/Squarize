package squarize.vo;

public class SQ_busking {
	private int SQ_BUSKING_ID;
	private String SQ_MEMBER_ID;
	private String SQ_BUSKING_GENRE;
	private String SQ_BUSKING_DATE;
	private int SQ_BUSKING_RUNNINGTIME;
	private int SQ_BUSKING_LAT;
	private int SQ_BUSKING_LNG;
	private String SQ_BUSKING_FILE1;
	private String SQ_BUSKING_FILE2;
	private String SQ_BUSKING_FILE3;
	private String SQ_BUSKING_FILE4;
	private String SQ_BUSKING_FILE5;

	public SQ_busking() {
		// TODO Auto-generated constructor stub
	}

	public SQ_busking(int sQ_BUSKING_ID, String sQ_MEMBER_ID, String sQ_BUSKING_GENRE, String sQ_BUSKING_DATE,
			int sQ_BUSKING_RUNNINGTIME, int sQ_BUSKING_LAT, int sQ_BUSKING_LNG, String sQ_BUSKING_FILE1,
			String sQ_BUSKING_FILE2, String sQ_BUSKING_FILE3, String sQ_BUSKING_FILE4, String sQ_BUSKING_FILE5) {
		super();
		SQ_BUSKING_ID = sQ_BUSKING_ID;
		SQ_MEMBER_ID = sQ_MEMBER_ID;
		SQ_BUSKING_GENRE = sQ_BUSKING_GENRE;
		SQ_BUSKING_DATE = sQ_BUSKING_DATE;
		SQ_BUSKING_RUNNINGTIME = sQ_BUSKING_RUNNINGTIME;
		SQ_BUSKING_LAT = sQ_BUSKING_LAT;
		SQ_BUSKING_LNG = sQ_BUSKING_LNG;
		SQ_BUSKING_FILE1 = sQ_BUSKING_FILE1;
		SQ_BUSKING_FILE2 = sQ_BUSKING_FILE2;
		SQ_BUSKING_FILE3 = sQ_BUSKING_FILE3;
		SQ_BUSKING_FILE4 = sQ_BUSKING_FILE4;
		SQ_BUSKING_FILE5 = sQ_BUSKING_FILE5;
	}

	public int getSQ_BUSKING_ID() {
		return SQ_BUSKING_ID;
	}

	public void setSQ_BUSKING_ID(int sQ_BUSKING_ID) {
		SQ_BUSKING_ID = sQ_BUSKING_ID;
	}

	public String getSQ_MEMBER_ID() {
		return SQ_MEMBER_ID;
	}

	public void setSQ_MEMBER_ID(String sQ_MEMBER_ID) {
		SQ_MEMBER_ID = sQ_MEMBER_ID;
	}

	public String getSQ_BUSKING_GENRE() {
		return SQ_BUSKING_GENRE;
	}

	public void setSQ_BUSKING_GENRE(String sQ_BUSKING_GENRE) {
		SQ_BUSKING_GENRE = sQ_BUSKING_GENRE;
	}

	public String getSQ_BUSKING_DATE() {
		return SQ_BUSKING_DATE;
	}

	public void setSQ_BUSKING_DATE(String sQ_BUSKING_DATE) {
		SQ_BUSKING_DATE = sQ_BUSKING_DATE;
	}

	public int getSQ_BUSKING_RUNNINGTIME() {
		return SQ_BUSKING_RUNNINGTIME;
	}

	public void setSQ_BUSKING_RUNNINGTIME(int sQ_BUSKING_RUNNINGTIME) {
		SQ_BUSKING_RUNNINGTIME = sQ_BUSKING_RUNNINGTIME;
	}

	public int getSQ_BUSKING_LAT() {
		return SQ_BUSKING_LAT;
	}

	public void setSQ_BUSKING_LAT(int sQ_BUSKING_LAT) {
		SQ_BUSKING_LAT = sQ_BUSKING_LAT;
	}

	public int getSQ_BUSKING_LNG() {
		return SQ_BUSKING_LNG;
	}

	public void setSQ_BUSKING_LNG(int sQ_BUSKING_LNG) {
		SQ_BUSKING_LNG = sQ_BUSKING_LNG;
	}

	public String getSQ_BUSKING_FILE1() {
		return SQ_BUSKING_FILE1;
	}

	public void setSQ_BUSKING_FILE1(String sQ_BUSKING_FILE1) {
		SQ_BUSKING_FILE1 = sQ_BUSKING_FILE1;
	}

	public String getSQ_BUSKING_FILE2() {
		return SQ_BUSKING_FILE2;
	}

	public void setSQ_BUSKING_FILE2(String sQ_BUSKING_FILE2) {
		SQ_BUSKING_FILE2 = sQ_BUSKING_FILE2;
	}

	public String getSQ_BUSKING_FILE3() {
		return SQ_BUSKING_FILE3;
	}

	public void setSQ_BUSKING_FILE3(String sQ_BUSKING_FILE3) {
		SQ_BUSKING_FILE3 = sQ_BUSKING_FILE3;
	}

	public String getSQ_BUSKING_FILE4() {
		return SQ_BUSKING_FILE4;
	}

	public void setSQ_BUSKING_FILE4(String sQ_BUSKING_FILE4) {
		SQ_BUSKING_FILE4 = sQ_BUSKING_FILE4;
	}

	public String getSQ_BUSKING_FILE5() {
		return SQ_BUSKING_FILE5;
	}

	public void setSQ_BUSKING_FILE5(String sQ_BUSKING_FILE5) {
		SQ_BUSKING_FILE5 = sQ_BUSKING_FILE5;
	}

	@Override
	public String toString() {
		return "SQ_busking [SQ_BUSKING_ID=" + SQ_BUSKING_ID + ", SQ_MEMBER_ID=" + SQ_MEMBER_ID + ", SQ_BUSKING_GENRE="
				+ SQ_BUSKING_GENRE + ", SQ_BUSKING_DATE=" + SQ_BUSKING_DATE + ", SQ_BUSKING_RUNNINGTIME="
				+ SQ_BUSKING_RUNNINGTIME + ", SQ_BUSKING_LAT=" + SQ_BUSKING_LAT + ", SQ_BUSKING_LNG=" + SQ_BUSKING_LNG
				+ ", SQ_BUSKING_FILE1=" + SQ_BUSKING_FILE1 + ", SQ_BUSKING_FILE2=" + SQ_BUSKING_FILE2
				+ ", SQ_BUSKING_FILE3=" + SQ_BUSKING_FILE3 + ", SQ_BUSKING_FILE4=" + SQ_BUSKING_FILE4
				+ ", SQ_BUSKING_FILE5=" + SQ_BUSKING_FILE5 + "]";
	}

}
