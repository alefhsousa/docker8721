package br.com.alura.forum.controller.vo;

import br.com.alura.forum.model.StatusTopico;

public class FiltrosPesquisaTopicos {

	private String categoria;
	private StatusTopico status;
	private Long currentPage;

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public StatusTopico getStatus() {
		return status;
	}

	public void setStatus(StatusTopico status) {
		this.status = status;
	}

	public Long getCurrentPage() {
		return currentPage != null ? currentPage : 1;
	}

	public void setCurrentPage(Long currentPage) {
		this.currentPage = currentPage;
	}

}
