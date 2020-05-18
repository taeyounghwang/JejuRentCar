package com.jeju.client.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeju.client.common.util.BCrypt;
import com.jeju.client.common.util.SHA256;
import com.jeju.client.member.dao.MemberDao;
import com.jeju.client.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;

	@Override
	public void insertMember(MemberVO mvo) throws Exception {
		
		SHA256 sha = SHA256.getInsatnce();
		String orgPasswd = mvo.getMem_password();
		
		String shaPass = sha.getSha256(orgPasswd.getBytes());
		
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		mvo.setMem_password(bcPass);
		
		memberDao.insertMember(mvo);
	}

	@Override
	public int userIdConfirm(String mem_id) {
		int result;
		if(memberDao.memberSelect(mem_id) !=null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}
	
		

}
