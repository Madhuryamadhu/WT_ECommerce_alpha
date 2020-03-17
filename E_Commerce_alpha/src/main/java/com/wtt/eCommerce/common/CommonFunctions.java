package com.wtt.eCommerce.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.HibernateException;
import org.springframework.web.multipart.commons.CommonsMultipartFile;



public class CommonFunctions {
	private static final Logger logger = LogManager.getLogger();
	/* checks if the value is not empty or not null and returns true if valid and false if not valid */
	public static boolean isValid(String str) {
		if(str != null && !str.isEmpty())
			return true;
		return false;
	}

	/* checks if the value is valid and returns assigned value if invalid */
	public static String assignValueIfInvalid(String checkValue,String assignValue) {
		if(isValid(checkValue))
			return assignValue;
		else
			return checkValue;
	}



	public Date getDateFromString(String dateString,String formatString) {
		Date date=null;
		try {
			date = new SimpleDateFormat(formatString).parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		return date;
	}

	public String getStringdateFromDate(Date date,String formatString) {
		String dateString="";
		try {
			dateString = new SimpleDateFormat(formatString).format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dateString;
	}

	public String changeDateFormat(String fromDate,String fromFormat,String toFormat) {
		String dateString="";
		try {
			dateString= new SimpleDateFormat(toFormat).format(new SimpleDateFormat(fromFormat).parse(fromDate));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dateString;
	}


	public String getFromProperty(String file,String property) {
		String value="";
		InputStream inputStream;
		try {
			Properties prop = new Properties();
			String propFileName = file+".properties";

			inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

			if (inputStream != null) {
				prop.load(inputStream);
			} 
			value=prop.getProperty(property);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return value;
	}

	public Connection getConnection() {
		Connection connection=null;
		try {
			final String JDBC_DRIVER = getFromProperty("General", "JDBC_DRIVER");
			final String DB_URL = getFromProperty("General", "DB_URL");
			final String USER = getFromProperty("General", "USER");
			final String PASS = getFromProperty("General", "PASSWORD");

			Class.forName(JDBC_DRIVER);
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}


	public boolean uploadFileToPath(CommonsMultipartFile commonsMultipartFile,String baseDirctory,String dirName,String fileName) {
		ArrayList<String> attachments = new ArrayList<String>();
		File dirFile = null;
		File convFile = null;
		FileOutputStream fos = null;
		String fullFilePath="";
		boolean isUploaded=false;
		try {
			dirFile = new File(baseDirctory.trim()+dirName.trim());
			if(!dirFile.exists()){
				if(!dirFile.mkdir()){
					logger.info("Created directory "+dirName+" for file upload");
				}
			}

			fullFilePath=(baseDirctory+dirName)+"/"+fileName;
			logger.info("Uploading file to path:-"+fullFilePath);
			convFile = new File(fullFilePath);
			convFile.createNewFile(); 
			fos = new FileOutputStream(convFile); 
			fos.write(commonsMultipartFile.getBytes());
			attachments.add(fullFilePath);
			isUploaded=true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return isUploaded;
	}


	


	public static void main(String[] args) {
		try {

		} catch (HibernateException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}

	}
}
