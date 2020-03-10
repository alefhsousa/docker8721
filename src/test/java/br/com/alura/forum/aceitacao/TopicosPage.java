package br.com.alura.forum.aceitacao;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class TopicosPage {

    private ChromeDriver browser;

    public TopicosPage(ChromeDriver browser) {
        this.browser = browser;
    }

    public CadastroPage clicarNoLinkDeCadastro() {
        WebElement linkDeCadastro = browser.findElement(By.linkText("CADASTRE-SE"));
        linkDeCadastro.click();
        return new CadastroPage(browser);
    }

}