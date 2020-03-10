<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags/template"%>

<custom:template>
	<jsp:body>
		<div class="container">
			<section class="sign">
				<section class="signin">
					<h2 class="title">Já é nosso aluno?</h2>
					<p class="subtitle">Faça seu login e boa aula!</p>
					<form class="signin-form" action="<c:url value="/login"/>" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

						<label for="login-email">E-mail</label>
						<input class="fill-with-cached-email" type="email" required="required" name="username" id="login-email" autofocus="autofocus">
		
						<label for="password">Senha</label>
						<input type="password" required="required" name="password" id="password">
						
						<c:if test="${param.error ne null}">
							<h2 style="color:#a94442;">Dados incorretos!</h2>
						</c:if>
						
						<button class="btn-login" type="submit">Entrar</button>
					</form>
				</section>
			</section>
		</div>
	</jsp:body>
</custom:template>