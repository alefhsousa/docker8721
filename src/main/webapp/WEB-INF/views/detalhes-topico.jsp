<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags/template"%>

<c:url var="images" value="/static/images" />

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="usuario" />
	
	<c:if test="${usuario.moderador}">
		<c:set var="moderador" value="true"/>
	</c:if>
</sec:authorize>

<custom:template>
	<jsp:body>
		<div class="topic">
			<section class="banner">
				<div class="container">
					<h1 class="banner-title">
						<a href="#" class="banner-title-link">Fórum </a>
					</h1>
				</div>
			</section>

			<div class="topic-body">
				<c:if test="${topico.solucionado}">
					<div class="topic-solved">
						<div class="container">
							<p class="topic-solved-text">Solucionado</p>
						</div>
					</div>
				</c:if>
				
				<div class="container"></div>
				
				<header class="topic-header">
					<div class="topic-header-container">
						<div class="topic-header-container-info">
							<h1 class="topic-header-container-title"><c:out value="${topico.titulo}"/></h1>
							
							<c:choose>
								<c:when test="${topico.categoriaMobile}">
									<c:set var="cor" value="#fdc14a"/>		
								</c:when>
								
								<c:when test="${topico.categoriaProgramacao}">
									<c:set var="cor" value="#00c86f"/>		
								</c:when>
								
								<c:when test="${topico.categoriaFrontend}">
									<c:set var="cor" value="#009bdd"/>		
								</c:when>
								
								<c:when test="${topico.categoriaInfra}">
									<c:set var="cor" value="#f1634b"/>		
								</c:when>
								
								<c:when test="${topico.categoriaDesign}">
									<c:set var="cor" value="#9d60b8"/>		
								</c:when>
								
								<c:when test="${topico.categoriaBusiness}">
									<c:set var="cor" value="#0079ac"/>		
								</c:when>
								
								<c:when test="${topico.categoriaOfftopic}">
									<c:set var="cor" value="#9eb3c1"/>		
								</c:when>
								
								<c:otherwise>
									<c:set var="cor" value="#697074"/>
								</c:otherwise>
							</c:choose>
							
							<style>
								@media ( min-width : 720px) {
									#topic-breadCrumb-item-category-${topico.id} {
										background: ${cor};
									}
									#topic-breadCrumb-item-subcategory-${topico.id} {
										background: ${cor};
										opacity: .8;
									}
									#topic-breadCrumb-item-course-${topico.id} {
										background: ${cor};
										opacity: .6;
									}
								}
								
								@media not all and (min-width: 720px) {
									#topic-breadCrumb-item-category-${topico.id} {
										color: ${cor};
									}
									#topic-breadCrumb-item-subcategory-${topico.id} {
										color: ${cor};
										opacity: .8;
									}
									#topic-breadCrumb-item-course-${topico.id} {
										color: ${cor};
										opacity: .6;
									}
								}
							</style>

							<nav class="topic-breadCrumb">
								<ol class="topic-breadCrumb-list">
									<li class="topic-breadCrumb-item">
										<a id="topic-breadCrumb-item-category-${topico.id}" href="#" class="topic-breadCrumb-item-link">${topico.nomeCategoria}</a>
									</li>
		
									<li class="topic-breadCrumb-item">
										<a id="topic-breadCrumb-item-subcategory-${topico.id}" href="#" class="topic-breadCrumb-item-link">${topico.nomeSubcategoria}</a>
									</li>
		
									<li class="topic-breadCrumb-item">
										<a id="topic-breadCrumb-item-course-${topico.id}" href="#" class="topic-breadCrumb-item-link">${topico.nomeCurso}</a>
									</li>
								</ol>
							</nav>
							
							<sec:authorize access="isAuthenticated()">
								<c:if test="${not topico.fechado and (usuario.id eq topico.idAutor or moderador)}">
									<div class="topic-container-details-moderator">
										<a id="close-link" href="#">Fechar tópico </a>
										
										<form id="form-close" style="display:none;" method="POST" action="<c:url value="/topicos/${topico.id}/fechar"/>">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										</form>
									</div>
								</c:if>
							</sec:authorize>
						</div>
				
						<div class="topic-header-container-details">
							<div class="topic-header-container-details-date">
								<time datetime="${topico.dataCriacao}">${topico.dataCriacaoPretty}</time>
							</div>
						</div>
					</div>
				</header>

				<section class="topic-post">
					<div class="container">		
						<section class="topic-post-header">
							<section class="topic-post-author">
								<a href="#" class="topic-post-author-photo">
									<img src="${images}/avatar.png" alt="Foto do <c:out value="${topico.nomeAutor}"/>" class="topic-post-author-photo-img">
								</a>

								<div class="topic-post-author-details">
									<a href="#" class="topic-post-author-name"><c:out value="${topico.nomeAutor}"/></a>
									<span class="topic-post-author-desc"></span>
								</div>
							</section>
						</section>

						<section class="topic-post-content" data-external-links="">
							<c:out value="${topico.descricao}"/>
						</section>
				
						<div class="topic-post-actions"></div>
					</div>
				</section>

				<section class="topic-answers">
					<div class="topic-answers-banner">
						<div class="container">
							${topico.quantidadeRespostas} <span>respostas</span>
						</div>
					</div>
					
					<c:forEach items="${topico.respostas}" var="resposta">
						<section class="topic-post">
							<div class="container">	
								<c:if test="${resposta.solucao}">
									<div class="topic-post-solved">
										<span class="topic-post-solved-text">solução</span>
									</div>	
								</c:if>
									
								<section class="topic-post-header">
									<section class="topic-post-author">
										<a href="#" class="topic-post-author-photo">
											<img src="${images}/avatar.png" alt="Foto do <c:out value="${resposta.nomeAutor}"/>" class="topic-post-author-photo-img">
										</a>
									
										<div class="topic-post-author-details">
											<a href="#" class="topic-post-author-name"><c:out value="${resposta.nomeAutor}"/></a>
											
											<c:if test="${resposta.moderador}">
												<span class="topic-post-author-moderator">Moderador</span>
											</c:if>
										</div>
									</section>
			
									<time datetime="${resposta.dataCriacao}">
										<span class="topic-post-date">${resposta.dataCriacaoPretty}</span>
									</time>
								</section>

								<section class="topic-post-content" data-external-links="">
									<c:out value="${resposta.descricao}"/>
								</section>

								<div class="topic-post-actions">
									<sec:authorize access="isAuthenticated()">
										<c:if test="${not topico.solucionado and not topico.fechado and (usuario.id eq topico.idAutor or moderador)}">
											<form class="topic-post-solveForm" action="<c:url value="/topicos/${topico.id}/solucionar" />" method="POST">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
												<input type="hidden" value="${resposta.id}" name="idResposta">
												
												<button type="submit" class="topic-button topic-post-solveButton">
													<span class="topic-post-solveButton-hideMobile">Marcar como</span> solução
												</button>
						                    </form>
										</c:if>
									</sec:authorize>
								</div>
							</div>
						</section>
					</c:forEach>
				</section>
				
				<c:if test="${topico.solucionado}">
					<div class="container">
						<div class="alert" data-category="alert" role="alert">
							<img alt="alerta" class="alert-icon" src="${images}/alert.svg">
							<p class="alert-message">Esta dúvida já foi marcada como solucionada, se a dúvida ainda persiste, por favor abra outra discussão.</p>
						</div>
					</div>
				</c:if>
				
				<c:if test="${topico.fechado}">
					<div class="container">
						<div class="alert" data-category="alert" role="alert">
							<img alt="alerta" class="alert-icon" src="${images}/alert.svg">
							<p class="alert-message">Esta dúvida está fechada, se a dúvida ainda persiste, por favor abra outra discussão.</p>
						</div>
					</div>
				</c:if>
				
				<c:if test="${usuario ne null and not topico.fechado}">
					<section class="topic-reply">
						<div class="container">
							<h2 class="topic-reply-title">O que você acha disso?</h2>
							<form action="<c:url value="/topicos/${topico.id}/responder" />" method="post" class="topic-reply-form">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="hidden" name="idTopico" value="${topico.id}">
	
								<div class="markdownEditor isToggled" id="markdownEditor-">
									<div class="markdownEditor-buttons">
										<button class="markdownEditor-button markdownEditor-button-code " data-insert-code="insira seu código aqui" type="button">Inserir código</button>
										
										<div class="markdownEditor-buttons-options">
											<button class="markdownEditor-button markdownEditor-button-preview isToggled" type="button" data-js-toggle="#markdownEditor-">Expandir</button>
											<button aria-controls="markdownEditor-help" aria-expanded="false" class="markdownEditor-button markdownEditor-button-format" type="button" data-js-toggle="#markdownEditor- .markdownEditor-help" aria-label="Abrir instruções de formatação do texto">Formatação</button>
										</div>
									</div>
	
									<div class="markdownEditor-area">
										<aside class="markdownEditor-help formattedText" aria-hidden="true" id="markdownEditor-help" tabindex="0">
											<h2>How to format code</h2>
											<ul>
												<li>É possível criar blocos de código adicionando três backticks (```) antes e depois do código</li>
												<li>Para escapar a formatação, utilize crases `dessa _forma_`</li>
												<li>Serão exibidas apenas tags HTML e XML que estiverem entre `<crases>`</crases></li>
											</ul>
	
											<h2>Formatação básica</h2>
											<ul>
												<li>**<strong>negrito</strong>**</li>
												<li>*<em>itálico</em>*</li>
												<li>~~<del>riscado (Strikethrough)</del>~~ </li>
											</ul>
	
											<h2>Como formatar links</h2>
											<ul>
												<li>&lt;http://google.com&gt;</li>
												<li>[Google](http://google.com)</li>
											</ul>
										</aside>
	
										<textarea aria-live="polite" aria-atomic="true" class="markdownEditor-source markdownEditor-textArea " name="descricao" maxlength="5000" id="markdownEditor--ta"></textarea>
										<output class="markdownEditor-preview formattedText markdownEditor-textArea " for="markdownEditor--ta"></output>
									</div>
								</div>
								
								<input class="topic-reply-form-submit" type="submit" value="Responder">
							</form>
						</div>
					</section>
				</c:if>
			</div>
		</div>
	</jsp:body>
</custom:template>