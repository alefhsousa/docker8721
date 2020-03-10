package br.com.alura.forum.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.alura.forum.model.Categoria;

@Repository
public class CategoriaDao {

	@PersistenceContext
	private EntityManager em;

	public List<Categoria> buscarTodasAsCategoriasPrincipais() {
		return em.createQuery("SELECT DISTINCT(c) FROM Categoria c LEFT JOIN FETCH c.subcategorias WHERE c.pai IS NULL", Categoria.class).getResultList();
	}

}
