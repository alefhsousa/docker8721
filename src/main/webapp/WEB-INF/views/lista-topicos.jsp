<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="paginacao" tagdir="/WEB-INF/tags/paginacao"%>

<c:url var="images" value="/static/images" />

<custom:template>
	<jsp:body>
		<section class="allTopics">
			<section class="banner">
				<div class="container">
					<h1 class="banner-title">
						<a href="#" class="banner-title-link">Fórum </a>
					</h1>
				</div>
			</section>
		
			<c:import url="/WEB-INF/views/dashboard.jsp"/>
		
			<section class="forumFilter">
				<form class="forumFilter-form" action="<c:url value="/topicos" />">
					<input type="hidden" name="categoria" value="${param.categoria}">
					<input type="hidden" name="status" value="${param.status}">
					<input type="hidden" name="currentPage" value="${param.currentPage}">
				</form>
		
				<div class="container">
					<div class="title-and-new-topic">
						<span class="title">Tópicos mais recentes</span>
						
						<sec:authorize access="isAuthenticated()">
							<a href="<c:url value="/topicos/novo" />" class="button-new-topic">Criar novo tópico</a>
						</sec:authorize>
					</div>
		
					<div class="categories-restrictions-and-search">
						<fieldset class="select-filter">
							<div class="categoryFilter cs-select" tabindex="0">
								<select class="categoryFilter cs-select" name="category.id">
									<option value="todos" data-color="#697074" data-link="#">Todas as categorias</option>
									<option data-color="#fdc14a" value="mobile" ${param.categoria eq 'mobile' ? 'selected="selected"' : ''}>Mobile</option>
									<option data-color="#00c86f" value="programacao" ${param.categoria eq 'programacao' ? 'selected="selected"' : ''}>Programação</option>
									<option data-color="#009bdd" value="front-end" ${param.categoria eq 'front-end' ? 'selected="selected"' : ''}>Front-end</option>
									<option data-color="#f1634b" value="infraestrutura" ${param.categoria eq 'infraestrutura' ? 'selected="selected"' : ''}>Infraestrutura</option>
									<option data-color="#9d60b8" value="design" ${param.categoria eq 'design' ? 'selected="selected"' : ''}>Design &amp; UX</option>
									<option data-color="#0079ac" value="business" ${param.categoria eq 'business' ? 'selected="selected"' : ''}>Business</option>
									<option data-color="#9eb3c1" value="offtopic" ${param.categoria eq 'offtopic' ? 'selected="selected"' : ''}>Off Topic</option>
								</select>
							</div>
						</fieldset>
		
						<fieldset class="restrictions">
							<input type="radio" class="restrictionsInput--all" name="restriction" value="" id="todos" ${empty param.status ? 'checked="checked"' : ''}>
							<label class="restrictionsLabel restrictionsLabel--all" for="todos">
								Todos
							</label>
		
							<input class="restrictionsInput--all" type="radio" name="restriction" value="NAO_RESPONDIDO" id="sem-resposta" ${param.status eq 'NAO_RESPONDIDO' ? 'checked="checked"' : ''}>
							<label class="restrictionsLabel restrictionsLabel--all" for="sem-resposta">
								Sem resposta
							</label>
		
							<input class="restrictionsInput--all" type="radio" name="restriction" value="NAO_SOLUCIONADO" id="sem-solucao" ${param.status eq 'NAO_SOLUCIONADO' ? 'checked="checked"' : ''}>
							<label class="restrictionsLabel restrictionsLabel--all" for="sem-solucao">
								Sem solução
							</label>
						</fieldset>
					</div>
				</div>
			</section>
		
			<section class="forumList container">
				<ul class="forumList-topics">
					<c:forEach items="${listaDeTopicosVo.topicos}" var="topico">
						<li class="forumList-item">
							<div class="forumList-item-subject">
								<div class="forumList-item-icon">
									<c:if test="${topico.solucionado}">
										<img height="30px" width="30px" class='forumList-icon-solved' src='${images}/icon-solved.svg'>
									</c:if>
								
									<c:if test="${not topico.solucionado}">
										<img height="30px" width="30px" class="forumList-icon-notsolved" src="${images}/icon-not-solved.svg">
									</c:if>
								</div>
												
								<div class="forumList-item-subject-info">
									<h2 class="forumList-item-subject-info-title">
										<a class="forumList-item-subject-info-title-link" href="<c:url value="/topicos/${topico.id}" />"><c:out value="${topico.titulo}"/></a>
									</h2>
			
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
										@media (min-width: 720px) {
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
								</div>
							</div>
			
							<div class="forumList-item-wrapper">
								<div class="forumList-item-infoGroup">
									<a href="#" class="forumList-item-info">
										<img class="forumList-item-info-avatar" src="${images}/avatar.png">
										<div class="forumList-item-info-description">
											<p class="forumList-item-info-name">por <strong><c:out value="${topico.nomeAutor}"/></strong>
											</p>
											<time datetime="${topico.dataUltimaAtualizacao}">
												<p class="forumList-item-info-updatedAt">${topico.dataUltimaAtualizacaoPretty}</p>
											</time>
										</div>
									</a>
								</div>
			
								<div class="forumList-item-answers">
									<span class="forumList-item-answers-number">${topico.quantidadeRespostas}</span>
									<span class="forumList-item-answers-description">
										respostas
									</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</section>
		
			<paginacao:paginacao currentPage="${listaDeTopicosVo.currentPage}" totalPages="${listaDeTopicosVo.totalPages}" />
		</section>
	</jsp:body>
</custom:template>