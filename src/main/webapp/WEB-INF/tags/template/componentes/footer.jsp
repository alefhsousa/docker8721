<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="home" value="/" />
<c:url var="images" value="/static/images" />

<footer class="footer container">
	<a href="${home}" class="footer-logo">
		<img src="${images}/logo-alura.svg" alt="alura">
	</a>

	<ul class="footer-menu">
		<li class="footer-menu-item">
			<a class="footer-menu-item-link" href="https://www.alura.com.br/sobre" target="">Sobre a Alura</a>
		</li>

		<li class="footer-menu-item">
			<a class="footer-menu-item-link" href="http://suporte.alura.com.br/" target="_blank">Dúvidas frequentes</a>
		</li>

		<li class="footer-menu-item">
			<a class="footer-menu-item-link" href="https://docs.google.com/forms/d/e/1FAIpQLScwKyaSvuFXK9SmMJoLPuYAS2qD_XAAnZPxMZij9qVeflbhBg/viewform" target="_blank">Sugira um curso</a>
		</li>

		<li class="footer-menu-item">
			<a class="footer-menu-item-link" href="https://trello.com/b/kredhcFj/alura-alunos-funcionalidades" target="_blank">Sugira uma funcionalidade</a>
		</li>

		<li class="footer-menu-item">
			<a class="footer-menu-item-link" href="http://blog.alura.com.br/" target="_blank">Blog da Alura</a>
		</li>
	</ul>

	<section role="presentation" class="footer-footerGroup">
		<div class="footer-links">
			<h2 class="footer-links-title">Acompanhe-nos</h2>
			<ul role="presentation" class="footer-socialMedia">
				<li class="footer-socialMedia-item">
					<a class="footer-socialMedia-item-link" href="https://www.youtube.com/user/aluracursosonline" target="_blank" title="Youtube da Alura">
						<svg class="footer-socialMedia-item-icon footer-socialMedia-list-item-youtube">
							<use xlink:href="${images}/icons-redes-hipster.svg#icon-footer-youtube"></use>
						</svg>
					</a>
				</li>

				<li class="footer-socialMedia-item">
					<a class="footer-socialMedia-item-link" href="https://www.facebook.com/AluraCursosOnline/" target="_blank" title="Facebook da Alura">
						<svg class="footer-socialMedia-item-icon footer-socialMedia-list-item-facebook">
							<use xlink:href="${images}/icons-redes-hipster.svg#icon-footer-facebook"></use>
						</svg>
					</a>
				</li>

				<li class="footer-socialMedia-item">
					<a class="footer-socialMedia-item-link" href="https://twitter.com/aluraonline" target="_blank" title="Twitter da Alura">
						<svg class="footer-socialMedia-item-icon footer-socialMedia-list-item-twitter">
							<use xlink:href="${images}/icons-redes-hipster.svg#icon-footer-twitter"></use>
						</svg>
					</a>
				</li>

				<li class="footer-socialMedia-item">
					<a class="footer-socialMedia-item-link" href="http://hipsters.tech/" target="_blank" title="Podcast Hipsters Ponto Tech">
						<svg class="footer-socialMedia-item-icon footer-socialMedia-list-item-hipsters">
							<use xlink:href="${images}/icons-redes-hipster.svg#icon-footer-hipsters"></use>
						</svg>
					</a>
				</li>
			</ul>
		</div>

		<div class="footer-links">
			<h2 class="footer-links-title">Apps</h2>
			<ul class="footer-hotLinks-menu footer-hotLinks-mobile">
				<li class="footer-hotLinks-item">
					<a class="footer-hotLinks-item-link" href="https://play.google.com/store/apps/details?id=br.com.alura.mobi&amp;hl=pt_BR" target="_blank" title="Google Play Store">
						<svg class="footer-hotLinks-item-icon footer-hotLinks-menu-item-mobile">
							<use xlink:href="${images}/icons-mobile.svg#icon-footer-googlePlay"></use>
						</svg>
					</a>
				</li>

				<li class="footer-hotLinks-item">
					<a class="footer-hotLinks-item-link" href="https://itunes.apple.com/br/app/alura-cursos-online/id1225776635" target="_blank" title="Apple App Store">
						<svg class="footer-hotLinks-item-icon footer-hotLinks-menu-item-mobile">
							<use xlink:href="${images}/icons-mobile.svg#icon-footer-appStore"></use>
						</svg>
					</a>
				</li>
			</ul>
		</div>
	</section>
</footer>
