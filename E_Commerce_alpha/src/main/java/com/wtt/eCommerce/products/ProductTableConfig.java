package com.wtt.eCommerce.products;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="product_info")
public class ProductTableConfig {

	@Id
	@Column(name="prod_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int productId;
	
	@Column(name="prod_name")
	private String productName;
	
	@Column(name="prod_desc")
	private String productDescription;
	
	@Column(name="prod_quantity")
	private String productQuantity;
	
	@Column(name="prod_category")
	private int productCategory;
	
	@Column(name="prod_sub_category")
	private int productSubCategory;
	
	@Column(name="prod_price")
	private double productPrice;
	
	@Column(name="prod_sold_count")
	private int productSoldCount;
	
	@Column(name="prod_createUser")
	private int createUser;
	
	@Column(name="prod_createDate")
	private Date createDate;
	
	@Column(name="prod_modifyUser")
	private int modifyUser;
	
	@Column(name="prod_modifyDate")
	private Date modifyDate;
	
	@Column(name="prod_isHidden")
	private int isHidden;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}

	public int getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(int productCategory) {
		this.productCategory = productCategory;
	}

	public int getProductSubCategory() {
		return productSubCategory;
	}

	public void setProductSubCategory(int productSubCategory) {
		this.productSubCategory = productSubCategory;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductSoldCount() {
		return productSoldCount;
	}

	public void setProductSoldCount(int productSoldCount) {
		this.productSoldCount = productSoldCount;
	}

	public int getCreateUser() {
		return createUser;
	}

	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getModifyUser() {
		return modifyUser;
	}

	public void setModifyUser(int modifyUser) {
		this.modifyUser = modifyUser;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getIsHidden() {
		return isHidden;
	}

	public void setIsHidden(int isHidden) {
		this.isHidden = isHidden;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductTableConfig [productId=");
		builder.append(productId);
		builder.append(", ");
		if (productName != null) {
			builder.append("productName=");
			builder.append(productName);
			builder.append(", ");
		}
		if (productDescription != null) {
			builder.append("productDescription=");
			builder.append(productDescription);
			builder.append(", ");
		}
		if (productQuantity != null) {
			builder.append("productQuantity=");
			builder.append(productQuantity);
			builder.append(", ");
		}
		builder.append("productCategory=");
		builder.append(productCategory);
		builder.append(", productSubCategory=");
		builder.append(productSubCategory);
		builder.append(", productPrice=");
		builder.append(productPrice);
		builder.append(", productSoldCount=");
		builder.append(productSoldCount);
		builder.append(", createUser=");
		builder.append(createUser);
		builder.append(", ");
		if (createDate != null) {
			builder.append("createDate=");
			builder.append(createDate);
			builder.append(", ");
		}
		builder.append("modifyUser=");
		builder.append(modifyUser);
		builder.append(", ");
		if (modifyDate != null) {
			builder.append("modifyDate=");
			builder.append(modifyDate);
			builder.append(", ");
		}
		builder.append("isHidden=");
		builder.append(isHidden);
		builder.append("]");
		return builder.toString();
	}
	

	
}
