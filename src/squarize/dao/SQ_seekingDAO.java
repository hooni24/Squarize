package squarize.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_recruit;
import squarize.vo.SQ_recruit_artist;

public class SQ_seekingDAO {
	private SqlSessionFactory factory=MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	//기본생성자
	public SQ_seekingDAO() {
		System.out.println("SQ_seekingDAO 생성");
	}
	
	public List<SQ_recruit> selectAll_sq_recruit(){
		/*factory = MybatisConfig.getSqlSessionFactory();*/
		ss = factory.openSession();
		List<SQ_recruit> sq_recruit_list = ss.selectList("sq_seekingMapper.selectAll_sq_recruit");
		System.out.println("DAO"+sq_recruit_list);
		if(ss!=null) ss.close();
		return sq_recruit_list;
	}
	
	public SQ_recruit_artist selectOne_sq_recruit_artist(int sq_recruit_id){
		SQ_recruit_artist sq_recruit_artist = null;
		factory = MybatisConfig.getSqlSessionFactory();
		ss = factory.openSession();
		sq_recruit_artist = ss.selectOne("sq_seekingMapper.selectOne_sq_recruit_artist",sq_recruit_id);
		if(ss != null) ss.close();
		return sq_recruit_artist;
	}
	
	public void insertSQrecruit(SQ_recruit sq_recruit){
		System.out.println(sq_recruit);
		ss=factory.openSession();
		try {
			ss.insert("sq_seekingMapper.insertSQrecruit",sq_recruit);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.commit();
			ss.close();
		}
	}
	
	public static void main(String[] args) {
		SQ_seekingDAO sdao= new SQ_seekingDAO();
		SQ_recruit sq_recruit=new SQ_recruit(0,"a","a","2012/10/11","a","a","a","a","a","a","a","a","a");
		sdao.insertSQrecruit(sq_recruit);
	}
}
