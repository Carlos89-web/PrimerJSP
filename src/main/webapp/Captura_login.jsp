
<!-- VIDEO 218, 219, 220 --->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import ="org.apache.commons.codec.digest.*" %>


	<%

	String usuario=request.getParameter("usuario");
	String contra=request.getParameter("contra");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	try {
	
		Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/epi_practica","root","968574");
	
		PreparedStatement miPr = miConexion.prepareStatement("SELECT * FROM `usuarios` WHERE `Usuario`=?");
	
		miPr.setString(1, usuario);
		miPr.setString(2, contra);
		
		ResultSet miRs = miPr.executeQuery();
		
		if (miRs.absolute(1)) out.println("Login correcto");
		else out.println("no hay datos de usuario");
	
	} catch (Exception e){
		
		e.printStackTrace();
	}
	
	%>

</body>
</html>