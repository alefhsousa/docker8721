<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="pt-BR" data-product="alura" class="">

<head>
	<title>Fórum | Alura - Cursos online de tecnologia</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<c:import url="/WEB-INF/tags/template/componentes/stylesheets.jsp"/>
</head>

<body>
	<c:import url="/WEB-INF/tags/template/componentes/header.jsp"/>
	
	<jsp:doBody />
	
	<c:import url="/WEB-INF/tags/template/componentes/footer.jsp"/>
	<c:import url="/WEB-INF/tags/template/componentes/javascripts.jsp"/>
</body>
</html>
