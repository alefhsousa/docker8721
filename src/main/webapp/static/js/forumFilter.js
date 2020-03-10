$('.categoryFilter').on('change', function() {
	var categoria = $('.categoryFilter :selected').val();
	$("input[name=categoria]").val(categoria != 'todos' ? categoria : '');
	limparPaginacao();
	submitForm();
});

$('.categoryFilter .cs-options ul li').on('click', function() {
	var categoria = $(this).data('value');
	$("input[name=categoria]").val(categoria != 'todos' ? categoria : '');
	limparPaginacao();
	submitForm();
});

$('.categoryFilter [data-value*=todos]').on('click', function() {
	$("input[name=categoria]").val("");
	limparPaginacao();
	submitForm();
});

$('input[name="restriction"]').on('change', function() {
	$("input[name=status]").val($(this).val());
	limparPaginacao();
	submitForm();
});

$('a.paginacao').on('click', function(e) {
	e.preventDefault();
	var pagina = $(this).attr('href');
	$("input[name=currentPage]").val(pagina);
	submitForm();
});

function submitForm() {
	var form = $('.forumFilter-form');
	form.find("input[value='']").attr("disabled", "disabled");
	
	form.submit();
}

function limparPaginacao() {
	$("input[name=currentPage]").val("");
}
