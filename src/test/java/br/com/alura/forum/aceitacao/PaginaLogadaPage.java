package br.com.alura.forum.aceitacao;

import org.openqa.selenium.chrome.ChromeDriver;

public class PaginaLogadaPage {

    private ChromeDriver browser;

    public PaginaLogadaPage(ChromeDriver browser) {
        this.browser = browser;
    }

    public boolean contem(String nome) {
        return browser.getPageSource().contains(nome);
    }

}