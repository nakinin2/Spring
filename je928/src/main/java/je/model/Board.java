package je.model;

import java.sql.Date;

public class Board {

	private int brd_no;
	private String brd_subject;
	private String brd_content;
	private int brd_readcount;
	private Date brd_reg_date;
	private Date brd_update_date;
	private String brd_del_yn;
	private int ref;
	private int re_step;
	private int re_level;
	private int m_no;
	private String m_nick;
	private String m_passwd;
	private int replycount;
	private int byteSize;
	private Date newday;
	private int sublength;
	private int reflimit;

	// 조회용
	private int startRow;
	private int endRow;
	// 검색용
	private String searchType;
	private String searchTxt;

	public int getBrd_no() {
		return brd_no;
	}

	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}

	public String getBrd_subject() {
		return brd_subject;
	}

	public void setBrd_subject(String brd_subject) {
		this.brd_subject = brd_subject;
	}

	public String getBrd_content() {
		return brd_content;
	}

	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}

	public int getBrd_readcount() {
		return brd_readcount;
	}

	public void setBrd_readcount(int brd_readcount) {
		this.brd_readcount = brd_readcount;
	}

	public Date getBrd_reg_date() {
		return brd_reg_date;
	}

	public void setBrd_reg_date(Date brd_reg_date) {
		this.brd_reg_date = brd_reg_date;
	}

	public Date getBrd_update_date() {
		return brd_update_date;
	}

	public void setBrd_update_date(Date brd_update_date) {
		this.brd_update_date = brd_update_date;
	}

	public String getBrd_del_yn() {
		return brd_del_yn;
	}

	public void setBrd_del_yn(String brd_del_yn) {
		this.brd_del_yn = brd_del_yn;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchTxt() {
		return searchTxt;
	}

	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	
	public int getByteSize() {
		return byteSize;
	}

	public void setByteSize(int byteSize) {
		this.byteSize = byteSize;
	}
	
	public Date getNewday() {
		return newday;
	}

	public void setNewday(Date newday) {
		this.newday = newday;
	}
	
	public int getSublength() {
		return sublength;
	}

	public void setSublength(int sublength) {
		this.sublength = sublength;
	}
	
	public int getReflimit() {
		return reflimit;
	}

	public void setReflimit(int reflimit) {
		this.reflimit = reflimit;
	}


}
