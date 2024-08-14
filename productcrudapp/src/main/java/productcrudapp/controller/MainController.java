package productcrudapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import productcrudapp.dao.ProductDao;
import productcrudapp.modal.Product;

@Controller
public class MainController {
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/")
	public String home(Model m) {
		
		List<Product> list = productDao.getProducts();
		m.addAttribute("products",list);
		return "index";
	}
	
	@RequestMapping("/add-product")
	public String addProduct(Model m) {
		m.addAttribute("title","Add Product");
		
		return "add_product_form";
	}
	
	
	@RequestMapping(value = "/handle-product" , method = RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product  product , HttpServletRequest request) {
		productDao.createProduct(product);
		
		RedirectView rv = new RedirectView();
		rv.setUrl(request.getContextPath()+"/");
		
		return rv;
	}
	
	//delete handler
	@RequestMapping("/delete/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId , HttpServletRequest request) {
		this.productDao.deleteProduct(productId);
		
		RedirectView rv = new RedirectView();
		rv.setUrl(request.getContextPath()+"/");
		
		return rv;
	}
	
	@RequestMapping("/update/{productId}")
	public String updateProduct(@PathVariable("productId") int productid , Model m) {
		Product product = this.productDao.getProduct(productid);
		 
		m.addAttribute("product",product);
		
		return "update_form";
	}
	
}
