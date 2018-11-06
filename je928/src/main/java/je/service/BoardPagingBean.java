package je.service;

public class BoardPagingBean {

	final int rowPerPage = 10;
	final int pagePerBlock = 5;
	int nowPage, total, totalPage, totalBlk, startPage, endPage, no;

	public BoardPagingBean(int nowPage, int total) {

		this.nowPage = nowPage;
		this.total = total;

		totalPage = (int) Math.ceil((double)total/rowPerPage);
		totalBlk = (int) Math.ceil((double)totalPage/pagePerBlock);
		startPage = nowPage - (nowPage - 1) % pagePerBlock;
/*		int startPage = (nowPage - 1) / 10 * 10 + 1;*/
		endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		/* total = total - startRow + 1; */
		
		no = total - ((nowPage - 1) * rowPerPage);

	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRowPerPage() {
		return rowPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

}
