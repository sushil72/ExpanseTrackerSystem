package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.entity.User;


public class UserDao {

	private SessionFactory factory=null;
	private Session session=null;
	private Transaction txn=null;
	public UserDao(SessionFactory factory) {
		super();
		this.factory=factory;
		
	}
	
	public UserDao() {
		super();
		
	}
	
	public boolean SaveUser(User user)
	{
		boolean f=false;
		try {
			
			session=factory.openSession();
			txn=session.beginTransaction();	
			session.save(user);
			txn.commit();	
			f=true;
		} catch (Exception e) {
			
			if(txn!=null)
			{
				f=false;
				
				e.printStackTrace();
			}
		}
		return f;
		
	}
	
	 public User loginUser(String email, String password) {
		 User user=null;
		try{

	         this.session = factory.getCurrentSession();

	        session.beginTransaction();

	        String hql = "FROM User WHERE Email = :emailParam AND passwords = :passwordParam";
	        Query<User> query = session.createQuery(hql, User.class);
	        query.setParameter("emailParam", email);
	        query.setParameter("passwordParam", password);
	        user = query.uniqueResult();

	        session.getTransaction().commit();
		   }catch ( Exception e)
		   {
			   e.printStackTrace();
		   }
	        return user;
	    }
}
