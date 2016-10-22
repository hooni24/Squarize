package squarize.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_rentDAO;
import squarize.util.FileService;
import squarize.vo.SQ_artist;
import squarize.vo.SQ_human;
import squarize.vo.SQ_member;
import squarize.vo.SQ_rent;
import squarize.vo.SQ_rent_apply;

public class SQ_rentAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private SQ_rent rent;
	private SQ_member member;
	private SQ_artist artist;
	private List<SQ_rent> rentList;
	private List<SQ_human> humanList;
	
	private File upload;					// 업로드할 파일. Form의 <file> 태그의 name. 
	private String uploadFileName;			// 업로드할 파일의 파일명 (File타입 속성명 + "FileName") 
	private String uploadContentType;		// 업로드할 파일의 컨텐츠 타입 (File타입 속성명 + "ContentType") 
	private SQ_rent_apply rent_apply;
	
	
	
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
		rent.setSq_member_id((String) session.get("loginId"));
		
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
		
		System.out.println(rent);
		return SUCCESS;
	}
	
	/**
	 * 대관게시물 읽기
	 */
	public String toRentDetail(){
		Object[] result = new SQ_rentDAO().getRentById(rent);
		member = (SQ_member) result[0];
		rent = (SQ_rent) result[1];
		artist = (SQ_artist) result[2];
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
		SQ_rentDAO dao = new SQ_rentDAO();
		dao.updateWithoutFile(rent);
		if (upload != null) { 	//새로 올린 사진이 있다면 수정해야함
			rent = (SQ_rent) dao.getRentById(rent)[1];	//ID로 얻어온 rent객체
			try {
				FileService fs = new FileService();
				String basePath = getText("rent.uploadpath");
				String savedfile;
				String fullpath = basePath +"/"+ rent.getSq_rent_photo();	//수정대상의 사진파일 전체경로
				new FileService().fileDelete(fullpath);						//삭제
				savedfile = fs.saveFile(upload, basePath, uploadFileName);
				rent.setSq_rent_photo(savedfile);
				rent.setSq_rent_photo_original(uploadFileName);
				dao.updateRentPhoto(rent);	//새로올라온 파일경로 저장
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}
	
	/**
	 * 대관 지원여부 확인
	 */
	public String checkRentApply(){
		rent_apply = new SQ_rent_apply();
		rent_apply.setSq_rent_id(rent.getSq_rent_id());
		rent_apply.setSq_member_id((String) session.get("loginId"));
		rent_apply = new SQ_rentDAO().checkRentApply(rent_apply);
		System.out.println(rent_apply);
		return SUCCESS;
	}
	
	/**
	 * 대관 지원
	 */
	public String rentApply(){
		rent_apply = new SQ_rent_apply();
		rent_apply.setSq_rent_id(rent.getSq_rent_id());
		rent_apply.setSq_member_id((String) session.get("loginId"));
		new SQ_rentDAO().rentApply(rent_apply);
		return SUCCESS;
	}
	
	/**
	 * 전체 지원현황 보기
	 */
	public String rentApplySituation(){
		rentList = new SQ_rentDAO().rentApplySituation((String) session.get("loginId"));
		return SUCCESS;
	}
	
	/**
	 * 해당 글 지원자 보기
	 */
	public String seeRentApply(){
		humanList = new SQ_rentDAO().seeRentApply(rent.getSq_rent_id());
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

	public SQ_artist getArtist() {
		return artist;
	}

	public void setArtist(SQ_artist artist) {
		this.artist = artist;
	}

	public SQ_rent_apply getRent_apply() {
		return rent_apply;
	}

	public void setRent_apply(SQ_rent_apply rent_apply) {
		this.rent_apply = rent_apply;
	}

	public List<SQ_human> getHumanList() {
		return humanList;
	}

	public void setHumanList(List<SQ_human> humanList) {
		this.humanList = humanList;
	}


}
