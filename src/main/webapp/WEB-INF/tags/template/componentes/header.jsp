<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:url var="home" value="/" />
<c:url var="login" value="/login" />
<c:url var="logout" value="/logout" />
<c:url var="perfil" value="/usuarios/perfil" />
<c:url var="images" value="/static/images" />

<sec:authentication property="principal" var="usuario" />

<div class="natural-header">
	<sec:authorize access="isAuthenticated()">
		<button class="header-hamburguinho" aria-controls="headerMobile" aria-expanded="false"></button>
	</sec:authorize>
	
	<a href="${home}">
		<img class="header-logo" src="${images}/logo-alura.svg" alt="alura">
	</a>
	
	<sec:authorize access="!isAuthenticated()">
		<div class="headerUnlogged">
			<a class="headerUnlogged-login" href="${login}">Login</a>
			<a href="<c:url value="/usuarios/cadastro" />" class="signup-invite-cta-button">Cadastre-se</a>
		</div>
	</sec:authorize>
</div>

<header id="headerMobile" class="header headerMobile headerMobile--collapsed" aria-hidden="true">
	<div class="headerMobile-collapsed-top">
		<button class="header-hamburguinho header-hamburguinho--branco" aria-controls="headerMobile" aria-expanded="true"></button>
	</div>

	<sec:authorize access="isAuthenticated()">
		<form id="form-logout" action="${logout}" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
		
		
		<div class="headerMobile-content">
			<section class="headerMobile-content-headline">
				<div class="content-headline-profile ">
					<img src="${images}/avatar.png" alt="Foto de ${usuario.nome}" class="headline-profile-avatar">
					<span class="headline-profile-info">
						<p class="profile-info-name">${usuario.nome}</p>
					</span>
				</div>
			</section>
	
			<menu class="header-content-menu" role="navigation">
				<section class="content-menu-section">
					<h2 class="content-menu-title" tabindex="0">
						<a class="content-menu-button menu-button-mobile button-mobile--collapsed">Meu Perfil </a>
					</h2>
	
					<nav id="profileList" class="header-nav header-nav-profile" aria-hidden="true" tabindex="-1">
						<nav class="header-nav-subLinks">
							<a class="header-subLinks-firstLink header-nav-link--profile" href="${perfil}" tabindex="-1">Perfil</a>
							<a class="header-subLinks-secondLink" href="${perfil}" tabindex="-1">Editar perfil</a>
						</nav>
	
						<a class="header-nav-link header-nav-link--logout logout" tabindex="-1">Sair </a>
					</nav>
				</section>
			</menu>
		</div>
	</sec:authorize>
</header>

<header class="header headerDesktop">
	<div class="container">
		<a href="${home}">
			<img class="header-logo" src="${images}/logo-alura.svg" alt="alura">
		</a>

		<sec:authorize access="!isAuthenticated()">
			<div class="headerUnlogged">
				<a class="headerUnlogged-login" href="${login}">Login</a>
				<a href="<c:url value="/usuarios/cadastro" />" class="signup-invite-cta-button">Cadastre-se</a>
			</div>
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<nav class="headerDesktop-content-menu" role="navigation" aria-label="menu principal">
				<div class="content-menu-section content-menu-section-profile ">
					<a role="button" tabindex="0" aria-label="minha conta" class="content-menu-button menu-button-desktop profile-info-name" aria-expanded="false" aria-controls="profileList">
						<img src="${images}/avatar.png" alt="Foto de ${usuario.nome}" class="headline-profile-avatar headline-profile-avatar"> <span class="screenReader-only">perfil de</span>${usuario.nome}
					</a>
	
					<nav id="profileList" class="header-nav header-nav-profile" aria-hidden="true" tabindex="-1">
						<nav class="header-nav-subLinks">
							<a class="header-subLinks-firstLink header-nav-link--profile" href="${perfil}" tabindex="-1">Perfil</a>
							<a class="header-subLinks-secondLink" href="${perfil}" tabindex="-1">Editar perfil</a>
						</nav>
	
						<a class="header-nav-link header-nav-link--logout logout" href="#" tabindex="-1">Sair </a>
					</nav>
				</div>
			</nav>
		</sec:authorize>
	</div>
</header>
