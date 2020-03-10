package br.com.alura.forum.model;

import br.com.alura.forum.model.Resposta;

public interface EstadoTopico {

	void registrarNovaResposta(Topico topico, Resposta resposta);

	void marcarComoSolucionado(Topico topico);

	void fechar(Topico topico);

}
