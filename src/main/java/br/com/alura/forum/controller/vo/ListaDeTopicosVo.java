package br.com.alura.forum.controller.vo;

import java.util.List;
import java.util.stream.Collectors;

import br.com.alura.forum.model.Topico;

public class ListaDeTopicosVo {

	private final List<TopicoVo> topicos;
	private Long totalPages;
	private Long currentPage;

	public ListaDeTopicosVo(List<Topico> topicos, Long totalPages, Long currentPage) {
		this.topicos = topicos.stream().map(TopicoVo::new).collect(Collectors.toList());
		this.totalPages = totalPages;
		this.currentPage = currentPage;
	}

	public List<TopicoVo> getTopicos() {
		return topicos;
	}

	public Long getCurrentPage() {
		return currentPage;
	}

	public Long getTotalPages() {
		return totalPages;
	}

}
