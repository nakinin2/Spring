package je.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import je.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertMember(Member member) {
		int result = 0, m_number = 0, m_no = 0;
		try {
			m_no = session.selectOne("member.selectMno", member);
			if(m_no > 0) {
				member.setM_no(m_no);
				result = session.update("member.insertReMember", member);
			}else {
				m_number = session.selectOne("member.selectNum");
				member.setM_no(m_number);
				result = session.insert("member.insertMember", member);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public String loginChk(String email, String passwd) {
		String result = "";
		try {
			String dbpass = session.selectOne("member.loginChk", email);
			System.out.println("member dbpass : " + dbpass);
			if(dbpass == null) {
				result = "x";
			}
			else if(dbpass.equals(passwd)) {
				result = session.selectOne("member.selectMno2", email);
			}else {
				result = "passwdx";
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("result : " + result);
		return result;
	}

	public int m_emailChk(String m_email) {
		int result = 0;
		try {
			result = session.selectOne("member.m_emailChk", m_email);
			System.out.println(result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int m_nickChk(String m_nick, Member member) {
		int result = 0;
		String selectNick = "";
		String db_Nick = "";
		try {
			selectNick = session.selectOne("member.selectNick", member.getM_no());
			db_Nick = session.selectOne("member.nickChk", member);
			if(selectNick != null) {
				if(db_Nick == null) {
					result = -1;
				}else if(db_Nick.equals(selectNick)) {
					result = 0;
				}else if(db_Nick != null){
					result = 1;
				}
			}else {
				if(db_Nick != null) {
					result = 1;
				}else {
					result = -1;
				}
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public Member selectMember(int m_no) {
		return session.selectOne("member.selectMember", m_no);
	}

	public int updateMember(Member member) {
		int result = 0;
		try {
			result = session.update("member.updateMember", member);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public Member m_deletePwdChk(int m_no) {
		Member member = new Member();
		try {
			String passwd = session.selectOne("member.deletePwdChk", m_no);
			member.setM_passwd(passwd);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return member;
	}

	public int deleteMember(int m_no) {
		int result = 0;
		try {
			result = session.update("member.deleteMember", m_no);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

}
