package squarize.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
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
   private ArrayList<String> buskingArraylist;
   private int sq_busking_id;
   SQ_buskingDAO dao = new SQ_buskingDAO();
   

   public String buskingList(){
      System.out.println("SQ_buskingAction의 buskingList");
      buskingList = new ArrayList<>();
      buskingList = dao.buskingList();
      buskingArraylist = new ArrayList<>();
      
			      	for (int i = 0; i < buskingList.size(); i++) {                              
			      		source = "{"+                                                           
			      				"\"sq_busking_id\": " + buskingList.get(i).getSq_busking_id() +", "+        
			      				"\"id\": \"" + buskingList.get(i).getId() +"\", "+                  
			      				"\"title\": \""+ buskingList.get(i).getTitle() + "\", "+                           
			      				"\"location\": \"" + buskingList.get(i).getLocation()+"\", "+                                     
			      				"\"latitude\": "+buskingList.get(i).getLatitude()+", "+                                   
			      				"\"longitude\": "+buskingList.get(i).getLongitude()+", "+                                 
			      				"\"url\": \""+ buskingList.get(i).getUrl()+"\", "+                   
			      				"\"genre\": \""+ buskingList.get(i).getGenre()+"\", "+                                        
			      				"\"rating\": "+ buskingList.get(i).getRating()+", "+                                              
			      				"\"teamname\": \"" + buskingList.get(i).getTeamname() +"\", "+                                              
			      				"\"gallery\": \""+ buskingList.get(i).getGallery()+"\", "+                    
			      				"\"buskingdate\": \""+ buskingList.get(i).getBuskingdate()+"\", "+                               
			      				"\"runningtime\": \""+ buskingList.get(i).getRunningtime()+"\", "+                               
			      				"\"description\": \""+ buskingList.get(i).getDescription()+"\""+                     
			      				"}";            
			      		
			      			buskingArraylist.add(source);
					}                                                                           
			      	System.out.println(buskingArraylist);
			                                                                                    
      
      return SUCCESS;
   }
   
   public String buskingDetail(){
	   System.out.println("SQ_buskingAction의 buskingDetail()");
	   System.out.println("sq_busking_id: " + sq_busking_id);
	   SQ_busking = dao.buskingDetail(sq_busking_id);
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

	public ArrayList<String> getBuskingArraylist() {
		return buskingArraylist;
	}
	
	public void setBuskingArraylist(ArrayList<String> buskingArraylist) {
		this.buskingArraylist = buskingArraylist;
	}
	
	public int getSq_busking_id() {
		return sq_busking_id;
	}
	
	public void setSq_busking_id(int sq_busking_id) {
		this.sq_busking_id = sq_busking_id;
	}
}