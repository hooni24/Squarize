package squarize.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_rentDAO;
import squarize.util.FileService;
import squarize.vo.SQ_member;
import squarize.vo.SQ_rent;

public class SQ_rentAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private SQ_rent rent;
	private SQ_member member;
	private List<SQ_rent> rentList;
	
	
	private File upload;					// 업로드할 파일. Form의 <file> 태그의 name. 
	private String uploadFileName;			// 업로드할 파일의 파일명 (File타입 속성명 + "FileName") 
	private String uploadContentType;		// 업로드할 파일의 컨텐츠 타입 (File타입 속성명 + "ContentType") 
	
	
	
	public String execute(){
		return SUCCESS;
	}
	
	/**
	 * 전체 대관모집 게시물 불러오기.
	 */
	public String getAllRent(){
		
		
		//이 부분 또는 SQ_rentDAO().getAllRent()에 선호도에 따라 order by 정하는 알고리즘 필요. 일단은 올린 순서대로 뽑아옴
		
		rentList = new SQ_rentDAO().getAllRent();
		return SUCCESS;
	}
	
	/**
	 * 대관모집 게시물 등록. 같이올린 사진파일을 원본이름과 날짜붙인이름 2가지로 저장한다.
	 */
	public String insertRent(){
//		rent.setSq_member_id((String) session.get("loginId"));
		
		rent.setSq_member_id("aa");		//테스트용
		
		if (upload != null) { 
			try {
				FileService fs = new FileService();
				String basePath = getText("rent.uploadpath");
				String savedfile;
				savedfile = fs.saveFile(upload, basePath, uploadFileName);
				rent.setSq_rent_photo(savedfile);
				rent.setSq_rent_photo_original(uploadFileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		new SQ_rentDAO().insertRent(rent);
		return SUCCESS;
	}
	
	/**
	 * 대관게시물 읽기
	 */
	public String toRentDetail(){
		Object[] result = new SQ_rentDAO().getRentById(rent);
		member = (SQ_member) result[0];
		rent = (SQ_rent) result[1];
		return SUCCESS;
	}
	
	/**
	 * 대관게시물 삭제
	 */
	public String deleteRent(){
		new SQ_rentDAO().deleteRent(rent);
		return SUCCESS;
	}
	
	/**
	 * 대관게시물 수정
	 */
	public String updateRent(){
		
		return SUCCESS;
	}
	
	
	
	
	
	

	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	public SQ_rent getRent() {
		return rent;
	}

	public void setRent(SQ_rent rent) {
		this.rent = rent;
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

	public List<SQ_rent> getRentList(){
		return rentList;
	}
	
	public void setRentList(List<SQ_rent> rentList) {
		this.rentList = rentList;
	}

	public SQ_member getMember() {
		return member;
	}

	public void setMember(SQ_member member) {
		this.member = member;
	}
	


}
