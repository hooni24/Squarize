package squarize.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_recruit;

public class SQ_seekingDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	//기본생성자
	public SQ_seekingDAO() {
		System.out.println("SQ_seekingDAO 생성");
	}
	
	public List<SQ_recruit> selectAll_sq_recruit(){
		List<SQ_recruit> sq_recruit_list = null;
		ss = factory.openSession();
		sq_recruit_list = ss.selectList("mapper.seekingMapper.selectAll_sq_recruit");
		if(ss!=null) ss.close();
		return sq_recruit_list;
	}
}
