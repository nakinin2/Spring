package je.model;

import java.sql.Date;

public class Member {
	private int m_no;
	private String m_email;
	private String m_passwd;
	private String m_nick;
	private Date m_reg_date;
	private Date m_out_date;
	private String m_del_yn;
	private int no;

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public Date getM_reg_date() {
		return m_reg_date;
	}

	public void setM_reg_date(Date m_reg_date) {
		this.m_reg_date = m_reg_date;
	}

	public Date getM_out_date() {
		return m_out_date;
	}

	public void setM_out_date(Date m_out_date) {
		this.m_out_date = m_out_date;
	}

	public String getM_del_yn() {
		return m_del_yn;
	}

	public void setM_del_yn(String m_del_yn) {
		this.m_del_yn = m_del_yn;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
}
