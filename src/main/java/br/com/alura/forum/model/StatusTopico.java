package br.com.alura.forum.model;

import br.com.alura.forum.model.Resposta;

public enum StatusTopico implements EstadoTopico {

	NAO_RESPONDIDO {

		@Override
		public void registrarNovaResposta(Topico topico, Resposta resposta) {
			if (!topico.getAutor().equals(resposta.getAutor())) {
				topico.setStatus(NAO_SOLUCIONADO);
			}

			topico.addResposta(resposta);
		}

		@Override
		public void marcarComoSolucionado(Topico topico) {
			topico.setStatus(SOLUCIONADO);
		}

		@Override
		public void fechar(Topico topico) {
			topico.setStatus(FECHADO);
		}
	},

	NAO_SOLUCIONADO {

		@Override
		public void registrarNovaResposta(Topico topico, Resposta resposta) {
			topico.addResposta(resposta);
		}

		@Override
		public void marcarComoSolucionado(Topico topico) {
			topico.setStatus(SOLUCIONADO);
		}

		@Override
		public void fechar(Topico topico) {
			topico.setStatus(FECHADO);
		}
	},

	SOLUCIONADO {

		@Override
		public void registrarNovaResposta(Topico topico, Resposta resposta) {
			topico.addResposta(resposta);
		}

		@Override
		public void marcarComoSolucionado(Topico topico) {
			throw new RuntimeException("Essa dúvida já foi solucionada!");
		}

		@Override
		public void fechar(Topico topico) {
			throw new RuntimeException("A dúvida já foi solucionada e deve ser mantida aberta para fins de registro!");
		}
	},

	FECHADO {

		@Override
		public void registrarNovaResposta(Topico topico, Resposta resposta) {
			throw new RuntimeException("Tópico fechado! Não é possível adicionar novas respostas");
		}

		@Override
		public void marcarComoSolucionado(Topico topico) {
			throw new RuntimeException("Essa dúvida já está fechada!");
		}

		@Override
		public void fechar(Topico topico) {
			throw new RuntimeException("A dúvida já está fechada!");
		}
	};

}
