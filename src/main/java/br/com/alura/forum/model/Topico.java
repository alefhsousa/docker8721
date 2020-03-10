package br.com.alura.forum.model;

import org.springframework.util.Assert;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Entity
public class Topico {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String titulo;
	
	@Lob
	private String descricao;
	
	private LocalDateTime dataCriacao = LocalDateTime.now();
	private LocalDateTime dataUltimaAtualizacao = LocalDateTime.now();
	
	@Enumerated(EnumType.STRING)
	private StatusTopico status = StatusTopico.NAO_RESPONDIDO;

	@ManyToOne
	private Usuario autor;
	
	@ManyToOne
	private Curso curso;
	
	@OneToMany(mappedBy = "topico")
	private List<Resposta> respostas = new ArrayList<>();
	
	/**
	 * @deprecated
	 */
	protected Topico() {}
	
	public Topico(String titulo, String descricao, Usuario autor, Curso curso) {
		this.titulo = titulo;
		this.descricao = descricao;
		this.autor = autor;
		this.curso = curso;
	}
	
	public void addResposta(Resposta nova) {
		this.respostas.add(nova);
		atualizarDataDeUltimaAtualizacao();
	}

	public void registrarNovaResposta(Resposta nova) {
		Assert.notNull(nova, "Nova resposta não pode ser nula");

		this.status.registrarNovaResposta(this, nova);
	}
	
	public void marcarComoSolucionado() {
		this.status = StatusTopico.SOLUCIONADO;
		atualizarDataDeUltimaAtualizacao();
	}

	public void fechar() {
		this.status = StatusTopico.FECHADO;
		atualizarDataDeUltimaAtualizacao();
	}

	public boolean isSolucionado() {
		return StatusTopico.SOLUCIONADO == this.status;
	}

	public boolean isFechado() {
		return StatusTopico.FECHADO == this.status;
	}
	
	private void atualizarDataDeUltimaAtualizacao() {
		this.dataUltimaAtualizacao = LocalDateTime.now();
	}

	public Long getId() {
		return id;
	}

	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public LocalDateTime getDataCriacao() {
		return dataCriacao;
	}

	public LocalDateTime getDataUltimaAtualizacao() {
		return dataUltimaAtualizacao;
	}

	public Usuario getAutor() {
		return autor;
	}
	
	public void setAutor(Usuario autor) {
		this.autor = autor;
	}

	public String getNomeAutor() {
		return autor.getNome();
	}

	public Curso getCurso() {
		return curso;
	}
	
	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public String getEmailAutor() {
		return autor.getEmail();
	}

	public Integer getNumeroDeRespostas() {
		return this.respostas.size();
	}

	public StatusTopico getStatus() {
		return status;
	}

	public void setStatus(StatusTopico status) {
		this.status = status;
	}

	public List<Resposta> getRespostas() {
		return Collections.unmodifiableList(this.respostas);
	}

}
