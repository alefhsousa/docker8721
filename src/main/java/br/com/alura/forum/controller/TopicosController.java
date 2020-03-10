package br.com.alura.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.alura.forum.controller.vo.DashBoardVo;
import br.com.alura.forum.controller.vo.FiltrosPesquisaTopicos;
import br.com.alura.forum.controller.vo.ListaDeTopicosVo;
import br.com.alura.forum.controller.vo.TopicoVo;
import br.com.alura.forum.dao.CursoDao;
import br.com.alura.forum.dao.RespostaDao;
import br.com.alura.forum.dao.TopicoDao;
import br.com.alura.forum.model.Resposta;
import br.com.alura.forum.model.Topico;
import br.com.alura.forum.model.Usuario;
import br.com.alura.forum.model.vo.DashboardItem;
import br.com.alura.forum.service.DashboardService;

@Controller
@RequestMapping("/topicos")
public class TopicosController {
	
	private static final int PAGE_SIZE = 10;

	@Autowired
	private TopicoDao topicoDao;
	
	@Autowired
	private CursoDao cursoDao;
	
	@Autowired
	private RespostaDao respostaDao;
	
	@Autowired
	private DashboardService dashboardService;

	@GetMapping
	public String listarTopicos(FiltrosPesquisaTopicos filtros, Model model) {
		carregarDashboard(model);
		carregarTopicos(filtros, model);
		return "lista-topicos";
	}
	
	@GetMapping("/novo")
	public String carregarFormularioNovoTopico(Model model) {
		model.addAttribute("cursos", cursoDao.carregarTodosOsCursos());
		return "form-topico";
	}
	
	@PostMapping
	@Transactional
	public String cadastrarNovoTopico(Topico topico, @AuthenticationPrincipal Usuario logado) {
		topico.setAutor(logado);
		topicoDao.salvar(topico);
		
		return "redirect:/topicos";
	}
	
	@GetMapping("/{id}")
	public String detalharTopico(@PathVariable Long id, Model model) {
		Topico selecionado = topicoDao.buscarPorId(id);
		model.addAttribute("topico", new TopicoVo(selecionado));
		return "detalhes-topico";
	}
	
	@PostMapping("/{id}/responder")
	@Transactional
	public String responderTopico(Long idTopico, String descricao, @AuthenticationPrincipal Usuario logado) {
		Topico respondido = topicoDao.buscarPorId(idTopico);
		Resposta nova = new Resposta(descricao, respondido, logado);
		respostaDao.salvar(nova);
		return "redirect:/topicos/" +idTopico;
	}
	
	@PostMapping("/{id}/solucionar")
	@Transactional
	public String marcarTopicoComoSolucionado(@PathVariable Long id, Long idResposta, @AuthenticationPrincipal Usuario logado) {
		Topico solucionado = topicoDao.buscarPorId(id);
		
		if (logado.equals(solucionado.getAutor()) || logado.isModerador()) {
			solucionado.marcarComoSolucionado();
			
			Resposta solucao = respostaDao.buscarPorId(idResposta);
			solucao.marcarComoSolucao();
		}
		
		return "redirect:/topicos/" +id;
	}
	
	@PostMapping("/{id}/fechar")
	@Transactional
	public String fecharTopico(@PathVariable Long id, @AuthenticationPrincipal Usuario logado) {
		Topico fechado = topicoDao.buscarPorId(id);
		
		if (logado.equals(fechado.getAutor()) || logado.isModerador()) {
			fechado.fechar();
		}
		
		return "redirect:/topicos/" +id;
	}

	private void carregarDashboard(Model model) {
		List<DashboardItem> itensDashboard = dashboardService.buscarDadosDoDashboardDeTopicos();
		model.addAttribute("dashboardVo", new DashBoardVo(itensDashboard));
	}

	private void carregarTopicos(FiltrosPesquisaTopicos filtros, Model model) {
		List<Topico> todos = topicoDao.buscarPorFiltros(filtros);
		Long count = topicoDao.countPorFiltros(filtros);
		
		Long totalPages = count == 0 ? 0 : count / PAGE_SIZE;
		if(totalPages % PAGE_SIZE != 0) {
			totalPages++;
		}
		
		model.addAttribute("listaDeTopicosVo", new ListaDeTopicosVo(todos, totalPages, filtros.getCurrentPage()));
	}
	
}
