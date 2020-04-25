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
	private String productImageName;
	private String priceRange;
	private int productBrand;
	private String productImageName;
	
	
	//Other fields
	private List<LinkedList<String>> productList;
	
	
	
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
		return "ProductDetailsBean [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productQuantity=" + productQuantity + ", productCategory=" + productCategory
				+ ", productSubCategory=" + productSubCategory + ", productPrice=" + productPrice
				+ ", productSoldCount=" + productSoldCount + ", createUser=" + createUser + ", createDate=" + createDate
				+ ", modifyUser=" + modifyUser + ", modifyDate=" + modifyDate + ", isHidden=" + isHidden
				+ ", productImageName=" + productImageName + ", productList=" + productList + "]";
	}
	
	
	
}
