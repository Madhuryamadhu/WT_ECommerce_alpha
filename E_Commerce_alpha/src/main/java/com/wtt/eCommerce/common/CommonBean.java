package com.wtt.eCommerce.common;

public class CommonBean {

	private String parameters;
	private String pagePath;
	public String getParameters() {
		return parameters;
	}
	public void setParameters(String parameters) {
		this.parameters = parameters;
	}
	public String getPagePath() {
		return pagePath;
	}
	public void setPagePath(String pagePath) {
		this.pagePath = pagePath;
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommonBean [");
		if (parameters != null) {
			builder.append("parameters=");
			builder.append(parameters);
			builder.append(", ");
		}
		if (pagePath != null) {
			builder.append("pagePath=");
			builder.append(pagePath);
		}
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
