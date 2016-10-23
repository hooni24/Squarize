package squarize.util;

public class RangeCalc {
	private double latRange;
	private double lngRange;
	
	public RangeCalc(int range) {
		if(range <= 5){
			latRange = 0.043;
			lngRange = 0.018;
		}else if (range <= 10){
			latRange = 0.050;
			lngRange = 0.095;
		}else{
			latRange = 0.075;
			lngRange = 0.144;
		}
	}

	public double getLatRange() {
		return latRange;
	}
	public double getLngRange() {
		return lngRange;
	}
}
