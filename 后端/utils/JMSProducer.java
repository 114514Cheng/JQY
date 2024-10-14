package utils;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;
import java.util.Properties;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;

import javax.ejb.EJB;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;

import biz.BookBean;
import entity.Reservation;
import entity.Ticket;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.text.SimpleDateFormat;

/**
 * <p>Description:JMS�ͻ�����Ϣ������ </p>
 */
public class JMSProducer {
	private static final Logger log = Logger.getLogger(JMSProducer.class.getName());

	private static final String DEFAULT_MESSAGE = "Welcome to JMS queue!";
	private static final String DEFAULT_CONNECTION_FACTORY = "jms/RemoteConnectionFactory";
	private static final String DEFAULT_DESTINATION = "jms/queue/test";
	private static final String DEFAULT_MESSAGE_COUNT = "10";

	private static final String DEFAULT_USERNAME = "chengyu5521";
	private static final String DEFAULT_PASSWORD = "123456";
	private static final String INITIAL_CONTEXT_FACTORY = "org.jboss.naming.remote.client.InitialContextFactory";
	private static final String PROVIDER_URL = "remote://localhost:4447";

	public static void main(String[] args) throws Exception {
		Context context=null;
		Connection connection=null;
		try {
			// 设置上下文
			System.out.println("设置JNDI访问环境信息也就是设置应用服务器的上下文信息!");
			final Properties env = new Properties();
			//初始化Context的工厂类
			env.put(Context.INITIAL_CONTEXT_FACTORY, INITIAL_CONTEXT_FACTORY);
			//Context服务提供者的URL
			env.put(Context.PROVIDER_URL,  PROVIDER_URL);
			//应用用户的登录名,密码.
			env.put(Context.SECURITY_PRINCIPAL, DEFAULT_USERNAME);
			env.put(Context.SECURITY_CREDENTIALS, DEFAULT_PASSWORD);
			// 获取到InitialContext对象.
			context = new InitialContext(env);
			System.out.println ("获取连接工厂!");
			ConnectionFactory connectionFactory = (ConnectionFactory) context.lookup(DEFAULT_CONNECTION_FACTORY);
			System.out.println ("获取目的地!");
			Destination destination = (Destination) context.lookup(DEFAULT_DESTINATION);

			// 创建JMS连接、会话、生产者和消费者
			connection = connectionFactory.createConnection(DEFAULT_USERNAME, DEFAULT_PASSWORD);
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			MessageProducer producer = session.createProducer(destination);
			connection.start();

			int count = Integer.parseInt(DEFAULT_MESSAGE_COUNT);
			// 发送特定数目的消息
			
			//System.out.println("当前时间: " + currentDate);
			Random random = new Random();
            Set<Integer> generatedUserIds = new HashSet<>();

            for (int i = 0; i < count; i++) {
                int userid;
                do {
                    userid = 3+random.nextInt(100);
                } while (generatedUserIds.contains(userid));
                generatedUserIds.add(userid);

                int sightid = 1 + random.nextInt(5); // Generate sightid in the range 1 to 5
                Ticket ticket = new Ticket(); // Assuming id is i + 1 for simplicity
                ticket.setid(i+sightid);
                ticket.setsightid(sightid);
                ticket.setuserid(userid);
                ObjectMessage message = session.createObjectMessage(ticket);
                producer.send(message);
                Thread.sleep(1000); 
			}
			
			
			
			
			
			
		} catch (Exception e) {
			System.out.println ("出现错误!");
			log.severe(e.getMessage());
			throw e;
		} finally {
			if (context != null) {
				context.close();
			}
			// 关闭连接负责会话,生产商和消费者
			if (connection != null) {
				connection.close();
			}
		}
	}
}