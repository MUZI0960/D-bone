package kr.or.ddit.ui;

import kr.or.ddit.vo.Pagination;

public class DefaultPaginationRenderer implements PaginationRenderer {

	private final String PATTERN = "<li class='page-item'><a a class='page-link' href='#' onclick='fn_paging(%d, event);'>%s</a></li>";
	
	@Override
	public String renderPagination(Pagination pagination) {
		int startPage = pagination.getStartPage();
		int endPage = pagination.getEndPage();
		int totalPage = pagination.getTotalPage();
		int lastPage = endPage > totalPage ? totalPage : endPage;
		int blockSize = pagination.getBlockSize();
		StringBuffer html = new StringBuffer();
		if(startPage > blockSize) {
			html.append(
				String.format(PATTERN,  startPage - blockSize , "이전")
			);
		}
		for(int page = startPage; page <= lastPage; page++) {
			if(page == pagination.getCurrentPage()) {
				html.append(String.format("<li class='page-item active' aria-current='page'><span class='page-link'>%d</span></li>", page));
			}else {
				html.append(
					String.format(PATTERN, page, page)	
				);
				
			}
		}
		
		if(lastPage < totalPage) {
			html.append(
				String.format(PATTERN,  lastPage + 1 , "다음")
			);
		}
		
		return html.toString();
	}

}














