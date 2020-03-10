package br.com.alura.forum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.alura.forum.dao.PerfilDao;
import br.com.alura.forum.dao.UsuarioDao;
import br.com.alura.forum.model.Usuario;

@Service
public class CadastroUsuarioService {

	@Autowired
	private UsuarioDao usuarioDao;
	
	@Autowired
	private PerfilDao perfilDao;
	
	@Autowired
	private Md5Service md5;
	
	@Transactional
	public void cadastrarNovoUsuario(Usuario novo) {
		boolean existente = usuarioDao.buscarPorEmail(novo.getEmail()) != null;
		if (existente) {
			throw new IllegalArgumentException("Já existe outro usuário cadastrado com o email informado!");
		}
		
		novo.addPerfil(perfilDao.buscarPorNome("ROLE_ALUNO"));
		novo.setSenha(md5.encode(novo.getSenha()));
		usuarioDao.salvar(novo);
	}

}
