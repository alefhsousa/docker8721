package br.com.alura.forum.model;

import java.util.Optional;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Curso {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String nome;

	@ManyToOne
	private Categoria subcategoria;

	/**
	 * @deprecated
	 */
	public Curso() {
	}

	public Curso(String nome, Categoria subcategoria) {
		this.nome = nome;
		this.subcategoria = subcategoria;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}

	public Categoria getSubcategoria() {
		return subcategoria;
	}

	public String getNomeSubcategoria() {
		return subcategoria.getNome();
	}

	public String getNomeCategoria() {
		Optional<Categoria> categoria = this.subcategoria.getPai();

		return categoria.orElseThrow(() -> new IllegalStateException("Esta já é uma categoria pai")).getNome();
	}

}
