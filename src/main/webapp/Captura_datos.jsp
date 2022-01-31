
<!-- VIDEO 218, 219 --->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import ="org.apache.commons.codec.digest.*" %>

	<%
	
	String nombre=request.getParameter("nombre");
	String apellido=request.getParameter("apellido");
	String usuario=request.getParameter("usuario");
	String contrasena=request.getParameter("contra");
	String pais=request.getParameter("pais");
	String tecno=request.getParameter("tecnologias");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	try {
	
		Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/epi_practica","root","968574");
		
		// Este código sirve para comprobar si existe un usuario
		
		PreparedStatement miPr = miConexion.prepareStatement("SELECT * FROM `usuarios` WHERE `USUARIO`=? AND `CONTRASENA`=?");
	
		miPr.setString(1, usuario);
		miPr.setString(2, contrasena);
		
		ResultSet miRs = miPr.executeQuery();
		
		if (miRs.absolute(1)) {
			
			out.println("Ya existe el usuario");
		}
		
		else {
		
		//  ---------------------------------------------------
		
		Statement miSt = miConexion.createStatement();
	
		String insSql = "INSERT INTO `usuarios` (Nombre, Apellido, Usuario, Contrasena, Pais, Tecnologia) VALUES ('"+ nombre +"','"+ apellido +"','"+ usuario +"','"+ contrasena +"','"+ pais +"','"+ tecno +"')";								
	
		miSt.executeUpdate(insSql);
	
		out.println("Usuario correctamente registrado");
		
		}
	
	} catch (Exception e){
		
		e.printStackTrace();
	}
	
	%>

</body>
</html>