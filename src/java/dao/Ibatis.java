package dao;

/*
 * Ibatis.java
 *
 * Created on October 4, 2007, 6:25 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */


import java.io.Reader;

import java.io.IOException;

import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 *
 * @author root
 */
public class Ibatis {

       private static SqlMapClient sqlMap = null;
       private static String resource = "/db_config/sqlMapConfig.xml";

       public static SqlMapClient getSqlMap() throws IOException {

        if (sqlMap == null) {
            try {
            Reader reader = Resources.getResourceAsReader(resource);
            sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return sqlMap;

       }
}