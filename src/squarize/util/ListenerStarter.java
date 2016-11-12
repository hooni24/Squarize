package squarize.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import squarize.dao.SQ_buskingDAO;

public class ListenerStarter implements ServletContextListener{
    public void contextInitialized(ServletContextEvent event){
    	new Thread(new deleteThread()).start();
    }

    public void contextDestroyed(ServletContextEvent event) {
    }

}

class deleteThread implements Runnable{
	private SQ_buskingDAO dao = new SQ_buskingDAO();
	@Override
	public void run() {
		try {
			dao.deleteTimeout();
			Thread.sleep(1800000);			// 1,000mil = 1sec / 60,000mil = 60sec = 1min / 1,800,000mil = 30min
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}