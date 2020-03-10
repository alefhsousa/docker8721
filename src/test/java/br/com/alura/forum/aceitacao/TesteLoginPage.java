package br.com.alura.forum.aceitacao;


import com.github.javafaker.Faker;
import org.junit.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.io.IOException;
import java.util.Objects;

public class TesteLoginPage {


    ChromeDriver browser;

    @Before
    public void antes() {
        browser = new ChromeDriver();
    }

    @After
    public void depois() {
        if (browser != null) {
            browser.close();
        }
    }

    @Ignore
    @Test
    public void deve_ser_capaz_de_criar_uma_conta() throws IOException, InterruptedException {
        Faker faker = new Faker();

        browser.get("http://localhost:8090/alura-forum/");

        TopicosPage paginaDeTopicos = new TopicosPage(browser);
        CadastroPage paginaDeCadastro = paginaDeTopicos.clicarNoLinkDeCadastro();

        String nome = faker.funnyName().name();
        String email = faker.internet().emailAddress();
        String senha = faker.internet().password();

        paginaDeCadastro.preencheFormulario(nome, email, senha);
        PaginaLogadaPage paginaLogadaPage = paginaDeCadastro.submeteCadastro();

        Assert.assertTrue(paginaLogadaPage.contem(nome));
    }

}

