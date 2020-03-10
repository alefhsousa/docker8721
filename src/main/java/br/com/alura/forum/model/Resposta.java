package br.com.alura.forum.model;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Resposta {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Lob
	private String descricao;

	private LocalDateTime dataCriacao = LocalDateTime.now();

	private boolean solucao = false;

	@ManyToOne
	private Topico topico;

	@ManyToOne
	private Usuario autor;

	/**
	 * @deprecated
	 */
	public Resposta() {
	}

	public Resposta(String descricao, Topico topico, Usuario autor) {
		this.descricao = descricao;
		this.topico = topico;
		this.autor = autor;

		topico.registrarNovaResposta(this);
	}
	
	public void marcarComoSolucao() {
		this.solucao = true;
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

	public boolean isSolucao() {
		return solucao;
	}

	public Topico getTopico() {
		return topico;
	}

	public String getNomeAutor() {
		return this.autor.getNome();
	}

	public Usuario getAutor() {
		return autor;
	}

}
