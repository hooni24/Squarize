package squarize.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import squarize.util.FileService;
import squarize.util.MybatisConfig;
import squarize.vo.SQ_human;
import squarize.vo.SQ_rent;
import squarize.vo.SQ_rent_apply;

public class SQ_rentDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	/**
	 * 대관 게시물 전체 가져오기
	 */
	public List<SQ_rent> getAllRent() {
		try {
			ss = factory.openSession();
			return ss.selectList("sq_rentMapper.getAllRent");
		} finally {
			ss.close();
		}
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
	 * rent_id로 한 게시물 정보 얻어오기
	 */
	public Object[] getRentById(SQ_rent rent){
		try {
			Object[] result = new Object[3];
			ss = factory.openSession();
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

	
	
}
