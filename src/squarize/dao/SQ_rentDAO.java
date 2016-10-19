package squarize.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_rent;

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
	public SQ_rent getRentById(SQ_rent rent){
		try {
			ss = factory.openSession();
			return ss.selectOne("sq_rentMapper.getRentById", rent);
		} finally {
			ss.close();
		}
	}

	
	
}
