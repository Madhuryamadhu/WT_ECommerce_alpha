package com.wtt.eCommerce.products;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.wtt.eCommerce.common.CommonFunctions;
import com.wtt.eCommerce.common.HibernateUtil;

public class ProductDetailsDAO {

	private static final Logger logger = LogManager.getLogger();
	private CommonFunctions commons=new CommonFunctions();

	public boolean getProductListForView(ProductDetailsBean bean) {
		List<LinkedList<String>> productsList=null;
		boolean isSuccess=false;
		try {
			
			//this program will give us the list of products based on filter
			List<Object[]> list = getAllProducts(bean);
			
			productsList=new LinkedList<LinkedList<String>>();
			for (Object[] objects : list) {
				LinkedList<String> productList=new LinkedList<String>();
				productList.add(objects[0]+"");
				productList.add(objects[1]+"");
				productList.add(objects[2]+"");
				productList.add(objects[3]+"");
				
				productsList.add(productList);
			}
			bean.setProductList(productsList);
			isSuccess=true;
		} catch (Exception e) {
			logger.error("Exception occured",e);
		}


		return isSuccess;
	}
	
	
	
	
	//Method to get the products
	public List<Object[]> getAllProducts(ProductDetailsBean bean) {
		List<Object[]> list=null;
		SessionFactory factory=null;
		Session session=null;
		Transaction tr=null;
		try {
			//Getting hibernate connection
			factory = HibernateUtil.getSessionFactory();
			session = factory.getCurrentSession();
			tr = session.beginTransaction();
			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<Object[]> cr = cb.createQuery(Object[].class);
			
			Root<ProductTableConfig> root = cr.from(ProductTableConfig.class);
			
			cr = cr.multiselect(root.get("productId"), root.get("productName"), root.get("productPrice")
					, root.get("prodImageName"));
			
			
			List<Predicate> predicates = new ArrayList<Predicate>();
			predicates.add(cb.equal(root.get("isHidden"),0));
			
			
			if (bean.getProductCategory()>0) {
				predicates.add(cb.equal(root.get("productCategory"),bean.getProductCategory()));
			}
			if (bean.getProductSubCategory()>0) {
				predicates.add(cb.equal(root.get("productSubCategory"),bean.getProductSubCategory()));
			}
			/*if (bean.getProductBrand()>0) {
				predicates.add(cb.equal(root.get("isHidden"),0));
			}*/
			
			if(CommonFunctions.isValid(bean.getPriceRange())) {
				logger.info(bean.getPriceRange());
				
			}
			
			if (predicates.size() > 0) {
				cr = cr.where(predicates.toArray(new Predicate[] {}));
			}
			
			
			//for pagination
			Query<Object[]> q = session.createQuery(cr).setFirstResult(bean.getOffset())
					.setMaxResults(bean.getLimit());
			list = q.getResultList();
			
			
			tr.commit();
		} catch (Exception e) {
			logger.error("Exception occured",e);
		}


		return list;
	}
}
