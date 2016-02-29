/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import dao.Ibatis;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author CDAC-49
 */
public class AppServletContextListener implements ServletContextListener {

    ServletContext context;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        context = sce.getServletContext();
        try {
            context.removeAttribute("itemMetadataList");
            context.removeAttribute("audioMetadataList");
            context.setAttribute("itemMetadataList", Ibatis.getSqlMap().queryForList("wbsl.getItem_metadata"));
            
        } catch (Exception e) {
            System.out.println("Error in List Population");
            e.printStackTrace();
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Context Destroyed");
        context = sce.getServletContext();
        context.removeAttribute("itemMetadataList");
        context.removeAttribute("audioMetadataList");
    }
}
