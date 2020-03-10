<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags/template"%>

<c:url var="images" value="/static/images" />

<sec:authentication property="principal" var="usuario"/>

<custom:template>
	<jsp:body>
		<section class="banner">
			<div class="container">
				<h1 class="banner-title">Seu Perfil</h1>
			</div>
		</section>
		
		<c:if test="${not empty mensagemErro}">
			<div class="alert" data-category="error" role="alert">
				<img alt="" class="alert-icon" src="${images}/error.svg">
				<p class="alert-message">${mensagemErro}</p>
			</div>
		</c:if>
		
		<c:if test="${not empty mensagemSucesso}">
			<div class="alert" data-category="confirmation" role="alert">
				<img alt="" class="alert-icon" src="${images}/confirmation.svg">
				<p class="alert-message">${mensagemSucesso}</p>
			</div>
		</c:if>
		
		<section class="editProfile">
			<div class="container">
				<form action="<c:url value="/usuarios/perfil" />" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					
					<div class="form">
						<div class="alert" data-category="alert" role="alert">
							<img alt="alerta" class="alert-icon" src="${images}/alert.svg">
							<p class="alert-message">Atenção! O email não pode ser alterado.</p>
						</div>
						
						<section id="editProfile-userInfo" class="editProfile-profileInfo">
							<div class="form-header">
								<h3 class="form-header-title form-user-information">Dados do perfil</h3>
								<a class="form-header-option" href="#changePassword-form">Alterar senha</a>
							</div>
		
							<div class="form-line">
								<div class="form-line-field">
									<label class="form-label">Nome</label>
									<input class="form-input" type="text" required="required" name="nome" value="${usuario.nome}">
								</div>
		
								<div class="form-line-field">
									<label class="form-label">E-mail</label>
									<input class="form-input" type="text" readonly="readonly" name="email" value="${usuario.email}">
								</div>
							</div>
						</section>

						<div class="form-submit">
							<input type="submit" class="form-submit-button button buttonAction" value="Salvar">
						</div>
					</div>
				</form>
		
				<section id="changePassword-form" class="editProfile-passwordInfo" style="display: none;">
					<div class="editProfile-passwordInfo-changePassword">
						<a class="editProfile-closeModal" href="#">X</a>
		
						<div class="form-header">
							<h3 class="form-header-title">Alterar senha</h3>
						</div>
		
						<form class="edit-profile-form" action="<c:url value="/usuarios/perfil/senha" />" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							
							<label class="form-label">Senha atual</label>
							<input class="form-input" type="password" name="senhaAtual" required="required">
		
							<label class="form-label">Nova senha</label>
							<input class="form-input" type="password" name="novaSenha" id="newPassword" pattern=".{6,}" required="required" aria-autocomplete="list">
		
							<label class="form-label">Confirme a nova senha</label>
							<input class="form-input" type="password" name="confirmacaoNovaSenha" pattern=".{6,}" required="required">
		
							<div class="form-submit">
								<input type="submit" class="form-submit-button button buttonAction" value="Salvar">
							</div>
						</form>
					</div>
				</section>
			</div>
		</section>
	</jsp:body>
</custom:template>