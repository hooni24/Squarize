package squarize.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_busking;

public class SQ_buskingDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss = MybatisConfig.getSqlSessionFactory().openSession();
	
	public List<SQ_busking> buskingList(){
		List<SQ_busking> result = ss.selectList("sq_memberMapper.selectAll");
		return result;
	}
	
	public SQ_busking buskingDetail(int sq_busking_id){
		SQ_busking result = ss.selectOne("sq_memberMapper.selectOne", sq_busking_id);
		return result;
	}
}
