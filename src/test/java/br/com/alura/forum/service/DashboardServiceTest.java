package br.com.alura.forum.service;

import br.com.alura.forum.dao.CategoriaDao;
import br.com.alura.forum.dao.TopicoDao;
import br.com.alura.forum.model.Categoria;
import br.com.alura.forum.model.vo.DashboardItem;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import java.util.Arrays;
import java.util.List;


@RunWith(MockitoJUnitRunner.class)
public class DashboardServiceTest {

    @InjectMocks
    private DashboardService dashboardService;

    @Mock
    private CategoriaDao categoriaDao;

    @Mock
    private TopicoDao topicoDao;

    private List<Categoria> categorias;

    @Before
    public void before() {
        Categoria backend = new Categoria("Backend", null);
        Categoria frontend = new Categoria("frontend", null);
        Categoria mobile = new Categoria("mobile", null);
        this.categorias = Arrays.asList(backend, frontend, mobile);
    }

    @Test
    public void contadoresDevemEstarZeradosQuandoNaoTemTopicosAbertos() {
        Mockito.when(categoriaDao.buscarTodasAsCategoriasPrincipais()).thenReturn(categorias);

        categorias.forEach( categoria -> {
            Mockito.when(topicoDao.countPorCategoria(categoria)).thenReturn(0L);
            Mockito.when(topicoDao.countPorCategoriaEAbertosNaUltimaSemana(categoria)).thenReturn(0L);
            Mockito.when(topicoDao.countPorCategoriaENaoRespondidos(categoria)).thenReturn(0L);
        });

        List<DashboardItem> dashboard = dashboardService.buscarDadosDoDashboardDeTopicos();

        Assert.assertEquals(3, dashboard.size());

        dashboard.forEach( dash -> {
            Assert.assertEquals(0L, dash.getQtdTopicos().longValue());
            Assert.assertEquals(0L, dash.getQtdTopicosDaUltimaSemana().longValue());
            Assert.assertEquals(0L, dash.getQtdTopicosNaoRespondidos().longValue());
        });
    }
}