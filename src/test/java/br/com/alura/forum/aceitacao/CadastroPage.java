package br.com.alura.forum.aceitacao;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class CadastroPage {

    private ChromeDriver browser;

    public CadastroPage(ChromeDriver browser) {
        this.browser = browser;
    }

    public void preencheFormulario(String nome, String email, String senha) {
        WebElement campoDeNome = browser.findElement(By.name("nome"));
        campoDeNome.sendKeys(nome);

        WebElement campoDeEmail = browser.findElement(By.name("email"));
        campoDeEmail.sendKeys(email);

        WebElement campoDeSenha = browser.findElement(By.name("senha"));
        campoDeSenha.sendKeys(senha);

        WebElement campoDeConfirmacaoDeSenha = browser.findElement(By.name("confirmacaoSenha"));
        campoDeConfirmacaoDeSenha.sendKeys(senha);
    }

    public PaginaLogadaPage submeteCadastro() {
        browser.findElement(By.className("btn-login")).click();
        return new PaginaLogadaPage(browser);
    }

}