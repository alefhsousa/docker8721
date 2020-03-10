(function() {
	[].slice.call(document.querySelectorAll('select.cs-select'))
		.forEach(function(el) {
			new SelectFx(el);
		}
	);
})();


$("#close-link").on("click", function(e) {
	e.preventDefault();
	if (confirm("Deseja realmente fechar o tópico?")) {
		$("#form-close").submit();
	}
});

$(".logout").on("click", function(e) {
	e.preventDefault();
	$("#form-logout").submit();
});
