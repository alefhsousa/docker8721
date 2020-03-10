package br.com.alura.forum.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.alura.forum.model.Curso;

@Repository
public class CursoDao {

	@PersistenceContext
	private EntityManager em;
	
	public List<Curso> carregarTodosOsCursos() {
		return em.createQuery("SELECT c FROM Curso c ORDER BY c.nome", Curso.class).getResultList();
	}
	
}
