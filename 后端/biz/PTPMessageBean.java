package biz;

import javax.annotation.Resource;
import javax.ejb.ActivationConfigProperty;
import javax.ejb.EJB;
import javax.ejb.MessageDriven;
import javax.ejb.MessageDrivenContext;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import javax.jms.TextMessage;

import org.hornetq.api.core.client.ClientSession.QueueQuery;

import entity.Ticket;

/**
 * Message-Driven Bean implementation class for: PTPMessageBean
 */
@MessageDriven(activationConfig =  {
        @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue"),
        @ActivationConfigProperty(propertyName = "destination", propertyValue = "queue/test")
    })

public class PTPMessageBean implements MessageListener {
	@EJB
	private dao.QueneDao queneDao;
    @Resource
    private MessageDrivenContext mdc;
    
    public PTPMessageBean() {
    	System.out.println("创建了一个ptpmessage");
    }
    
    public void onMessage(Message inMessage) {
        try {
            if (inMessage instanceof ObjectMessage) {
                ObjectMessage objMessage = (ObjectMessage) inMessage;
                Ticket ticket = (Ticket) objMessage.getObject();
                System.out.println("ticketid:"+ticket.getid());
                System.out.println("ticketuserid:"+ticket.getuserid());
                System.out.println("ticketsightid:"+ticket.getsightid());
                queneDao.solveQuene(ticket);
                System.out.println("Received Ticket: " + ticket);
            } else {
                System.out.println("Message of wrong type: " + inMessage.getClass().getName());
            }
        } catch (JMSException e) {
            e.printStackTrace();
            mdc.setRollbackOnly();
        } catch (Throwable te) {
            te.printStackTrace();
        }
    }
}
