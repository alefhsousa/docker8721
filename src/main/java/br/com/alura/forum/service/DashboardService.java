package br.com.alura.forum.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.alura.forum.dao.CategoriaDao;
import br.com.alura.forum.dao.TopicoDao;
import br.com.alura.forum.model.Categoria;
import br.com.alura.forum.model.vo.DashboardItem;

@Service
public class DashboardService {

	@Autowired
	private CategoriaDao categoriaDao;

	@Autowired
	private TopicoDao topicoDao;

	public List<DashboardItem> buscarDadosDoDashboardDeTopicos() {
		List<DashboardItem> dados = new ArrayList<>();

		List<Categoria> categorias = categoriaDao.buscarTodasAsCategoriasPrincipais();
		for (Categoria principal : categorias) {
			Long qtdTopicos = topicoDao.countPorCategoria(principal);
			Long qtdTopicosDaUltimaSemana = topicoDao.countPorCategoriaEAbertosNaUltimaSemana(principal);
			Long qtdTopicosNaoRespondidos = topicoDao.countPorCategoriaENaoRespondidos(principal);

			dados.add(new DashboardItem(principal, qtdTopicos, qtdTopicosDaUltimaSemana, qtdTopicosNaoRespondidos));
		}

		return dados;
	}

}
