package br.com.alura.forum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.com.alura.forum.dao.UsuarioDao;
import br.com.alura.forum.model.Usuario;

@Service
public class UsuarioService implements UserDetailsService {

	@Autowired
	private UsuarioDao usuarioDao;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Usuario encontrado = usuarioDao.buscarPorEmail(email);
		
		if (encontrado == null) {
			throw new UsernameNotFoundException("Dados invalidos!");
		}
		
		return encontrado;
	}
	
}
