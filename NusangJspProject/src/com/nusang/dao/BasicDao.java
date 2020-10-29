package com.nusang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sqlmap.SqlSessionManager;

public class BasicDao<T> {

	protected static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();

	protected String namespace = null;
	private String uidName = null;

	public BasicDao(String namespace, String uidName) {
		this.namespace = namespace;
		this.uidName = uidName;
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
	public T findBy(String search, Object keyword) {
		SqlSession session = sqlSessionFactory.openSession();
		T object = null;
		try {
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("keyword", keyword);
		object = session.selectOne(namespace + "findBy", map);
		session.commit();
		session.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

	// 테이블 고유값으로 찾기
	public T findByNo(int keyword) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", uidName);
		map.put("keyword", keyword);
		T object = session.selectOne(namespace + "findBy", map);
		session.commit();
		session.close();
		return object;
	}

	protected T findBy(SqlSession session, String search, Object keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("keyword", keyword);
		T object = session.selectOne(namespace + "findBy", map);
		return object;
	}

	public List<T> findByList(String search, String keyword) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("keyword", keyword);
		List<T> object = session.selectList(namespace + "findBy", map);
		session.close();
		return object;
	}

	protected int insert(SqlSession session, Object object) {
		return session.insert(namespace + "insert", object);
	}

	public int insert(Object object) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.insert(namespace + "insert", object);
		session.commit();
		return result;
	}

	protected void updateBy(SqlSession session, int primeryNo, String colum, Object value) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(uidName, primeryNo);
		map.put("colum", colum);
		map.put("value", value);
		session.update(namespace + "updateBy", map);
	}

	public int update(T t) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.update(namespace + "update", t);
		session.commit();
		return result;
	}

	public int update(SqlSession session, T t) {
		int result = session.update(namespace + "update", t);
		return result;
	}

	public void updateBy(int userNo, String colum, Object value) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(uidName, userNo);
		map.put("colum", colum);
		map.put("value", value);
		session.update(namespace + "updateBy", map);
		session.commit();
		session.close();
	}
}
