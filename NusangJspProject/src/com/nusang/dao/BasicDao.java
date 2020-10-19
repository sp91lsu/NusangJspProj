package com.nusang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.nusang.dto.User;

import sqlmap.SqlSessionManager;

public class BasicDao<T> {

	protected static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();

	private String namespace = null;

	public BasicDao(String namespace) {
		this.namespace = namespace;
	}

	public List<T> selectAll() {
		SqlSession session = sqlSessionFactory.openSession();
		List<T> list = null;
		list = session.selectList(namespace + "selectAll");
		session.close();
		return list;
	}

	// where 바로 뒤에 검색하고자 하는 검색어는 ${}, 키워드는 #{}
	// 예 : select * from 테이블 where ${search} = #{keyword}
	public T findBy(String search, String keyword) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("keyword", keyword);
		T object = session.selectOne(namespace + "findBy", map);
		session.close();
		return object;
	}

	protected int insert(SqlSession session, Map map) {
		int result = session.insert(namespace + "insert", map);
		session.commit();
		session.close();
		return result;
	}

}
