package squarize.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONException;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import squarize.util.FileService;
import squarize.util.MybatisConfig;
import squarize.vo.SQ_favorite;
import squarize.vo.SQ_human;
import squarize.vo.SQ_rent;
import squarize.vo.SQ_rent_apply;

public class SQ_rentDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	/**
	 * 대관 게시물 전체 가져오기 + 선호도에 따라 order by 정하는 알고리즘 필요. 일단은 올린 순서대로 뽑아옴
	 */
	public List<SQ_rent> getAllRent(String loginId) {
		try {
			ss = factory.openSession();
			SQ_favorite favorite = ss.selectOne("sq_favoriteMapper.getFavorite", loginId);	//DB에서 favorite객체 얻어옴
				JSONObject genreJSON = new JSONObject(favorite.getSq_favorite_genre());		//장르 포인트 있는 JSON객체 생성
				int[] points = {genreJSON.getInt("락"), genreJSON.getInt("발라드"), genreJSON.getInt("재즈"), genreJSON.getInt("힙합")};//장르별점수배열
				
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
				case 0:	keyword = "락";
					break;
				case 1:	keyword = "발라드";
					break;
				case 2:	keyword = "재즈";
					break;
				case 3:	keyword = "힙합";
					break;
				}
			
			return ss.selectList("sq_rentMapper.getAllRent", keyword);	//위에서 얻어낸 키워드 넣어서 검색
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return null;
	}
	
	/**
	 * 대관 게시물 등록
	 */
	public void insertRent(SQ_rent rent) {
		try {
			ss = factory.openSession();
			ss.insert("sq_rentMapper.insertRent", rent);
			ss.commit();
		} finally {
			ss.close();
		}
	}
	
	/**
	 * rent_id로 한 게시물 정보 얻어오기 + favorite테이블에 해당 장르 포인트 1 올리기
	 */
	public Object[] getRentById(SQ_rent rent){
		try {
			Object[] result = new Object[4];
			ss = factory.openSession();
			SQ_favorite favorite = ss.selectOne("sq_favoriteMapper.getFavorite", rent.getSq_member_id());

			//포인트 올리는 부분
			try {
				JSONObject genreJSON = new JSONObject(favorite.getSq_favorite_genre());	//DB에서 가져온 장르String을 JSON으로 변환
				int currentPoint = (int) genreJSON.get(rent.getSq_rent_genre());		//JSON에서 읽은게시물 장르 점수 얻어옴
				genreJSON.put(rent.getSq_rent_genre(), currentPoint+1);					//그 장르 포인트 1 증가
				String newGenreJSON = genreJSON.toString();								//수정된 JSON 스트링으로 변환
				favorite.setSq_favorite_genre(newGenreJSON);							//수정된 장르 favorite객체에 세팅
				ss.update("sq_favoriteMapper.setGenre", favorite);						//수정된 장르 업데이트
				ss.commit();
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
			result[3] = ss.selectOne("sq_rentMapper.checkRentApply2", rent);
			System.out.println(rent);
			
			rent = ss.selectOne("sq_rentMapper.getRentById", rent);
			result[0] = ss.selectOne("sq_rentMapper.getMemberById", rent.getSq_member_id());
			result[1] = rent;
			result[2] = ss.selectOne("sq_rentMapper.getArtistById", rent.getSq_member_id());
			return result;
		} finally {
			ss.close();
		}
	}

	/**
	 * rent_id로 게시물 삭제
	 */
	public void deleteRent(SQ_rent rent) {
		try {
			ss = factory.openSession();
			rent = ss.selectOne("sq_rentMapper.getRentById", rent);
			String fullpath = new ActionSupport().getText("rent.uploadpath") +"/"+ rent.getSq_rent_photo();
			new FileService().fileDelete(fullpath);
			ss.delete("sq_rentMapper.deleteRent", rent);
			ss.commit();
		} finally {
			ss.close();
		}
	}

	/**
	 * 사진 없이 대관게시물 수정
	 */
	public void updateWithoutFile(SQ_rent rent) {
		try {
			ss = factory.openSession();
			ss.update("sq_rentMapper.updateWithoutFile", rent);
			ss.commit();
		} finally {
			ss.close();
		}
	}
	
	/**
	 * 대관게시물 사진 수정
	 */
	public void updateRentPhoto(SQ_rent rent) {
		try {
			ss = factory.openSession();
			ss.update("sq_rentMapper.updateRentPhoto", rent);
			ss.commit();
		} finally {
			ss.close();
		}
	}

	/**
	 * 대관 게시물 지원
	 */
	public void rentApply(SQ_rent_apply rent_apply) {
		try {
			ss = factory.openSession();
			ss.insert("sq_rentMapper.rentApply", rent_apply);
			ss.commit();
		} finally {
			ss.close();
		}
	}
	
	/**
	 * 대관 게시물 지원여부 확인
	 */
	public SQ_rent_apply checkRentApply(SQ_rent_apply rent_apply) {
		try {
			ss = factory.openSession();
			return ss.selectOne("sq_rentMapper.checkRentApply", rent_apply);
		} finally {
			ss.close();
		}
	}

	/**
	 * 유저 전체 지원현황
	 */
	public List<SQ_rent> rentApplySituation(String loginId) {
		try {
			ss = factory.openSession();
			return ss.selectList("sq_rentMapper.rentApplySituation", loginId);
		} finally {
			ss.close();
		}
	}

	/**
	 * 해당 글 지원자 목록
	 */
	public List<SQ_human> seeRentApply(String sq_rent_id) {
		try {
			ss = factory.openSession();
			return ss.selectList("sq_rentMapper.seeRentApply", sq_rent_id);
		} finally {
			ss.close();
		}
	}

	/**
	 * 검색
	 */
	public List<SQ_rent> searchRent(SQ_rent rent) {
		try {
			ss = factory.openSession();
			return ss.selectList("sq_rentMapper.searchRent", rent);
		} finally {
			ss.close();
		}
	}

	/**
	 * 내가 올린 모든 대관 게시물
	 */
	public List<SQ_rent> getAllMyRent(String loginId) {
		try {
			ss = factory.openSession();
			return ss.selectList("sq_rentMapper.getAllMyRent", loginId);
		} finally {
			ss.close();
		}
	}

	/**
	 * 대관 지원 취소
	 */
	public void rentApplyCancel(SQ_rent rent) {
		try {
			ss = factory.openSession();
			ss.delete("sq_rentMapper.rentApplyCancel", rent);
			ss.commit();
		} finally {
			ss.close();
		}
	}

	
	
}
