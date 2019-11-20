import com.chixing.dao.CartDao;
import com.chixing.dao.CustomerDao;
import com.chixing.dao.ProdcuctDao;
import com.chixing.dao.impl.CartDaoImpl;
import com.chixing.dao.impl.CustomerDaoImpl;
import com.chixing.dao.HeroDao;
import com.chixing.dao.impl.HeroDaoImpl;
import com.chixing.dao.impl.ProdcuctDaoImpl;
import com.chixing.pojo.Customer;
import com.chixing.pojo.Hero;
import com.chixing.pojo.Product;
import org.junit.Test;

import java.util.List;

public class TestHeroDao {

    @Test
    public  void testSelectAllHero(){
        HeroDao dao = new HeroDaoImpl();
       List<Hero> heroList =   dao.selectAll();
       for(Hero hero:heroList){
           System.out.println(hero);
       }
    }


    @Test
    public  void testSelectCustomer(){
        CustomerDao dao = new CustomerDaoImpl();
        Customer customer =   dao.selectByCustNameAndPwd("张明","abc123");
        System.out.println(customer);
    }

    @Test
    public  void testSelectCart(){
        CartDao dao = new CartDaoImpl();
        List<Product> productList =   dao.selectAllProduct(1);
        System.out.println(productList);
    }



    @Test
    public  void testSelectAllProduct(){
        ProdcuctDao dao = new ProdcuctDaoImpl();
        List<Product> productList =   dao.selectAll();
        System.out.println(productList);
    }


}
