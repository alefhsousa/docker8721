package br.com.alura.forum.controller.vo;

import java.util.List;

import br.com.alura.forum.model.vo.DashboardItem;

public class DashBoardVo {

	private List<DashboardItem> itensDashboard;

	public DashBoardVo(List<DashboardItem> itensDashboard) {
		this.itensDashboard = itensDashboard;
	}

	public List<DashboardItem> getItensDashboard() {
		return itensDashboard;
	}

}
