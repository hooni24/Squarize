package squarize.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_rent;

public class SQ_rentDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	public List<SQ_rent> getAllRent() {
		try {
			ss = factory.openSession();
			return ss.selectList("sq_rentMapper.getAllRent");
		} finally {
			ss.close();
		}
	}
	
	public void insertRent(SQ_rent rent) {
		try {
			ss = factory.openSession();
			ss.insert("sq_rentMapper.insertRent", rent);
			ss.commit();
		} finally {
			ss.close();
		}
		
	}

	
	
}
