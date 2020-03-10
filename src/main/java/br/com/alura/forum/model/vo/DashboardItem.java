package br.com.alura.forum.model.vo;

import java.util.List;

import br.com.alura.forum.model.Categoria;

public class DashboardItem {

	private String nomeCategoria;
	private Long qtdTopicos;
	private Long qtdTopicosDaUltimaSemana;
	private Long qtdTopicosNaoRespondidos;
	private List<String> nomesDasSubcategorias;

	public DashboardItem(Categoria categoria, Long qtdTopicos, Long qtdTopicosDaUltimaSemana, Long qtdTopicosNaoRespondidos) {
		this.nomeCategoria = categoria.getNome();
		this.qtdTopicos = qtdTopicos;
		this.qtdTopicosDaUltimaSemana = qtdTopicosDaUltimaSemana;
		this.qtdTopicosNaoRespondidos = qtdTopicosNaoRespondidos;
		this.nomesDasSubcategorias = categoria.getNomesDasSubcategorias();
	}
	
	public boolean isCategoriaMobile() {
		return nomeCategoria.toLowerCase().contains("mobile");
	}
	
	public boolean isCategoriaProgramacao() {
		return nomeCategoria.toLowerCase().contains("programa");
	}
	
	public boolean isCategoriaFrontend() {
		return nomeCategoria.toLowerCase().contains("front");
	}
	
	public boolean isCategoriaInfra() {
		return nomeCategoria.toLowerCase().contains("infra");
	}
	
	public boolean isCategoriaDesign() {
		return nomeCategoria.toLowerCase().contains("design");
	}
	
	public boolean isCategoriaBusiness() {
		return nomeCategoria.toLowerCase().contains("business");
	}

	public boolean isCategoriaOfftopic() {
		return nomeCategoria.toLowerCase().contains("off");
	}

	public String getNomeCategoria() {
		return nomeCategoria;
	}

	public Long getQtdTopicos() {
		return qtdTopicos;
	}

	public Long getQtdTopicosDaUltimaSemana() {
		return qtdTopicosDaUltimaSemana;
	}

	public Long getQtdTopicosNaoRespondidos() {
		return qtdTopicosNaoRespondidos;
	}

	public List<String> getNomesDasSubcategorias() {
		return nomesDasSubcategorias;
	}

}
