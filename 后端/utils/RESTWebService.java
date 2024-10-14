package utils;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/webservice")
public class RESTWebService {
	@GET
	@Produces(MediaType.APPLICATION_JSON)
    public String getWeatherInfo() {
        // 这里返回一个简单的JSON字符串作为示例
        return "{\"location\":\"自然景区\",\"Temperature\":\"25°C\",\"condition\":\"晴\",\"traffic\":\"畅通\"}";
    }
}
