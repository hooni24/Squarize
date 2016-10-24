package squarize.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.eclipse.jdt.internal.compiler.batch.Main;

import com.opensymphony.xwork2.ActionSupport;

import squarize.vo.SQ_artist;
import squarize.vo.SQ_favorite;
import squarize.dao.SQ_memberDAO;
import squarize.util.FileService;
import squarize.util.SendMailTest;
import squarize.vo.SQ_member;
import squarize.vo.SQ_portfolio;


public class SQ_memberAction extends ActionSupport implements SessionAware{
	private SQ_memberDAO mdao;// 멤버용 dao 
	private Map<String, Object> session;//세션
	private SQ_member sq_member;//멤버 객체
	private SQ_portfolio sq_portfolio;
	private SQ_artist sq_artist;
	private String sq_member_id;
	private String sq_member_pw;
	private String loginId;
	private String isArtist;
	private String fromWhere;
	private String email_auth;
	
	private SQ_favorite sq_favorite;
	
	private File upload;					// 업로드할 파일. Form의 <file> 태그의 name. 
	private String uploadFileName;			// 업로드할 파일의 파일명 (File타입 속성명 + "FileName") 
	private String uploadContentType;		// 업로드할 파일의 컨텐츠 타입 (File타입 속성명 + "ContentType") 
	
	/**
	 * 아이디 중복검사 
	 * @param sq_member_id
	 * @return sq_member 
	 * 아이디를 가진 객체가 있음 가져오가 없음 안가져온다.
	 * */
	public String idCheck() throws Exception{
		mdao=new SQ_memberDAO();
		sq_member=mdao.loginSQmember(sq_member_id);
		return SUCCESS;
	}
	
	/**
	 * 회원 정보등록 
	 * @param sq_member
	 * 회원가입 요청을 받으면 DB에 저장하고 인증 email을 보낸다.
	 * 이메일 인증 전까지의 단계로 디비에 키까지 저장되고 로그인은 되기 전 
	 * */
	public String registerSQmember() throws Exception{
		mdao=new SQ_memberDAO();
		int num=(int)(Math.random()*999999)+1;
		String authkey=Integer.toHexString(num);
		sq_member.setSq_member_email_key(authkey);
		mdao.registerSQmember(sq_member);
		System.out.println("ACtion sq_member"+sq_member);
		String authURL= "http://localhost:8888/Squarize/emailAuth.action?sq_member.sq_member_id="+sq_member.getSq_member_id()+"&sq_member.sq_member_email_key="+authkey;
		//난수를 발생
		//auth.jsp만들어서 struts.xml에 등록
		//authURL = http://localhost:8888/Squarize/auth.action?id=아이디&authKey=발생된 난수
		//SendMailTest.java 생성
		//auth.jsp에서는 id, authKey가 없으면 index로 돌려보내고, 있으면 db에서 확인 id
		new SendMailTest(sq_member.getSq_member_email(), authURL);
		return SUCCESS;
	}
	
	public String emailAuth() throws Exception{
		mdao=new SQ_memberDAO();
		boolean result=mdao.emailAuth(sq_member);
		System.out.println(result);
		if(result){
			return SUCCESS;
		}else{
			return LOGIN;
		}
	}
	
	/**
	 * 로그인 
	 * 아이디를 입력받아 디비에서 멤버를 가져온 뒤 
	 * 비밀번호를 확인 받아 동일하면 세션에 loginID로 저장한다.
	 * 또 isArtist도 저장하여, 아티스트 인증 및 아티스트 메뉴 시에 활용 
	 * email_auth를 받아 이메일 인증을 하지 않으면 로그인이 되지 않도록 한다.
	 * @param sq_member_id
	 * 
	 * */
	public String loginSQmember() throws Exception{
		mdao=new SQ_memberDAO();
		sq_member=mdao.loginSQmember(sq_member_id);
		System.out.println(sq_member);
		if(sq_member.getSq_member_pw().equals(sq_member_pw)&&sq_member.getSq_member_email_auth().equals("Y")){
			session.put("loginId", sq_member.getSq_member_id());
			session.put("isArtist", sq_member.getSq_member_isartist());
			session.put("email_auth", sq_member.getSq_member_email_auth());
			loginId=(String) session.get("loginId");
			isArtist=(String) session.get("isArtist");
			email_auth=(String)session.get("email_auth");
			System.out.println(email_auth);
			
		}else{
			sq_member=null;
			loginId="";
			isArtist="";
			email_auth="N";
		}
		return SUCCESS;
	}
	
