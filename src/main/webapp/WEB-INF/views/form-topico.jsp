<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags/template"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="usuario" />
	
	<c:if test="${usuario.moderador}">
		<c:set var="moderador" value="true"/>
	</c:if>
</sec:authorize>

<custom:template>
	<jsp:body>
		<div class="createTopic">
			<section class="banner">
				<div class="container">
					<h1 class="banner-title">
						<a href="#" class="banner-title-link">Fórum</a>
					</h1>
				</div>
			</section>
    
    		<div class="container">
			    <div class="createTopic-author">
        			<div class="container">
						<section class="topic-post-author">
							<a href="#" class="topic-post-author-photo">
                				<img src="<c:url value="/static/images/avatar.png" />" alt="" class="topic-post-author-photo-img">
                			</a>
						
						    <div class="topic-post-author-details">
						    	<a href="#" class="topic-post-author-name">
                            		<sec:authorize access="isAuthenticated()">
                            			${usuario.nome}
                            		</sec:authorize>
                            	</a>
            					
            					<c:if test="${moderador}">
	            					<span class="topic-post-author-moderator">Moderador</span>
            					</c:if>
            				</div>
						</section>

						<form class="createTopic-form" action="<c:url value="/topicos" />" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							
							<select name="curso.id">
								<c:forEach items="${cursos}" var="curso">
									<option value="${curso.id}">${curso.nome}</option>
								</c:forEach>
							</select>
							
							<input class="createTopic-form-title" type="text" name="titulo" placeholder="Descreva a sua dúvida em uma frase curta" required="required">

							<div class="markdownEditor isToggled" id="markdownEditor-">
								<div class="markdownEditor-buttons ">
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

									<textarea aria-live="polite" aria-atomic="true" class="markdownEditor-source markdownEditor-textArea " placeholder="Detalhes da dúvida" name="descricao" required="required" maxlength="5000" id="markdownEditor--ta"></textarea>
									<output class="markdownEditor-preview formattedText markdownEditor-textArea " for="markdownEditor--ta"></output>
								</div>
							</div>

                			<input type="submit" class="button buttonAction createTopic-form-button" value="Enviar pergunta">
            			</form>
        			</div>
    			</div>
			</div>
		</div>
	</jsp:body>
</custom:template>