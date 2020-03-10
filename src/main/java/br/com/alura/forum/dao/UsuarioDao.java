package br.com.alura.forum.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.alura.forum.model.Usuario;

@Repository
public class UsuarioDao {

	@PersistenceContext
	private EntityManager em;

	public Usuario buscarPorEmailESenha(String email, String senha) {
		try {
			String jpql = "SELECT u FROM Usuario u WHERE u.email = :email AND u.senha = :senha";
			return em
					.createQuery(jpql, Usuario.class)
					.setParameter("email", email)
					.setParameter("senha", senha)
					.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public Usuario buscarPorEmail(String email) {
		try {
			String jpql = "SELECT u FROM Usuario u WHERE u.email = :email";
			return em
					.createQuery(jpql, Usuario.class)
					.setParameter("email", email)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public void atualizarDados(Usuario editado) {
		em.merge(editado);
	}

	public void salvar(Usuario usuario) {
		em.persist(usuario);
	}

	public Usuario buscarPorId(Long id) {
		return em.find(Usuario.class, id);
	}

}
