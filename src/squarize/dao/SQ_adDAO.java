package squarize.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONObject;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_ad;
import squarize.vo.SQ_favorite;

public class SQ_adDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	
	/**
	 * 해당 유저의 favorite의 part에 따라 알맞는 광고 리스트 반환
	 */
	public List<SQ_ad> getAdByFavorite(String loginId){
		try{
			ss = factory.openSession();
			SQ_favorite favorite = ss.selectOne("sq_favoriteMapper.getFavorite", loginId);	//DB에서 favorite객체 얻어옴
			JSONObject genreJSON = new JSONObject(favorite.getSq_favorite_inst());		//파트 포인트 있는 JSON객체 생성
			int[] points = {genreJSON.getInt("기타"), genreJSON.getInt("드럼"), genreJSON.getInt("키보드"), genreJSON.getInt("보컬")};//장르별점수배열
			
			//points배열의 최대값 구하기
			int max = points[0];
			int maxLoc = 0;
			for (int i = 0; i < points.length; i++) {
				if(max < points[i]){
					max = points[i];
					maxLoc = i;
				}
			}
			
			//최대값이 들어있는 번지수로 해당 키워드 얻어냄
			String keyword= "";
			switch (maxLoc) {
			case 0:	keyword = "기타";
				break;
			case 1:	keyword = "드럼";
				break;
			case 2:	keyword = "키보드";
				break;
			case 3:	keyword = "보컬";
				break;
			}
			
			return ss.selectList("sq_favoriteMapper.getAdByFavorite", keyword);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
