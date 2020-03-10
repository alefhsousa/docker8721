package br.com.alura.forum.model;


import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;


public class TopicoTest {

    private Usuario joao;
    private Categoria frontend;
    private Categoria html;
    private Curso htmlBasico;

    @Before
    public void before() {
        this.joao = new Usuario("João", "joao@mail.com.br", "123456");
        this.frontend = new Categoria("Front-End");
        this.html = new Categoria("HTML", frontend);
        this.htmlBasico = new Curso("Html basico", html);
    }

    @Test
    public void aoFecharOTopicoSeuStatusDeveSerFechado() {
        Topico topicoHtml = new Topico("Duvida html", "Como isso funciona?", joao, htmlBasico);

        topicoHtml.fechar();

        Assert.assertEquals(StatusTopico.FECHADO, topicoHtml.getStatus());
    }
}
