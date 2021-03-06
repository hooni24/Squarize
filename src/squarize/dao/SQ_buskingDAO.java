package squarize.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import squarize.util.MybatisConfig;
import squarize.vo.SQ_busking;

public class SQ_buskingDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	private SqlSession ss;
	
	public List<SQ_busking> buskingList(String id){
		try {
			ss = factory.openSession();
			if(id == null){
				return ss.selectList("sq_buskingMapper.selectAll");
			}else {
				return ss.selectList("sq_buskingMapper.selectAllwithId", id);
			}
		} finally {
			ss.close();
		}
	}
	
	public List<SQ_busking> searchList(String genre){
		try {
			ss = factory.openSession();
			return ss.selectList("sq_buskingMapper.searchList", genre);
		} finally {
			ss.close();
		}
	}

	public List<SQ_busking> searchBand(String bandName){
		System.out.println("dao searchband" + bandName);
		try {
			ss = factory.openSession();
			return ss.selectList("sq_buskingMapper.searchBand", bandName);
		} finally {
			ss.close();
		}
	}

	public SQ_busking buskingDetail(int sq_busking_id){
		try {
			ss = factory.openSession();
			return ss.selectOne("sq_buskingMapper.selectOne", sq_busking_id);
		} finally {
			ss.close();
		}
	}

	/**
	 * 버스킹 정보 등록
	 */
	public void addBusking(SQ_busking SQ_busking) {
		try {
			System.out.println(SQ_busking.toString());
			ss = factory.openSession();
			ss.insert("sq_buskingMapper.addBusking", SQ_busking);
			ss.commit();
		} finally {
			ss.close();
		}
		
	}
	
	/**
	 * 시간지난 버스킹 정보 삭제
	 */
	public void deleteTimeout(){
		try {
			ss = factory.openSession();
			ss.delete("sq_buskingMapper.deleteTimeout");
			ss.commit();
		} finally {
			ss.close();
		}
	}

	public void addGoodock(SQ_busking busking) {
		try {
			ss = factory.openSession();
			ss.insert("sq_buskingMapper.addGoodock", busking);
			ss.commit();
		} finally {
			ss.close();
		}
	}

	public void removeGoodock(SQ_busking busking) {
		try {
			ss = factory.openSession();
			ss.delete("sq_buskingMapper.removeGoodock", busking);
			ss.commit();
		} finally {
			ss.close();
		}
	}
	
}
