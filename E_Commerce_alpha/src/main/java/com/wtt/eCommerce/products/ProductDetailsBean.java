package com.wtt.eCommerce.products;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class ProductDetailsBean {
	
	private int offset;
	private int limit;
	
	
	//Single product fields
	private int productId;
	private String productName;
	private String productDescription;
	private String productQuantity;
	private int productCategory;
	private int productSubCategory;
	private double productPrice;
	private int productSoldCount;
	private int createUser;
	private Date createDate;
	private int modifyUser;
	private Date modifyDate;
	private int isHidden;
	private String priceRange;
	private int productBrand;
	private String productImageName;
	
	
	//Other fields
	private List<LinkedList<String>> productList;
	
	private List<String> productIdList;
	
	
	
	public List<String> getProductIdList() {
		return productIdList;
	}
	public void setProductIdList(List<String> productIdList) {
		this.productIdList = productIdList;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(int productBrand) {
		this.productBrand = productBrand;
	}
	public String getPriceRange() {
		return priceRange;
	}
	public void setPriceRange(String priceRange) {
		this.priceRange = priceRange;
	}
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
	
	
	public List<LinkedList<String>> getProductList() {
		return productList;
	}
	public void setProductList(List<LinkedList<String>> productList) {
		this.productList = productList;
	}
	public String getProductImageName() {
		return productImageName;
	}
	public void setProductImageName(String productImageName) {
		this.productImageName = productImageName;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductDetailsBean [offset=");
		builder.append(offset);
		builder.append(", limit=");
		builder.append(limit);
		builder.append(", productId=");
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
		builder.append(", ");
		if (priceRange != null) {
			builder.append("priceRange=");
			builder.append(priceRange);
			builder.append(", ");
		}
		builder.append("productBrand=");
		builder.append(productBrand);
		builder.append(", ");
		if (productImageName != null) {
			builder.append("productImageName=");
			builder.append(productImageName);
			builder.append(", ");
		}
		if (productList != null) {
			builder.append("productList=");
			builder.append(productList);
			builder.append(", ");
		}
		if (productIdList != null) {
			builder.append("productIdList=");
			builder.append(productIdList);
		}
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
