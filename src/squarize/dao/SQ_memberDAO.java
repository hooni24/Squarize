package squarize.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_member;

public class SQ_memberDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	public SQ_member loginSQmember(String sq_member_id){
		SQ_member result=null;
		try{
			ss=factory.openSession();
			result=ss.selectOne("sq_memberMapper.loginSQmember", sq_member_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ss.commit();
			ss.close();
		}
		return result;
	}
	public void registerSQmember(SQ_member sq_member){
		try{
			ss=factory.openSession();
			ss.insert("sq_memberMapper.registerSQmember", sq_member);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ss.commit();
			ss.close();
		}
		
	}
	
	
}
