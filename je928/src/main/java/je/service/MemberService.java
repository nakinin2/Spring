package je.service;

import je.model.Member;

public interface MemberService {

	int insertMember(Member member);
	String loginChk(String m_email, String m_passwd);
	int m_emailChk(String m_email);
	int m_nickChk(String m_nick, Member member);
	Member selectMember(int m_no);
	int updateMember(Member member);
	Member m_deletePwdChk(int m_no);
	int deleteMember(int m_no);
}
