<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="images" value="/static/images" />

<main class="dashboard">
	<div class="container">
		<ul class="dashboard-categoryList">
			<c:forEach items="${dashboardVo.itensDashboard}" var="item">
				<c:choose>
					<c:when test="${item.categoriaMobile}">
						<c:set var="cor" value="#fdc14a"/>
						<c:set var="categoria" value="mobile"/>
					</c:when>
					
					<c:when test="${item.categoriaProgramacao}">
						<c:set var="cor" value="#00c86f"/>
						<c:set var="categoria" value="programacao"/>
					</c:when>
					
					<c:when test="${item.categoriaFrontend}">
						<c:set var="cor" value="#009bdd"/>
						<c:set var="categoria" value="front-end"/>
					</c:when>
					
					<c:when test="${item.categoriaInfra}">
						<c:set var="cor" value="#f1634b"/>
						<c:set var="categoria" value="infraestrutura"/>
					</c:when>
					
					<c:when test="${item.categoriaDesign}">
						<c:set var="cor" value="#9d60b8"/>
						<c:set var="categoria" value="design-ux"/>
					</c:when>
					
					<c:when test="${item.categoriaBusiness}">
						<c:set var="cor" value="#0079ac"/>
						<c:set var="categoria" value="business"/>
					</c:when>
					
					<c:when test="${item.categoriaOfftopic}">
						<c:set var="cor" value="#9eb3c1"/>
						<c:set var="categoria" value="offtopic"/>
					</c:when>
					
					<c:otherwise>
						<c:set var="cor" value="#697074"/>
					</c:otherwise>
				</c:choose>
				
				
				<li class="dashboard-categoryList-category" style="border-left-color: ${cor}">
					<img class="dashboard-categoryList-category-icon" src="${images}/${categoria}.svg" alt="Categoria ${item.nomeCategoria}" aria-hidden="true">
	
					<div class="dashboard-categoryList-category-name">
						<a class="dashboard-category-name-text" style="color: ${cor}" href="#">
							${item.nomeCategoria}
						</a>
					</div>
	
					<ul class="dashboard-categoryList-category-stats">
						<li class="categoryList-category-stats-item dashboard-category-stats-topics">
							<span class="category-stats-item-number dashboard-stats-topics-number">${item.qtdTopicos}</span>
							<a class="category-stats-item-text dashboard-stats-topics-text" href="#">tópicos</a>
						</li>
						<li class="categoryList-category-stats-item dashboard-category-stats-lastWeek">
							<span class="category-stats-item-number dashboard-stats-lastWeek-number">${item.qtdTopicosDaUltimaSemana}</span>
							<span class="category-stats-item-text dashboard-stats-lastWeek-text">na última semana</span>
						</li>
						<li class="categoryList-category-stats-item dashboard-category-stats-noReply">
							<span class="category-stats-item-number dashboard-stats-noReply-number">${item.qtdTopicosNaoRespondidos}</span>
							<a class="category-stats-item-text dashboard-stats-noReply-text" href="#">sem resposta</a>
						</li>
					</ul>
	
					<div class="dashboard-categoryList-category-subcategories">
						<ul class="dashboard-category-subcategories-list">
							<c:forEach items="${item.nomesDasSubcategorias}" var="subcategoria">
								<li class="dashboard-subcategories-list-subcategory">
									<a class="dashboard-list-subcategory-link" href="#">
										${subcategoria}
									</a>
								</li>
							</c:forEach>
						</ul>
	
						<button tabindex="0" class="dashboard-category-subcategories-dropdownButton">
							<span class="dashboard-subcategories-dropdownButton-text">ver subcategorias</span>
						</button>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</main>