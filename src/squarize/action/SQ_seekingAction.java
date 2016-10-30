package squarize.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.core.async.DaemonThreadFactory;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_seekingDAO;
import squarize.util.FileService;
import squarize.vo.SQ_human;
import squarize.vo.SQ_portfolio;
import squarize.vo.SQ_recruit;
import squarize.vo.SQ_recruit_apply;
import squarize.vo.SQ_recruit_artist;

public class SQ_seekingAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	//seeking 페이지에서 썸네일로 뿌릴 list멤버
//	private JsonObject json_object;
	private List<SQ_recruit> sq_recruit_list;
	private List<SQ_human>sq_apply_list;
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
	
	//구인 상세정보(해당 recruit_id를 보내서 그에 해당하는 sq_recruit_artist객체를 갖고 옴.
	public String selectOne_SQ_recruit_artist() throws Exception {
		System.out.println("구인 상세정보 갖고오기 - Action : " + sq_recruit_artist.getSq_recruit_id());
		SQ_seekingDAO dao = new SQ_seekingDAO();
		sq_recruit_artist = dao.selectOne_sq_recruit_artist(sq_recruit_artist.getSq_recruit_id());
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
	

	
	public String AllRecruitApply() throws Exception{
		System.out.println("지원자리스트"+sq_recruit);
		sq_apply_list=sdao.AllRecruitApply(sq_recruit.getSq_recruit_id());
		System.out.println("sq_apply_list"+sq_apply_list);
		return SUCCESS;
	}
	


	
	// 지원 여부 확인하기.(지원하기 버튼 눌렀을 때)
	public SQ_recruit_apply checkApplied() {
		System.out.println("지원여부 확인하기.");
		//지원여부 확인. 지원한 적 있으면, recruit_apply 객체 리턴.
		sq_recruit_artist.setSq_member_id((String)session.get("loginId"));
		System.out.println("검색재료(아이디만 있으면 됌) : " + sq_recruit_artist);
		SQ_seekingDAO dao = new SQ_seekingDAO();
		SQ_recruit_apply checked_apply = dao.checkApplied(sq_recruit_artist);
		return checked_apply;
	}
	
	// 해당 구인 정보에 지원신청 insert
	public String insertRecruitApplication() {
		// 먼저 지원 여부 확인하기.
		SQ_recruit_apply checked_apply = this.checkApplied();
		System.out.println("지원했는지 얻어온 결과 : "+checked_apply);
		if(checked_apply != null) {
			result = 0;
		} else {
			//지원한 적 없으면(checked_apply가 null) portfolio DB에서 portfolio 유무 확인. 
			SQ_seekingDAO dao = new SQ_seekingDAO();
			sq_portfolio = dao.checkPortfolio((String)session.get("loginId"));
			System.out.println("지원여부 아닌 사람에게서 포트폴리오 객체 얻어옴(있니없니?) : "+sq_portfolio);
			if(sq_portfolio != null) {
				//지원하기.(insert)
				System.out.println("검색재료로 들어가는 sq_recruit_artist : " + sq_recruit_artist);
				result = dao.insertApply(sq_recruit_artist);
				System.out.println("포트폴리오 있는 사람은 apply시키고 결과값 받아옴.(1이어야 함)" + result);
			} else {
				//만약 포트폴리오가 없으면 -1리턴으로 받아서 포트폴리오 페이지 띄워주기.
				result = -1;
			}
		}
		System.out.println("최종적으로 result에 담기는 숫자 : "+result);
		return SUCCESS;
	}
	
	// 해당 구인 정보에 지원신청 취소 delete
	public String deleteRecruitApplication() throws Exception {
		System.out.println("지원 취소하기 delete");
		// 지원한 적이 있는지 확인
		SQ_recruit_apply checked_apply = this.checkApplied();
		System.out.println("delete checked_apply : " +checked_apply);
		if(checked_apply != null) {
			SQ_seekingDAO dao = new SQ_seekingDAO();
			result = dao.deleteApply(checked_apply);
		} else {
			result = -1; //	지원한 적 없음.
		}
		return SUCCESS;
	}
	
	//구인정보 수정
	public String updateSQRecruit() throws Exception {
		System.out.println(sq_recruit);
		SQ_seekingDAO dao = new SQ_seekingDAO();
		System.out.println("구인정보 수정");
		SQ_recruit recruit=dao.getSQrecruit(sq_recruit.getSq_recruit_id());
		System.out.println(recruit);
		/*if (upload != null) { 
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
		}*/
		dao.updateSQRecruit(sq_recruit);
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
	
	public String recruit_search_byKeyword() throws Exception {
		
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

	public List<SQ_human> getSq_apply_list() {
		return sq_apply_list;
	}

	public void setSq_apply_list(List<SQ_human> sq_apply_list) {
		this.sq_apply_list = sq_apply_list;
	}
	
	
}
