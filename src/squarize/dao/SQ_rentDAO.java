package squarize.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import squarize.util.FileService;
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
	public Object[] getRentById(SQ_rent rent){
		try {
			Object[] result = new Object[2];
			ss = factory.openSession();
			rent = ss.selectOne("sq_rentMapper.getRentById", rent);
			result[0] = ss.selectOne("sq_rentMapper.getMemberById", rent.getSq_member_id());
			result[1] = rent;
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
			System.out.println(fullpath);
			ss.delete("sq_rentMapper.deleteRent", rent);
			ss.commit();
		} finally {
			ss.close();
		}
	}

	
	
}
