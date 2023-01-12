package com.smhrd.DB;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// mybatis-config.xml 에서 DB 설정 정보를 읽어와 처리하는 역할
public class SqlSessionManager {
	// DB와의 연결, SQL 실행에 대한 모든 역할을 수행해주는 가장 중요한 객체
	public static SqlSessionFactory sqlSessionFactory;

	// 클래스 초기화 블록 : 클래스가 처음으로 로딩될 때 딱 한번만 수행
	static {
		// 읽어올 파일 경로 지정(DB관련 설정 정보 작성)
		String resource = "com/smhrd/DB/mybatis-config.xml";
		Reader reader;
		try {
			// DB정보 읽어오기
			reader = Resources.getResourceAsReader(resource);
			// 읽어온 정보를 활용하여 SessionFactory 만들기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 초기화 블럭에서 생성된 SessionFactory 반환
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}

}
