package squarize.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.json.annotations.JSON;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_buskingDAO;
import squarize.vo.SQ_busking;

public class SQ_buskingAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private SQ_busking SQ_busking;
	private List<SQ_busking> buskingList;
	
	private JSONObject jsonData;
	private String source;

	public String buskingList(){
		System.out.println("SQ_buskingAction의 buskingList");
		buskingList = new ArrayList<>();
		
		SQ_buskingDAO dao = new SQ_buskingDAO();
		buskingList = dao.buskingList();
		System.out.println("ㅋㅋ" + buskingList);
		
		
/*		source = "{"+
							"data:["+
									"{"+
										"\"id\": \"1\","+
										"\"title\": \"밤을 잊은 그대에게 -베이스세션\","+
										"\"location\": \"홍대입구\","+
										"\"latitude\": \"37.5564059\","+
										"\"longitude\": \"126.9259563\","+
										"\"url\": \"assets/pages/items/1_e.html\","+
										"\"genre\": \"헤비메탈\","+
										"\"type_icon\": \"\","+
										"\"rating\": \"4\","+
										"\"gallery\": ["+
											"\"assets/img/items/1.jpg\","+
											"\"assets/img/items/2.jpg\","+
											"\"assets/img/items/3.jpg\""+
										"],"+
										"\"price\": \"$2500\","+
										"\"overview\": {"+
											"\"bedrooms\": \"2\","+
											"\"bathrooms\": \"2\","+
											"\"rooms\": \"4\","+
											"\"garages\": \"1\","+
											"\"area\": \"240\""+
										"},"+
										"\"description\": \"Curabitur odio nibh, luctus non pulvinar a, ultricies ac diam. Donec neque massa, viverra interdum eros ut, imperdiet pellentesque mauris. Proin sit amet scelerisque risus. Donec semper semper erat ut mollis. Curabitur suscipit, justo eu dignissim lacinia, ante sapien pharetra duin consectetur eros augue sed ex. Donec a odio rutrum, hendrerit sapien vitae, euismod arcu.\""+
									"}"+
								"]"+
						"}";*/
		
		
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	public SQ_busking getSQ_busking() {
		return SQ_busking;
	}

	public void setSQ_busking(SQ_busking sQ_busking) {
		SQ_busking = sQ_busking;
	}

	public List<SQ_busking> getBuskingList() {
		return buskingList;
	}

	public void setBuskingList(List<SQ_busking> buskingList) {
		this.buskingList = buskingList;
	}

	public JSONObject getJsonData() {
		return jsonData;
	}

	public void setJsonData(JSONObject jsonData) {
		this.jsonData = jsonData;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
	

}
