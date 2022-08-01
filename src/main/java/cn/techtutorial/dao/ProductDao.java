package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import cn.techtutorial.model.Cart;
import cn.techtutorial.model.Product;

public class ProductDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public ProductDao(Connection con) {
		this.con = con;
	}
	
	public List<Product> getAllProducts(){
		List<Product> products = new ArrayList<Product>();
		
		try {
			query="select * from products";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				 
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				products.add(row);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return products;
		
	}
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		//declaring an empty arraylist named product of Cart type
		List<Cart> products = new ArrayList<Cart>();
		
		try {
			//checks if there is anything is in the cartList 
			if(cartList.size()>0) {
				//item is used to iterate from the cartList arraylist of Cart clz 
				for(Cart item:cartList) {
					query = "select * from products where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
					
					while(rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						//added the object to the initiallly made empty object arraylist type
						products.add(row);
					}
				}
					
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum=0;
		//this below object controls the decimal of the sum 
		 DecimalFormat df = new DecimalFormat("#.00");
		try {
			//this checks if any exst in the cartList object type arraylist
			if(cartList.size()>0) {
				//if so then loop starts to fetxh relevants
				for(Cart item:cartList) {
					query="select price from products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1,item.getId());
					rs=pst.executeQuery();
					
					while(rs.next()) {
						//sum is inititlalyinitialized to zero the price from the database is fetched relevat to the prduct id and quantity from the cartList array is multiplied in order to get the total
						sum=sum+rs.getDouble("price")*item.getQuantity();
					}
				}
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
//		return sum;
		//returns the sum to limit from 2 deciml places and to convert strig type to double
		return Double.parseDouble(df.format(sum));
	}
	
	
}
