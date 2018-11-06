package je.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import je.dao.MemberDao;
import je.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao md;
	
	public int insertMember(Member member) {
		return md.insertMember(member);
	}

	public String loginChk(String m_email, String m_passwd) {
		return md.loginChk(m_email, m_passwd);
	}

	public int m_emailChk(String m_email) {
		return md.m_emailChk(m_email);
	}

	public int m_nickChk(String m_nick, Member member) {
		return md.m_nickChk(m_nick, member);
	}
	
	public Member selectMember(int m_no) {
		return md.selectMember(m_no);
	}
	
	public int updateMember(Member member) {
		return md.updateMember(member);
	}
	
	public Member m_deletePwdChk(int m_no) {
		return md.m_deletePwdChk(m_no);
	}

	public int deleteMember(int m_no) {
		return md.deleteMember(m_no);
	}
	
}
