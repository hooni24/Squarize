package squarize.action;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_buskingDAO;
import squarize.util.FileService;
import squarize.vo.SQ_busking;

public class SQ_buskingAction extends ActionSupport implements SessionAware {
   private Map<String, Object> session;
   private SQ_busking SQ_busking;
   private List<SQ_busking> buskingList;
   private String b_hour;
   private String b_min;
   
   private JSONObject jsonData;
   private String source;
   private ArrayList<String> buskingArraylist;
   private int sq_busking_id;
   SQ_buskingDAO dao = new SQ_buskingDAO();
   
   private File upload;					// 업로드할 파일. Form의 <file> 태그의 name. 
   private String uploadFileName;			// 업로드할 파일의 파일명 (File타입 속성명 + "FileName") 
   private String uploadContentType;		// 업로드할 파일의 컨텐츠 타입 (File타입 속성명 + "ContentType") 
   private String genre;
   
   
   public String execute(){
	   return SUCCESS;
   }

   public String searchList(){
	   System.out.println(genre);
	   buskingList = new ArrayList<>();
	      buskingList = dao.searchList(genre);
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
	      return SUCCESS;
   }
   
   public String buskingList(){
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
      return SUCCESS;
   }
   
   public String buskingDetail(){
	   SQ_busking = dao.buskingDetail(sq_busking_id);
	   return SUCCESS;
   }
   
   @SuppressWarnings("deprecation")
public String addBusking(){
	   if (upload != null) { 
			try {
				FileService fs = new FileService();
				String basePath = getText("busking.uploadpath");
				String savedfile;
				savedfile = fs.saveFile(upload, basePath, uploadFileName);
				SQ_busking.setGallery(savedfile);
				System.out.println(SQ_busking.getGallery());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	   SQ_busking.setId((String) session.get("loginId"));
	   
	   String date = SQ_busking.getBuskingdate();
	   String fullDate = date + " " + b_hour + ":" + b_min + ":00";
	   SQ_busking.setBuskingdate(fullDate);
	   System.out.println(fullDate);
	   ////////////////////////////////// 공연시작시간과 러닝타임으로 끝나는 시간 가져오기
	    String start = fullDate;
	    String end = null;
	    try {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date beginDate = formatter.parse(start);

	        if(SQ_busking.getRunningtime() == 60){
	        	long finishTime = beginDate.getTime() + 3600000;
	        	end = formatter.format(finishTime);
	        	System.out.println("end: " + end);
	        }else if(SQ_busking.getRunningtime() == 120){
	        	long finishTime = beginDate.getTime() + 7200000;
	        	end = formatter.format(finishTime);
	        	System.out.println("end: " + end);
	        }
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	   SQ_busking.setEnd(end);
	   System.out.println("뭐가 들었니?: " + SQ_busking);
	   dao.addBusking(SQ_busking);
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

	public String getB_hour() {
		return b_hour;
	}

	public void setB_hour(String b_hour) {
		this.b_hour = b_hour;
	}

	public String getB_min() {
		return b_min;
	}

	public void setB_min(String b_min) {
		this.b_min = b_min;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getSearchResult() {
		return genre;
	}

	public void setSearchResult(String searchResult) {
		this.genre = searchResult;
	}
	
}