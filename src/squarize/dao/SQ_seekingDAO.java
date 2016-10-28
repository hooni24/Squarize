package squarize.dao;

import java.util.List;

import javax.el.PropertyNotFoundException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_human;
import squarize.vo.SQ_portfolio;
import squarize.vo.SQ_recruit;
import squarize.vo.SQ_recruit_apply;
import squarize.vo.SQ_recruit_artist;

public class SQ_seekingDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	//기본생성자
	public SQ_seekingDAO() {
		System.out.println("SQ_seekingDAO 생성");
	}
	
	// 구인정보 모두 불러오기
	public List<SQ_recruit> selectAll_sq_recruit(){
		/*factory = MybatisConfig.getSqlSessionFactory();*/
		ss = factory.openSession();
		List<SQ_recruit> sq_recruit_list = ss.selectList("sq_seekingMapper.selectAll_sq_recruit");
		System.out.println("DAO"+sq_recruit_list);
		if(ss!=null) ss.close();
		return sq_recruit_list;
	}
	// 썸네일 클릭시 해당 구인상세정보 불러오기
	public SQ_recruit_artist selectOne_sq_recruit_artist(int sq_recruit_id){
		SQ_recruit_artist sq_recruit_artist = null;
//		factory = MybatisConfig.getSqlSessionFactory();
		ss = factory.openSession();
		try {
			sq_recruit_artist = ss.selectOne("sq_seekingMapper.selectOne_sq_recruit_artist",sq_recruit_id);
		} catch (PropertyNotFoundException e) {
			System.out.println("존재하지 않는 파일 - 확인 필요함.");
		} finally {
			if(ss != null) {
				ss.close();
			}
		}
		return sq_recruit_artist;
	}
	
	public void insertSQrecruit(SQ_recruit sq_recruit){
		System.out.println(sq_recruit);
		ss=factory.openSession();
		try {
			ss.insert("sq_seekingMapper.insertSQrecruit",sq_recruit);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			ss.close();
		}
	}
	
/*	// 해당 구인정보에 지원한 지원자 리스트 전체 불러오기
	public List<SQ_recruit_artist> selectRecruitApply(int recruit_id){
		List<SQ_recruit_artist> recruitList = null;
		ss = factory.openSession();
		recruitList = ss.selectList("sq_seekingMapper.selectList_applied", recruit_id);
		if(ss != null) ss.close();
		return recruitList;
	}*/
	
	/**getAllRecruitApply()
	 * o
	 * */
	public List<SQ_human> getAllRecruitApply(int sq_recruit_id){
		List<SQ_human>recruitList=null;
		try {
			ss = factory.openSession();
			recruitList=ss.selectList("sq_seekingMapper.getAllRecruitApply", sq_recruit_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			ss.close();
		}
		return recruitList;
	}
	
	// 구인정보에 지원시 DB에 등록하기.
	public int insertApply(SQ_recruit_artist recruit_apply){
		int result = 0;
		ss = factory.openSession();
		result = ss.insert("sq_seekingMapper.insertApply", recruit_apply);
		ss.commit();
		if(ss != null) ss.close();
		return result;
	}
	
	// 구인정보 수정하기.
	public int updateSQRecruit(SQ_recruit sq_recruit) {
		int result = 0;
		try {
			ss = factory.openSession();
			result = ss.update("sq_seekingMapper.updateSQRecruit", sq_recruit);
			System.out.println(sq_recruit);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			if(ss != null) ss.close();
		}
		return result;
	}
	
	// 구인정보 삭제하기.
	public int deleteRecruit(int sq_recruit_id){
		int result = 0;
		ss = factory.openSession();
		result = ss.delete("sq_seekingMapper.deleteRecruit", sq_recruit_id);
		ss.commit();
		if(ss != null) ss.close();
		return result;
	}
	
	// 지원 여부 확인을 위한 select
	public SQ_recruit_apply checkApplied(SQ_recruit_artist sq_recruit_artist){
		SQ_recruit_apply applied = null;
		ss = factory.openSession();
		applied = ss.selectOne("sq_seekingMapper.selectOne_apply", sq_recruit_artist);
		System.out.println("DAO checkedApplied : " + applied);
		if(ss != null) ss.close();
		return applied;
	}
	
	//수정위한 recruit 정보 불러오기 
	public SQ_recruit getSQrecruit(int sq_recruit_id){
		SQ_recruit result=null;
		try {
			ss = factory.openSession();
			result=ss.selectOne("sq_seekingMapper.getSQrecruit", sq_recruit_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			ss.close();
		}
		return result;
	}
	
	// 포트폴리오 작성여부 select
	public SQ_portfolio checkPortfolio(String member_id){
		SQ_portfolio port = null;
		ss = factory.openSession();
		port = ss.selectOne("sq_seekingMapper.selectOne_port", member_id);
		if(ss != null) ss.close();
		return port;
	}
	
	// 지원취소 
	public int deleteApply(SQ_recruit_apply sq_recruit_apply){
		int result = 0;
		ss = factory.openSession();
		result = ss.delete("sq_seekingMapper.delete_apply", sq_recruit_apply);
		ss.commit();
		if(ss != null) ss.close();
		return result;
	}
	/*public static void main(String[] args) {
		SQ_seekingDAO sdao= new SQ_seekingDAO();
		SQ_recruit sq_recruit=new SQ_recruit(0,"a","a","2012/10/11","a","a","a","a","a","a","a","a","a");
		sdao.insertSQrecruit(sq_recruit);
	}*/
}
