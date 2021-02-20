package kr.or.ddit.common.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

/**
 * SqlMapClient 객체를 제공하는 팩토리 클래스
 * 
 * @author pc01
 *
 */
public class SqlMapClientFactory {
	private static SqlMapClient smc;

	private SqlMapClientFactory() {
		
	}
	
	public static SqlMapClient getInstance() {
		if (smc == null) {
			try {
				Charset charset = Charset.forName("UTF-8");
				Resources.setCharset(charset);
				Reader rd = Resources.getResourceAsReader("kr/or/ddit/sqlMapConfig/SqlMapConfig.xml");
				smc = SqlMapClientBuilder.buildSqlMapClient(rd);

				rd.close(); 
			} catch (IOException e) {
				System.out.println("SqlMapClient 객체 생성 실패..");
				e.printStackTrace();
			}
		}
		return smc;
	}
}