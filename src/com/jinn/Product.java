package com.jinn;
import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Upload_Ser
 */
@WebServlet("/Product")
@MultipartConfig(maxFileSize=16177215)
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		InputStream inputStream = null;
		
		PreparedStatement statement;
		Connection connection;
		
		int i;
//		int id=Integer.parseInt(request.getParameter("id"));
//		String name=request.getParameter("name");
	
		int id;
		String name;
		String category;
		String price;
		String active;
		String description;
		
		
		Part filePart = request.getPart("photo");
		Part idPart = request.getPart("id");
		Part namePart = request.getPart("name");
		Part categoryPart = request.getPart("category");
		Part pricePart = request.getPart("price");
		Part activePart = request.getPart("active");
		Part descriptionPart = request.getPart("description");
		

		id=Integer.parseInt(getValue(idPart));
		name=getValue(namePart);
		category=getValue(categoryPart);
		price=getValue(pricePart);
		active=getValue(activePart);
		description=getValue(descriptionPart);
		
		
		
		
		if(filePart!=null)
		{
			System.out.println(filePart.getName());
			
			inputStream=filePart.getInputStream();
		}
		else
		{
			System.out.println("photo null");
		}
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
			
			statement=connection.prepareStatement("insert into dress values(?,?,?,?,?,?,?)");
			statement.setInt(1, id);
			statement.setString(2, name);
			statement.setString(3, category);
			statement.setString(4, price);
			statement.setString(5, active);
			statement.setString(6, description);
			statement.setBlob(7, inputStream);
			i=statement.executeUpdate();
			
			if(i>0)
			{
				out.print("<h1>record saved</h1>");
			}
			else
			{
				out.print("<h2>record not saved</h2>");
			}
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	private static String getValue(Part part) throws IOException {
	    BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"));
	    StringBuilder value = new StringBuilder();
	    char[] buffer = new char[1024];
	    for (int length = 0; (length = reader.read(buffer)) > 0;) {
	        value.append(buffer, 0, length);
	    }
	    return value.toString();
	}
}