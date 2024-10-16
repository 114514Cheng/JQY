package dao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import entity.Ticket;

@Stateless
public class QueneDao {
    @PersistenceContext(unitName = "TravelProject")
    private EntityManager manager;

    public void solveQuene(Ticket ticket) {
        // 检查数据库中是否存在相同的票
        TypedQuery<Ticket> query = manager.createQuery(
            "SELECT t FROM Ticket t WHERE t.id = :ticketid OR t.userid = :userid", Ticket.class);
        query.setParameter("ticketid", ticket.getid());
        query.setParameter("userid", ticket.getuserid());
        List<Ticket> tickets = query.getResultList();

        if (!tickets.isEmpty()) {
            return;
        }

        Ticket ticket2 = new Ticket();
        ticket2.setid(ticket.getid());
        ticket2.setsightid(ticket.getsightid());
        ticket2.setuserid(ticket.getuserid());
        System.out.println(ticket2.getid());
        System.out.println(ticket2.getsightid());
        System.out.println(ticket2.getuserid());
        manager.persist(ticket2);
    }
}
