package utils;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

@ApplicationPath("/api")
public class MyRESTApplication extends Application {
    // 空类即可，RESTEasy会自动扫描路径下的资源类
	
}