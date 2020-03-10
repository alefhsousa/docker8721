package br.com.alura.forum.controller.vo;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Locale;

import org.ocpsoft.prettytime.PrettyTime;

import br.com.alura.forum.model.Resposta;

public class RespostaVo {

	private Long id;
	private String descricao;
	private LocalDateTime dataCriacao;
	private String nomeAutor;
	private boolean solucao;
	private boolean moderador;
	
	public RespostaVo(Resposta resposta) {
		this.id = resposta.getId();
		this.descricao = resposta.getDescricao();
		this.dataCriacao = resposta.getDataCriacao();
		this.nomeAutor = resposta.getAutor().getNome();
		this.solucao = resposta.isSolucao();
		this.moderador = resposta.getAutor().isModerador();
	}
	
	public String getDataCriacaoPretty() {
		Long millis = this.dataCriacao.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
		Date data = new Date(millis);
		return new PrettyTime(new Locale("pt", "BR")).format(data);
	}

	public Long getId() {
		return id;
	}

	public String getDescricao() {
		return descricao;
	}

	public LocalDateTime getDataCriacao() {
		return dataCriacao;
	}

	public String getNomeAutor() {
		return nomeAutor;
	}
	
	public boolean isSolucao() {
		return solucao;
	}

	public boolean isModerador() {
		return moderador;
	}

}
