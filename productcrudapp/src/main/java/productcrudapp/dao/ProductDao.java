package productcrudapp.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import productcrudapp.modal.Product;

@Component
public class ProductDao {
	@Autowired
	private HibernateTemplate hibernamteTemplate;
	
	
//	create 
	@Transactional
	public void createProduct(Product product) {
	this.hibernamteTemplate.saveOrUpdate(product);
		
	}
//	getAllProducts
	public 	List<Product> getProducts(){
		
		List<Product> products = this.hibernamteTemplate.loadAll(Product.class);
		return products;
	}
//delete the single product
	@Transactional
	public void deleteProduct(int pId) {
		Product p = this.hibernamteTemplate.load(Product.class, pId);
		this.hibernamteTemplate.delete(p);
	}
//	get the single product 
	public Product getProduct(int pId) {
		return this.hibernamteTemplate.get(Product.class, pId);
	}
	
}