	/**
	 * loginCheck(): 로그인확인 
	 * 페이지 로딩시에 로그인 여부를 확인하는 메소드
	 * 
	 * */
	public String loginCheck() throws Exception{
		loginId=(String)session.get("loginId");
		isArtist=(String)session.get("isArtist");
		email_auth=(String)session.get("email_prof");
		return SUCCESS;
	}
	
	/**
	 * logoutSQmember():로그아웃 메소드
	 * 세션 정보를 비운다.
	 * */
	public String logoutSQmember() throws Exception{
		session.clear();
		return fromWhere();
	}
	
	/**
	 * addArtist(): 아티스트 추가인증 메소드 
	 * */
	public String addArtist() throws Exception{
		System.out.println(fromWhere);
		sq_artist.setSq_member_id((String)session.get("loginId"));
		if (upload != null) { 
			try {
				FileService fs = new FileService();
				String basePath = getText("artist.uploadpath");
				String savedfile;
				savedfile = fs.saveFile(upload, basePath, uploadFileName);
				sq_artist.setSq_artist_photo(savedfile);
				System.out.println(savedfile);
				System.out.println("파일 넘길때 아티스트객체" + sq_artist);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		new SQ_memberDAO().addSQArtist(sq_artist);
		session.put("isArtist", "Y");
		return fromWhere();
	}
	
	/**
	 * 포트폴리오 읽기. 주인 artist정보도 얻어옴(사진 뿌려주기 위함)
	 */
	public String portfolioCheck(){
		sq_portfolio = new SQ_memberDAO().portfolioCheck((String) session.get("loginId"));
		sq_artist = new SQ_memberDAO().getArtistInfo((String) session.get("loginId"));
		return SUCCESS;
	}
	
	/**
	 * 포트폴리오 등록
	 */
	public String makePortfolio(){
		if (upload != null) { 
			try {
				FileService fs = new FileService();
				String basePath = getText("port.uploadpath");
				String savedfile;
				savedfile = fs.saveFile(upload, basePath, uploadFileName);
				sq_portfolio.setSq_port_file(savedfile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		sq_portfolio.setSq_member_id((String) session.get("loginId"));
		new SQ_memberDAO().makePortfolio(sq_portfolio);
		return fromWhere();
	}

	
	/**
	 * 포트폴리오 삭제
	 */
	public String deletePortfolio(){
		new SQ_memberDAO().deletePortfolio((String) session.get("loginId"));
		return SUCCESS;
	}
	
	/**
	 * 포트폴리오 수정
	 */
	public String updatePortfolio(){
		sq_portfolio.setSq_member_id((String) session.get("loginId"));
		sq_portfolio = new SQ_memberDAO().updatePortfolio(sq_portfolio);
		return SUCCESS;
	}
	
	/**
	 * 포트폴리오 보유여부 확인
	 */
	public String checkPortfolio(){
		sq_portfolio = new SQ_memberDAO().checkPortfolio((String) session.get("loginId"));
		return SUCCESS;
	}
	
	/**
	 * 어디서 왔니?
	 */
	public String fromWhere(){
		if(fromWhere != null){
			switch (fromWhere) {
			case "rent":
				return "rent";
			case "seeking":
				return "seeking";
			case "busking" :
				return "busking";
			}
		}
		return ERROR;
	}
	
	public String email_prof(){
		
		return SUCCESS;
	}
	
	public SQ_member getSq_member() {
		return sq_member;
	}
	public void setSq_member(SQ_member sq_member) {
		this.sq_member = sq_member;
	}
	public String getSq_member_id() {
		return sq_member_id;
	}
	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}	
	public String getSq_member_pw() {
		return sq_member_pw;
	}
	public void setSq_member_pw(String sq_member_pw) {
		this.sq_member_pw = sq_member_pw;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getIsArtist() {
		return isArtist;
	}
	public void setIsArtist(String isArtist) {
		this.isArtist = isArtist;
	}
	public SQ_portfolio getSq_portfolio() {
		return sq_portfolio;
	}
	public void setSq_portfolio(SQ_portfolio sq_portfolio) {
		this.sq_portfolio = sq_portfolio;
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
	public SQ_artist getSq_artist() {
		return sq_artist;
	}
	public void setSq_artist(SQ_artist sq_artist) {
		this.sq_artist = sq_artist;
	}
	public String getFromWhere() {
		return fromWhere;
	}
	public void setFromWhere(String fromWhere) {
		this.fromWhere = fromWhere;
	}
	public SQ_favorite getSq_favorite() {
		return sq_favorite;
	}
	public void setSq_favorite(SQ_favorite sq_favorite) {
		this.sq_favorite = sq_favorite;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	public String getEmail_auth() {
		return email_auth;
	}

	public void setEmail_auth(String email_auth) {
		this.email_auth = email_auth;
	}
	

}
