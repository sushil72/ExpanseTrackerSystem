package com.dao;


import com.entity.Income;
import com.entity.User;
import org.hibernate.*;

import com.entity.Expenses;

import java.math.BigInteger;
import java.util.*;

public class ExpenseDao {
	private SessionFactory factory=null;
	private Session session=null;
	private Transaction txn=null;
	
	public ExpenseDao(SessionFactory factory)
	{
		super();
		this.factory=factory;
	}
	
	public boolean saveExpense(Expenses ex)
	{
		boolean f=false;
		try {
			session =factory.openSession();
			txn=session.beginTransaction();
			session.save(ex);
			
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

	public List<Expenses> getAllExpenseByUser(User user)
	{
		List<Expenses> list = new ArrayList<>();
		try{
			this.session=factory.openSession();
			Query query =  session.createQuery("from Expenses where user=:us");
			query.setParameter("us",user);
			list=query.list();

		}catch (Exception e){
		e.printStackTrace();
		}

        return list;
    }

	public Expenses getExpenseById(int id )
	{
		Expenses expenses = null;
		try{

		this.session=factory.openSession();
		Query query = session.createQuery("from Expenses  where id =: id");
		query.setParameter("id", id);
		expenses = (Expenses) query.uniqueResult();
		} catch (HibernateException e) {
            throw new RuntimeException(e);
        }
        return expenses;
	}

	public boolean updateExpanse(Expenses ex)
	{
		boolean f=false;
		try {
			session =factory.openSession();
			txn=session.beginTransaction();
			session.saveOrUpdate(ex);

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

	public boolean DeleteExpanse(int id )
	{
		boolean f=false;
		try {
			session =factory.openSession();
			txn=session.beginTransaction();
			Expenses expenses =  session.getReference(Expenses .class,id);
			session.delete(expenses);
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

	public long getCount(User  user )
	{
		long count=0;
		this.session=factory.openSession();
		try{
			Query query = session.createQuery("SELECT COUNT(*) FROM Expenses WHERE user = :user");
			query.setParameter("user", user);
			count = (long) query.uniqueResult();

		} catch (Exception e) {
            throw new RuntimeException(e);
        }

        return  count;
	}

	public  boolean addIncome(Income in)
	{
		boolean  f =false;
		try{
			this.session=factory.openSession();

			txn = session.beginTransaction();
			session.save(in);
			txn.commit();
			f=true;

		} catch (HibernateException e) {
			if(txn!=null)
			{
				f=false;
			}
            throw new RuntimeException(e);
        }
		return f;

    }
	public long getIncome(User user) {
		this.session=factory.openSession();

		try {
			Query<Long> query = session.createQuery("SELECT SUM(amount) FROM Income WHERE user = :user", Long.class);
			query.setParameter("user", user);
        Long    totalIncome= query.uniqueResult();
			return totalIncome!=null ? totalIncome  : 0L;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  0L;
	}

	public long TotalExpanses(User user) {
		this.session=factory.openSession();

		try {
			Query<Long> query = session.createQuery("SELECT SUM(amount) FROM Expenses WHERE user = :user", Long.class);
			query.setParameter("user", user);
			Long    totalIncome= query.uniqueResult();
			return totalIncome!=null ? totalIncome  : 0L;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  0L;
	}

	public List<BigInteger> fetchIncomeArray(User user) {
		List<BigInteger> incomeData = new ArrayList<>();
		Session session = null;
		try {
			session = factory.openSession();
			Query<BigInteger> query = session.createQuery("SELECT CAST(e.amount AS java.math.BigInteger) FROM Income e WHERE e.user = :user", BigInteger.class);
			query.setParameter("user", user);
			incomeData = query.list(); //query.addEntity(Students.class).list()


		} catch (Exception e) {
			e.printStackTrace();
			// Handle exceptions as needed
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return incomeData;
	}


	public List<BigInteger> fetchExpenseArray(User user) {
		List<BigInteger> expData = new ArrayList<>();

		try {
			session = factory.openSession();
			Query<BigInteger> query = session.createQuery("SELECT CAST(e.amount AS java.math.BigInteger) FROM Expenses e WHERE e.user = :user", BigInteger.class);
			query.setParameter("user", user);
			expData = query.list(); //query.addEntity(Students.class).list();


		} catch (Exception e) {
			e.printStackTrace();
			// Handle exceptions as needed
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return expData;
	}

	public Income getLatestIncome(User user) {
		this.session = factory.openSession();
		try  {
			// Query to fetch the latest income entry
			Query<Income> query = session.createQuery(
					"FROM Income WHERE user = :user ORDER BY incomeId DESC",
					Income.class
			);
			query.setParameter("user", user);
			query.setMaxResults(1); // Retrieve only the first result

			return query.uniqueResult(); // Return the latest income entry
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	public  List<Expenses> getLetestExpense(User user, int limit) {
		try {
			this.session=factory.openSession();
			Query<Expenses> query = session.createQuery(
					"FROM Expenses WHERE user = :user ORDER BY id DESC",
					Expenses.class
			);
			query.setParameter("user", user);
			query.setMaxResults(limit); // Limit the number of results to fetch

			return query.list(); // Return the list of recent transactions
		} catch (Exception e) {
			e.printStackTrace();
			// Handle exceptions as needed
		}
		return Collections.emptyList(); // Return an empty list if there's an error
	}

	public Map<String, Integer> getExpensesByCategoryForUser(User user) {
		Map<String, Integer> expensesByCategory = new HashMap<>();
		try {
			String hql = "SELECT e.category, SUM(e.amount) FROM Expenses e WHERE e.user = :user GROUP BY e.category";
			Query<Object[]> query = session.createQuery(hql, Object[].class);
			query.setParameter("user", user);
			List<Object[]> results = query.list();
			for (Object[] result : results) {
				String category = (String) result[0];
				Integer totalAmount = ((Number) result[1]).intValue(); // Convert Object to Integer
				expensesByCategory.put(category, totalAmount);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// Handle exceptions as needed
		}
		return expensesByCategory;
	}

}
