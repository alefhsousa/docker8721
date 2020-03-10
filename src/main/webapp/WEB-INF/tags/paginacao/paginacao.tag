<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="paginacao" tagdir="/WEB-INF/tags/paginacao" %>

<%@ attribute name="totalPages" required="true" type="java.lang.Long" %>
<%@ attribute name="currentPage" required="true" type="java.lang.Long"%>

<c:if test="${totalPages >1}">
	<div class="container">
		<nav class="busca-paginacao">
			<c:choose>
				<c:when test="${currentPage > 1}">
					<a href="${currentPage-1}" class="busca-paginacao-prevNext busca-paginacao-linksAnteriores paginacao" rel="prev">Anterior</a>
				</c:when>

				<c:otherwise>
					<span class="busca-paginacao-prevNext busca-paginacao-linksAnteriores busca-paginacao-prevNext--disabled">Anterior</span>
				</c:otherwise>
			</c:choose>

			<nav class="busca-paginacao-links">
				<c:choose>
					<c:when test="${totalPages <= 5}">
						<c:forEach begin="1" end="${totalPages}" var="page">
							<paginacao:link number="${page}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
						</c:forEach>
					</c:when>

					<c:otherwise>
						<c:choose>
							<c:when test="${currentPage le 3}">
								<paginacao:link number="${1}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${2}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${3}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${4}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${totalPages}" currentPage="${currentPage}" hasSuspensionPoints="${true}" />
							</c:when>

							<c:when test="${currentPage gt (totalPages - 3)}">
								<paginacao:link number="${1}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${totalPages-3}" currentPage="${currentPage}" hasSuspensionPoints="${true}" />
								<paginacao:link number="${totalPages-2}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${totalPages-1}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${totalPages}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
							</c:when>

							<c:otherwise>
								<paginacao:link number="${1}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${currentPage-1}" currentPage="${currentPage}" hasSuspensionPoints="${true}" />
								<paginacao:link number="${currentPage}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${currentPage+1}" currentPage="${currentPage}" hasSuspensionPoints="${false}" />
								<paginacao:link number="${totalPages}" currentPage="${currentPage}" hasSuspensionPoints="${true}" />
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</nav>

			<c:choose>
				<c:when test="${currentPage  < totalPages}">
					<a href="${currentPage+1}" class="busca-paginacao-prevNext busca-paginacao-linksProximos paginacao" rel="next">Próximo</a>
				</c:when>

				<c:otherwise>
					<span class="busca-paginacao-prevNext busca-paginacao-linksProximos busca-paginacao-prevNext--disabled paginacao">Próximo</span>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>
</c:if>
