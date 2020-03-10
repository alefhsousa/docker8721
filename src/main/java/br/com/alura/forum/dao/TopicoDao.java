package br.com.alura.forum.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.alura.forum.controller.vo.FiltrosPesquisaTopicos;
import br.com.alura.forum.model.Categoria;
import br.com.alura.forum.model.StatusTopico;
import br.com.alura.forum.model.Topico;

@Repository
public class TopicoDao {

	@PersistenceContext
	private EntityManager em;

	public List<Topico> buscarPorFiltros(FiltrosPesquisaTopicos filtros) {
		String jpql = "SELECT t FROM Topico t LEFT JOIN FETCH t.respostas WHERE 1=1 ";

		if (filtros.getCategoria() != null) {
			jpql += "AND t.curso.subcategoria.pai.nome = :categoria ";
		}

		if (filtros.getStatus() != null) {
			jpql += "AND t.status = :status ";
		}
		
		jpql += "ORDER BY t.dataCriacao DESC, t.titulo";

		TypedQuery<Topico> query = em
				.createQuery(jpql, Topico.class)
				.setFirstResult((filtros.getCurrentPage().intValue() - 1) * 10)
				.setMaxResults(10);

		if (filtros.getCategoria() != null) {
			query.setParameter("categoria", filtros.getCategoria());
		}

		if (filtros.getStatus() != null) {
			query.setParameter("status", filtros.getStatus());
		}

		return query.getResultList();
	}

	public Long countPorFiltros(FiltrosPesquisaTopicos filtros) {
		String jpql = "SELECT count(t) FROM Topico t WHERE 1=1 ";

		if (filtros.getCategoria() != null) {
			jpql += "AND t.curso.subcategoria.pai.nome = :categoria ";
		}

		if (filtros.getStatus() != null) {
			jpql += "AND t.status = :status";
		}

		TypedQuery<Long> query = em.createQuery(jpql, Long.class);

		if (filtros.getCategoria() != null) {
			query.setParameter("categoria", filtros.getCategoria());
		}

		if (filtros.getStatus() != null) {
			query.setParameter("status", filtros.getStatus());
		}

		return query.getSingleResult();
	}

	public Long countPorCategoria(Categoria categoria) {
		return em
				.createQuery("SELECT COUNT(t) FROM Topico t WHERE t.curso.subcategoria.pai = :categoria", Long.class)
				.setParameter("categoria", categoria)
				.getSingleResult();
	}

	public Long countPorCategoriaEAbertosNaUltimaSemana(Categoria categoria) {
		return em
				.createQuery("SELECT COUNT(t) FROM Topico t WHERE t.curso.subcategoria.pai = :categoria AND t.dataCriacao >= :semanaPassada", Long.class)
				.setParameter("categoria", categoria)
				.setParameter("semanaPassada", LocalDateTime.now().minusWeeks(1))
				.getSingleResult();
	}

	public Long countPorCategoriaENaoRespondidos(Categoria categoria) {
		return em
				.createQuery("SELECT COUNT(t) FROM Topico t WHERE t.curso.subcategoria.pai = :categoria AND t.status = :status", Long.class)
				.setParameter("categoria", categoria)
				.setParameter("status", StatusTopico.NAO_RESPONDIDO)
				.getSingleResult();
	}

	public void salvar(Topico topico) {
		em.persist(topico);
	}

	public Topico buscarPorId(Long id) {
		return em.createQuery("SELECT t FROM Topico t LEFT JOIN FETCH t.respostas WHERE t.id = :id", Topico.class)
				.setParameter("id", id)
				.getSingleResult();
	}

}
