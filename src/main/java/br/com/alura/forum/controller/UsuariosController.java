package br.com.alura.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.alura.forum.controller.form.CadastrarUsuarioForm;
import br.com.alura.forum.controller.form.EditarUsuarioForm;
import br.com.alura.forum.dao.UsuarioDao;
import br.com.alura.forum.model.Usuario;
import br.com.alura.forum.service.CadastroUsuarioService;
import br.com.alura.forum.service.Md5Service;

@Controller
@RequestMapping("/usuarios")
public class UsuariosController {
	
	@Autowired
	private UsuarioDao usuarioDao;
	
	@Autowired
	private CadastroUsuarioService cadastroUsuarioService;
	
	@Autowired
	private Md5Service md5;
	
	@GetMapping("/perfil")
	public String carregarPerfil(Model model) {
		return "perfil";
	}
	
	@PostMapping("/perfil")
	@Transactional
	public String alterarDadosDoPerfil(EditarUsuarioForm form, @AuthenticationPrincipal Usuario logado, RedirectAttributes redirectAttributes) {
		logado = usuarioDao.buscarPorId(logado.getId());
		logado.setNome(form.getNome());
		
		atualizarDadosDoUsuarioLogado(logado);
		redirectAttributes.addFlashAttribute("mensagemSucesso", "Dados atualizados com sucesso!");
		return "redirect:/usuarios/perfil";
	}
	
	@PostMapping("/perfil/senha")
	@Transactional
	public String alterarSenha(String senhaAtual, String novaSenha, String confirmacaoNovaSenha, @AuthenticationPrincipal Usuario logado, Model model, RedirectAttributes redirectAttributes) {
		String senhaAtualMd5 = md5.encode(senhaAtual);
		if (!senhaAtualMd5.equals(logado.getSenha())) {
			model.addAttribute("mensagemErro", "Senha atual não confere!");
			return carregarPerfil(model);
		}

		if (!novaSenha.equals(confirmacaoNovaSenha)) {
			model.addAttribute("mensagemErro", "Nova senha e confirmação não conferem!");
			return carregarPerfil(model);
		}
		
		logado.setSenha(md5.encode(novaSenha));
		usuarioDao.atualizarDados(logado);
		atualizarDadosDoUsuarioLogado(logado);
		redirectAttributes.addFlashAttribute("mensagemSucesso", "Dados atualizados com sucesso!");
		return "redirect:/usuarios/perfil";
	}
	
	@GetMapping("/cadastro")
	public String carregarFormularioCadastro() {
		return "form-cadastro";
	}
	
	@PostMapping("/cadastro")
	public String cadastrarNovoUsuario(CadastrarUsuarioForm form, String confirmacaoSenha, @AuthenticationPrincipal Usuario logado, Model model) {
		try {
			if (!form.getSenha().equals(confirmacaoSenha)) {
				throw new IllegalArgumentException("Senha e confirmação senha não batem!");
			}
			Usuario novo = new Usuario(form.getNome(), form.getEmail(), form.getSenha());
			cadastroUsuarioService.cadastrarNovoUsuario(novo);
			atualizarDadosDoUsuarioLogado(novo);
			return "redirect:/topicos";
		} catch (IllegalArgumentException e) {
			model.addAttribute("mensagemErro", e.getMessage());
			return "form-cadastro";
		}
	}
	
	private void atualizarDadosDoUsuarioLogado(Usuario usuario) {
		Authentication auth = new UsernamePasswordAuthenticationToken(usuario, null, usuario.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);
	}
	
}
