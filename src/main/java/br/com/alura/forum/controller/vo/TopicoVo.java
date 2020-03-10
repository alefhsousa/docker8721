package br.com.alura.forum.controller.vo;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import org.ocpsoft.prettytime.PrettyTime;

import br.com.alura.forum.model.Topico;

public class TopicoVo {

	private Long id;
	private String titulo;
	private String descricao;
	private LocalDateTime dataCriacao;
	private LocalDateTime dataUltimaAtualizacao;
	private String nomeAutor;
	private Long idAutor;
	private String nomeSubcategoria;
	private String nomeCategoria;
	private String nomeCurso;
	private int quantidadeRespostas;
	private boolean solucionado;
	private boolean fechado;
	private List<RespostaVo> respostas;

	public TopicoVo(Topico topico) {
		this.id = topico.getId();
		this.titulo = topico.getTitulo();
		this.descricao = topico.getDescricao();
		this.dataCriacao = topico.getDataCriacao();
		this.dataUltimaAtualizacao = topico.getDataUltimaAtualizacao();
		this.nomeAutor = topico.getAutor().getNome();
		this.idAutor = topico.getAutor().getId();
		this.nomeCurso = topico.getCurso().getNome();
		this.nomeSubcategoria = topico.getCurso().getNomeSubcategoria();
		this.nomeCategoria = topico.getCurso().getNomeCategoria();
		this.quantidadeRespostas = topico.getNumeroDeRespostas();
		this.solucionado = topico.isSolucionado();
		this.fechado = topico.isFechado();
		this.respostas = topico.getRespostas().stream().map(RespostaVo::new).collect(Collectors.toList());
	}
	
	public String getDataUltimaAtualizacaoPretty() {
		return getDataPretty(this.dataUltimaAtualizacao);
	}
	
	public String getDataCriacaoPretty() {
		return getDataPretty(this.dataCriacao);
	}
	
	private String getDataPretty(LocalDateTime dateTime) {
		Long millis = dateTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
		Date data = new Date(millis);
		return new PrettyTime(new Locale("pt", "BR")).format(data);
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

	public Long getId() {
		return id;
	}

	public String getTitulo() {
		return titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public LocalDateTime getDataUltimaAtualizacao() {
		return dataUltimaAtualizacao;
	}
	
	public LocalDateTime getDataCriacao() {
		return dataCriacao;
	}

	public String getNomeAutor() {
		return nomeAutor;
	}
	
	public Long getIdAutor() {
		return idAutor;
	}

	public String getNomeSubcategoria() {
		return nomeSubcategoria;
	}

	public String getNomeCategoria() {
		return nomeCategoria;
	}

	public String getNomeCurso() {
		return nomeCurso;
	}

	public int getQuantidadeRespostas() {
		return quantidadeRespostas;
	}

	public boolean isSolucionado() {
		return solucionado;
	}

	public boolean isFechado() {
		return fechado;
	}

	public List<RespostaVo> getRespostas() {
		return respostas;
	}

}
