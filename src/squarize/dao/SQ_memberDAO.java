package squarize.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.opensymphony.xwork2.ActionSupport;

import squarize.util.FileService;
import squarize.util.MybatisConfig;
import squarize.vo.SQ_artist;
import squarize.vo.SQ_member;
import squarize.vo.SQ_portfolio;

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
	
	public void addSQArtist(SQ_artist sq_artist){
		ss=factory.openSession();
		String sq_member_id=sq_artist.getSq_member_id();
		System.out.println(sq_artist+"   "+sq_member_id);
		try{
			ss.update("sq_memberMapper.addSQArtist", sq_member_id);
			ss.insert("sq_memberMapper.insertSQArtist", sq_artist);
			System.out.println("완료");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			ss.commit();
			ss.close();
		}
	}
	
	public SQ_portfolio portfolioCheck(String loginId) {
		try {
			ss = factory.openSession();
			return ss.selectOne("sq_memberMapper.portfolioCheck", loginId);
		} finally {
			ss.close();
		}
	}

	public void makePortfolio(SQ_portfolio sq_portfolio) {
		try {
			ss = factory.openSession();
			ss.insert("sq_memberMapper.makePortfolio", sq_portfolio);
			ss.commit();
		} finally {
			ss.close();
		}
	}

	public SQ_artist getArtistInfo(String loginId) {
		try {
			ss = factory.openSession();
			return ss.selectOne("sq_memberMapper.getArtistInfo", loginId);
		} finally {
			ss.close();
		}
	}

	public void deletePortfolio(String loginId) {
		try {
			ss = factory.openSession();
			SQ_portfolio sq_portfolio = ss.selectOne("sq_memberMapper.portfolioCheck", loginId);
			if(sq_portfolio.getSq_port_file() != null){
				String fullpath = new ActionSupport().getText("port.uploadpath") +"/"+ sq_portfolio.getSq_port_file();
				new FileService().fileDelete(fullpath);
			}
			ss.delete("sq_memberMapper.deletePortfolio", loginId);
			ss.commit();
		} finally {
			ss.close();
		}
	}

	public SQ_portfolio updatePortfolio(SQ_portfolio sq_portfolio) {
		try {
			ss = factory.openSession();
			ss.update("sq_memberMapper.updatePortfolio", sq_portfolio);
			ss.commit();
			return ss.selectOne("sq_memberMapper.portfolioCheck", (String)sq_portfolio.getSq_member_id());
		} finally {
			ss.close();
		}
	}
	
	public static void main(String[] args) {
		SQ_artist sq_artist=new SQ_artist("123", "111111111", "", "안녕하세요 반갑습니다");
		SQ_memberDAO mdao=new SQ_memberDAO();
		mdao.addSQArtist(sq_artist);
		System.out.println("야호");
	}
}


