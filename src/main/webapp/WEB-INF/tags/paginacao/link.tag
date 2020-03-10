<%@ tag pageEncoding="UTF-8" %>

<%@ attribute name="number" %>
<%@ attribute name="currentPage" %>
<%@ attribute name="hasSuspensionPoints" %>

<a href="${number}" class="paginacao paginationLink ${currentPage eq number? 'busca-botao-selecionado': ''} ${hasSuspensionPoints? ' paginationLink--withSuspensionPoints':''}">${number}</a>
