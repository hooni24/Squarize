package squarize.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;

public class SQ_seekingDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	
}
