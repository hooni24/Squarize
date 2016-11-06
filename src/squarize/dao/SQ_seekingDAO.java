package squarize.dao;

import java.util.List;

import javax.el.PropertyNotFoundException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_favorite;
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
	public List<SQ_recruit> selectAll_sq_recruit(String loginId){
		List<SQ_recruit> sq_recruit_list = null;
		SQ_favorite favorite = this.selectFavorite(loginId);	//아이디에 따른 favorite 갖고 옴.
		JSONObject jsonGenre, jsonInst;
		String max_genre = "", max_inst = "";
		int genreMaxCount = 0, instMaxCount = 0;
		int genreMaxIndex = 0, instMaxIndex = 0;
		try {
			jsonGenre = new JSONObject(favorite.getSq_favorite_genre());
			System.out.println(jsonGenre);
			int[] genreCounts = {jsonGenre.getInt("락"),jsonGenre.getInt("발라드"),jsonGenre.getInt("재즈"), jsonGenre.getInt("힙합")};
			for(int i = 0 ; i < genreCounts.length; i++) {
				if(genreCounts[i] > genreMaxCount){
					genreMaxCount = genreCounts[i];
					genreMaxIndex = i;
				}
			}
			switch(genreMaxIndex) {
			case 0 : max_genre = "락";	break;
			case 1 : max_genre = "발라드";break;
			case 2 : max_genre = "재즈";	break;
			case 3 : max_genre = "힙합";	break;
			}
			
			jsonInst = new JSONObject(favorite.getSq_favorite_inst());
			System.out.println(jsonInst);
			int[] instCounts = {jsonInst.getInt("보컬"),jsonInst.getInt("기타"),jsonInst.getInt("키보드"),jsonInst.getInt("드럼")};
			for(int i = 0; i < instCounts.length; i++){
				if(instCounts[i] > instMaxCount){
					instMaxCount = instCounts[i];
					instMaxIndex = i;
				}
			}
			switch(instMaxIndex){
			case 0 : max_inst = "보컬";	break;
			case 1 : max_inst = "기타";	break;
			case 2 : max_inst = "키보드";	break;
			case 3 : max_inst = "드럼";	break;
			}
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		SQ_recruit temp = new SQ_recruit();
		temp.setSq_recruit_part(max_inst);
		temp.setSq_recruit_genre(max_genre);
		
		//구직이므로 파트에 우선순위 두기.(좀 더 정확히 세분화해야함.)
		if(genreMaxCount > instMaxCount) {	// 장르가 더 높으면 장르 뽑아오기.
			ss = factory.openSession();
			temp.setSq_recruit_info("genre");
			sq_recruit_list = ss.selectList("sq_seekingMapper.selectAll_sq_recruit",temp);
		} else {							// 그 외엔 파트로 뽑아 오기.
			ss = factory.openSession();
			temp.setSq_recruit_info("inst");
			sq_recruit_list = ss.selectList("sq_seekingMapper.selectAll_sq_recruit",temp);
		}
		System.out.println("DAO : "+sq_recruit_list);
		if(ss!=null) ss.close();
		return sq_recruit_list;
	}
	
	// 썸네일 클릭시 해당 구인상세정보 불러오기
	public SQ_recruit_artist selectOne_sq_recruit_artist(SQ_recruit_artist temp){
		SQ_recruit_artist sq_recruit_artist = null;
//		factory = MybatisConfig.getSqlSessionFactory();
		SQ_favorite favorite = this.selectFavorite(temp.getSq_recruit_info());
		JSONObject jsonInst = null;
		JSONObject jsonGenre = null;
		try {
			jsonInst = new JSONObject(favorite.getSq_favorite_inst());
			jsonGenre = new JSONObject(favorite.getSq_favorite_genre());
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		ss = factory.openSession();
		try {
			sq_recruit_artist = ss.selectOne("sq_seekingMapper.selectOne_sq_recruit_artist",temp.getSq_recruit_id());
			System.out.println("구인상세정보 selected : " + sq_recruit_artist);
			jsonInst.put(sq_recruit_artist.getSq_recruit_part(), jsonInst.getInt(sq_recruit_artist.getSq_recruit_part())+1);
			jsonGenre.put(sq_recruit_artist.getSq_recruit_genre(), jsonGenre.getInt(sq_recruit_artist.getSq_recruit_genre())+1);
			favorite.setSq_favorite_inst(jsonInst.toString());
			favorite.setSq_favorite_genre(jsonGenre.toString());
			ss.update("sq_favoriteMapper.setFavorite", favorite);
			ss.commit();
		} catch (PropertyNotFoundException e) {
			System.out.println("존재하지 않는 파일 - 확인 필요함.");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	
	public List<SQ_recruit> getAllMyApply(String loginId){
		List<SQ_recruit> result=null;
		try {
			ss = factory.openSession();
			result = ss.selectList("sq_seekingMapper.getAllMyApply", loginId);
			System.out.println("result: " + result);
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
		} finally {
			ss.commit();
			ss.close();
		}
		return result;
	}
	
	/**getAllRecruitApply()
	 * o
	 * */
	public List<SQ_human> AllRecruitApply(int sq_recruit_id){
		List<SQ_human>recruitList=null;
		try {
			ss = factory.openSession();
			recruitList=ss.selectList("sq_seekingMapper.AllRecruitApply", sq_recruit_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			ss.close();
		}
		return recruitList;
	}
	
	// 구인정보에 지원시 DB에 등록하기.
	public int insertApply(SQ_recruit_artist sq_recruit_artist){
		int result = 0;
		ss = factory.openSession();
		result = ss.insert("sq_seekingMapper.insertApply", sq_recruit_artist);
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
	
	public List<SQ_recruit> search_recruit(SQ_recruit sq_recruit){
		List<SQ_recruit> list = null;
		SQ_favorite favorite = this.selectFavorite(sq_recruit.getSq_member_id());
		try {
			if(!sq_recruit.getSq_recruit_part().equals("")) {
				JSONObject pre_inst = new JSONObject(favorite.getSq_favorite_inst());
				int inst_count = pre_inst.getInt(sq_recruit.getSq_recruit_part());		//JSON객체로 바꾼 part의 횟수정보를 갖고 옴.
				++inst_count;															//횟수에 +1 해줌.
				pre_inst.put(sq_recruit.getSq_recruit_part(), inst_count);
				favorite.setSq_favorite_inst(pre_inst.toString());

			} else if(!sq_recruit.getSq_recruit_genre().equals("")) {
				JSONObject pre_genre = new JSONObject(favorite.getSq_favorite_genre());
				int genre_count = pre_genre.getInt(sq_recruit.getSq_recruit_genre());	//JSON객체로 바꾼 genre의 횟수정보를 갖고 옴.
				++genre_count;															//횟수에 +1 해줌.
				pre_genre.put(sq_recruit.getSq_recruit_genre(), genre_count);
				favorite.setSq_favorite_inst(pre_genre.toString());
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}	
		
		System.out.println(favorite);
		ss = factory.openSession();
		ss.update("sq_favoriteMapper.setFavorite", favorite);
		ss.commit();
		list = ss.selectList("sq_seekingMapper.search_byKeyword", sq_recruit);
		if(ss != null) ss.close();
		return list;
	}
		
	public SQ_favorite selectFavorite(String sq_member_id){
		SQ_favorite favorites = null;
		ss = factory.openSession();
		favorites = ss.selectOne("sq_favoriteMapper.getFavorite",sq_member_id);
		if(ss != null) ss.close();
		return favorites;
	}
	
	/*public static void main(String[] args) {
		SQ_seekingDAO sdao= new SQ_seekingDAO();
		SQ_recruit sq_recruit=new SQ_recruit(0,"a","a","2012/10/11","a","a","a","a","a","a","a","a","a");
		sdao.insertSQrecruit(sq_recruit);
	}*/
}
