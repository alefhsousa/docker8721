package br.com.alura.forum.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Categoria {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String nome;

	@ManyToOne
	private Categoria pai;

	@OneToMany(mappedBy = "pai")
	private List<Categoria> subcategorias = new ArrayList<>();

	/**
	 * @deprecated
	 */
	public Categoria() {
	}

	public Categoria(String nome) {
		this.nome = nome;
	}

	public Categoria(String nome, Categoria pai) {
		this(nome);
		this.pai = pai;
	}

	public Long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public Optional<Categoria> getPai() {
		return Optional.ofNullable(this.pai);
	}

	public List<String> getNomesDasSubcategorias() {
		return this.subcategorias.stream().map(Categoria::getNome).collect(Collectors.toList());
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Categoria other = (Categoria) obj;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}

}
