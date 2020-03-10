package br.com.alura.forum.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.alura.forum.model.Resposta;

@Repository
public class RespostaDao {

	@PersistenceContext
	private EntityManager em;
	
	public void salvar(Resposta resposta) {
		em.persist(resposta);
	}

	public Resposta buscarPorId(Long id) {
		return em.find(Resposta.class, id);
	}
	
}
