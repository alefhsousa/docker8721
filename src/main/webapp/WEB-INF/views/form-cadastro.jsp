<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags/template"%>

<c:url var="images" value="/static/images" />

<custom:template>
	<jsp:body>
		<div class="container">
			<section class="sign">
				<section class="signin">
					<h2 class="title">Quer participar do fórum?</h2>
					<p class="subtitle">Cadastre-se gratuitamente!</p>
					
					
					<c:if test="${not empty mensagemErro}">
						<div class="alert" data-category="error" role="alert">
							<img alt="" class="alert-icon" src="${images}/error.svg">
							<p class="alert-message">${mensagemErro}</p>
						</div>
					</c:if>
					
					<form class="signin-form" action="<c:url value="/usuarios/cadastro" />" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						
						<label for="cadastro-nome">Nome</label>
						<input required="required" name="nome" id="cadastro-nome" autofocus="autofocus" value="${usuario.nome}">
						
						<label for="cadastro-email">E-mail</label>
						<input type="email" required="required" name="email" id="cadastro-email" value="${usuario.email}">
		
						<label for="cadastro-senha">Senha</label>
						<input type="password" required="required" name="senha" id="cadastro-senha">
						
						<label for="cadastro-confirmacaoSenha">Confirmação Senha</label>
						<input type="password" required="required" name="confirmacaoSenha" id="cadastro-confirmacaoSenha">
						
						<button class="btn-login" type="submit">Cadastrar</button>
					</form>
				</section>
			</section>
		</div>
	</jsp:body>
</custom:template>