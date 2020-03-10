package br.com.alura.forum.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.alura.forum.model.Perfil;

@Repository
public class PerfilDao {

	@PersistenceContext
	private EntityManager em;

	public Perfil buscarPorNome(String nome) {
		return em.find(Perfil.class, nome);
	}

}
