package org.xkj.util;

public class PageUtil {
	public static Page createPage(int everyPage, int totalCount, int currentPage) {
		Page page = new Page();
		page.setEveryPage(everyPage);
		int totalPage = getTotalPage(everyPage, totalCount);
		page.setTotalPage(totalPage);
		page.setCurrentPage(currentPage);
		page.setTotalCount(totalCount);
		page.setBeginIndex(getBeginIndex(currentPage, everyPage));
		page.setPrePage(getPrePage(currentPage));
		page.setNextPage(getNextPage(currentPage, totalPage));
		return page;
	}
	private static boolean getNextPage(int currentPage, int totalPage) {
		if(totalPage == 0) return false;
		return currentPage == totalPage? false:true;
	}
	private static boolean getPrePage(int currentPage) {
		return currentPage == 1? false:true;
	}
	private static int getBeginIndex(int currentPage, int everyPage) {
		return (currentPage - 1) * everyPage;
	}
	private static int getTotalPage(int everyPage, int totalCount) {
		int totalPage = 0;
		if(totalCount % everyPage != 0) {
			totalPage = totalCount / everyPage + 1;
		} else {
			totalPage = totalCount / everyPage;
		}
		return totalPage;
	}
}
