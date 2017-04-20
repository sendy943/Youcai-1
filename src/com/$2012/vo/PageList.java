package com.$2012.vo;

import org.springframework.stereotype.Component;

/*
 * ��ǰ��ҳҳ���б�
 */
@Component
public class PageList {
	/*��ʼҳ��*/
	private long startPage;
	/*����ҳ��*/
	private long endPage;
	
	public PageList() {}

	public PageList(long startPage, long endPage) {
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public long getStartPage() {
		return startPage;
	}

	public void setStartPage(long startPage) {
		this.startPage = startPage;
	}

	public long getEndPage() {
		return endPage;
	}

	public void setEndPage(long endPage) {
		this.endPage = endPage;
	}
	
	/*
	 * ���ſ����۹���ҳ���б���ʼ�ս���ǰҳ������ҳ���б��м�
	 * ����ǰҳ���б���Ϊż��ʱ���м�λ�þ���
	 */
	public static PageList getPageList(long pageListSize, int currentPage,
			long totalPages) {
		long startPage = currentPage
				- (pageListSize % 2 == 0 ? pageListSize / 2 - 1
						: pageListSize / 2);
		long endPage = currentPage + pageListSize / 2;
		if (startPage < 1) {
			startPage = 1;
			if (totalPages >= pageListSize)
				endPage = pageListSize;
			else
				endPage = totalPages;
		}
		if (endPage > totalPages) {
			endPage = totalPages;
			if ((endPage - pageListSize) > 0)
				startPage = endPage - pageListSize + 1;
			else
				startPage = 1;
		}
		return new PageList(startPage, endPage);
	}
}
