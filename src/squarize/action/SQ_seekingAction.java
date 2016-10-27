package squarize.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_seekingDAO;
import squarize.util.FileService;
import squarize.vo.SQ_portfolio;
import squarize.vo.SQ_recruit;
import squarize.vo.SQ_recruit_apply;
import squarize.vo.SQ_recruit_artist;
import squarize.vo.SQ_rent;

public class SQ_seekingAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	//seeking 페이지에서 썸네일로 뿌릴 list멤버
//	private JsonObject json_object;
	private List<SQ_recruit> sq_recruit_list;
	private List<SQ_rent> sq_rent_list;
	private List<SQ_portfolio> sq_portfolio_list;
	private List<SQ_recruit_artist> sq_applied_list;
	

	private File upload;					// 업로드할 파일. Form의 <file> 태그의 name. 
	private String uploadFileName;			// 업로드할 파일의 파일명 (File타입 속성명 + "FileName") 
	private String uploadContentType;		// 업로드할 파일의 컨텐츠 타입 (File타입 속성명 + "ContentType") 

	private SQ_recruit_artist sq_recruit_artist;
	private SQ_recruit sq_recruit;
	private SQ_recruit_apply sq_recruit_apply;
	private SQ_portfolio sq_portfolio;
	private int result;

	private String loginId;
	private SQ_seekingDAO sdao=new SQ_seekingDAO(); 

	

	
	//SQ_seekingAction 기본 생성자
	public SQ_seekingAction(){
		System.out.println("SQ_seekingAction 생성 및 멤버초기화 됨.");	//후에 삭제
	}
	
	//구인정보리스트
	public String selectAll_SQ_recruit() throws Exception {
		System.out.println("구인정보 리스트 갖고오기 - Action");
		SQ_seekingDAO dao = new SQ_seekingDAO();
		sq_recruit_list = (List<SQ_recruit>)dao.selectAll_sq_recruit();
		System.out.println("recruit_list : "+sq_recruit_list);
		return SUCCESS;
	}
	
	//구인 상세정보
	public String selectOne_SQ_recruit_artist() throws Exception {
		System.out.println("구인 상세정보 갖고오기 - Action : " + sq_recruit_artist.getSq_recruit_id());
		SQ_seekingDAO dao = new SQ_seekingDAO();
		sq_recruit_artist = dao.selectOne_sq_recruit_artist(sq_recruit_artist.getSq_recruit_id());
		System.out.println("recruit_detail : " + sq_recruit_artist);
		return SUCCESS;
	}

	/**
	 * insertSQrecruit()
	 * 구인정보 등록 
	 * @param sq_recruit
	 * @return success
	 * */
	public String insertSQrecruit() throws Exception{
		loginId=(String)session.get("loginId");
		System.out.println(loginId);
		sq_recruit.setSq_member_id(loginId);
		if (upload != null) { 
			try {
				FileService fs = new FileService();
				String basePath = getText("sq_recruit.uploadpath");
				String savedfile;
				savedfile = fs.saveFile(upload, basePath, uploadFileName);
				sq_recruit.setSq_recruit_photo(savedfile);
				sq_recruit.setSq_recruit_photo_original(uploadFileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(sq_recruit);
		sdao.insertSQrecruit(sq_recruit);
		return SUCCESS;
	}
	
	// 해당 구인정보에 등록된 지원자 리스트 갖고 오기.
	public String selectRecruitApplyList() throws Exception {
		System.out.println("지원자 리스트 selectAll");
		SQ_seekingDAO dao = new SQ_seekingDAO();
		sq_applied_list = dao.selectRecruitApply(sq_recruit_artist.getSq_recruit_id());
		return SUCCESS;
	}
	
	// 해당 구인 정보에 지원신청 insert
	public String insertRecruitApplication() throws Exception {
		System.out.println("지원하기 insert");
		SQ_seekingDAO dao = new SQ_seekingDAO();
		result = dao.insertApply(sq_recruit_apply);
		return SUCCESS;
	}
	
	//구인정보 수정
	public String updateSQrecruit() throws Exception {
		System.out.println("구인정보 수정");
		SQ_seekingDAO dao = new SQ_seekingDAO();
		int result = dao.updateRecruit(sq_recruit);
		if(result != 0){
			return SUCCESS;
		} else {
			return ERROR;
		}
		
	}
	//정보 가져올 메소드
	public String recruit_update() throws Exception{
		System.out.println("수정 정보뿌리자!");
		SQ_seekingDAO dao = new SQ_seekingDAO();
		sq_recruit=dao.getSQrecruit(sq_recruit.getSq_member_id());
		return SUCCESS;
	}
	
	//구인정보 삭제
	public String deleteSQrecruit() throws Exception {
		System.out.println("구인정보 삭제");
		SQ_seekingDAO dao = new SQ_seekingDAO();
		int result = dao.deleteRecruit(sq_recruit.getSq_recruit_id());
		if(result != 0 ){
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	
	// 해당 구인정보에 지원여부 확인->포트폴리오 유무 확인 -> 지원등록/실패
	public String checkApplied() throws Exception {
		result = 0;
		System.out.println("지원 여부 체크");
		SQ_seekingDAO dao = new SQ_seekingDAO();
		String apply_id = (String)session.get("loginId");
		sq_recruit_apply.setSq_member_id(apply_id);
		sq_recruit_apply = dao.checkApplied(sq_recruit_apply);
		System.out.println("지원했냐? "+sq_recruit_apply);
		if(sq_recruit_apply == null){
			sq_portfolio = dao.checkPortfolio(apply_id);
			if(sq_portfolio != null){
				sq_recruit_apply.setSq_member_id(apply_id);
				result = dao.insertApply(sq_recruit_apply);
			}
		}
		return SUCCESS;
	}
	
	
	
	
	//멤버의 getter & setter
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	public List<SQ_recruit> getSq_recruit_list() {
		return sq_recruit_list;
	}

	public void setSq_recruit_list(List<SQ_recruit> sq_recruit_list) {
		this.sq_recruit_list = sq_recruit_list;
	}

	public List<SQ_rent> getSq_rent_list() {
		return sq_rent_list;
	}

	public void setSq_rent_list(List<SQ_rent> sq_rent_list) {
		this.sq_rent_list = sq_rent_list;
	}

	public List<SQ_portfolio> getSq_portfolio_list() {
		return sq_portfolio_list;
	}

	public void setSq_portfolio_list(List<SQ_portfolio> sq_portfolio_list) {
		this.sq_portfolio_list = sq_portfolio_list;
	}

	public SQ_recruit getSq_recruit() {
		return sq_recruit;
	}

	public void setSq_recruit(SQ_recruit sq_recruit) {
		this.sq_recruit = sq_recruit;
	}

	public SQ_recruit_artist getSq_recruit_artist() {
		return sq_recruit_artist;
	}

	public void setSq_recruit_artist(SQ_recruit_artist sq_recruit_artist) {
		this.sq_recruit_artist = sq_recruit_artist;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
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

	public List<SQ_recruit_artist> getSq_applied_list() {
		return sq_applied_list;
	}

	public void setSq_applied_list(List<SQ_recruit_artist> sq_applied_list) {
		this.sq_applied_list = sq_applied_list;
	}

	public SQ_recruit_apply getSq_recruit_apply() {
		return sq_recruit_apply;
	}

	public void setSq_recruit_apply(SQ_recruit_apply sq_recruit_apply) {
		this.sq_recruit_apply = sq_recruit_apply;
	}

	public SQ_portfolio getSq_portfolio() {
		return sq_portfolio;
	}

	public void setSq_portfolio(SQ_portfolio sq_portfolio) {
		this.sq_portfolio = sq_portfolio;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}
	
}
