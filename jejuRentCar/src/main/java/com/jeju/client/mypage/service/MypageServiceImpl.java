package com.jeju.client.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.client.common.util.BCrypt;
import com.jeju.client.common.util.SHA256;
import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.mypage.dao.MypageDao;
import com.jeju.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class MypageServiceImpl implements MypageService{

	@Inject
	private MypageDao dao;

	@Override
	public List<ReservationVO> reservation(ReservationVO rvo) {
		System.out.println(rvo.getCar_model_number() + "서비스impl");
		return dao.reservation(rvo); 
	}

	@Override
	public ReservationVO reservationdetail(ReservationVO rvo) {
		return dao.reservationdetail(rvo);
	}

	@Override
	public MemberVO updateForm(MemberVO mvo) {
		SHA256 sha = SHA256.getInsatnce();

		String passwd = mvo.getMem_password();

		String shaPass = null;
		try {
			shaPass = sha.getSha256(passwd.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String dbPass = selectHash(mvo.getMem_id());
		if (dbPass != null) { // 셀렉트 해쉬가 널이 아닐경우
			if (BCrypt.checkpw(shaPass, dbPass)) {
				System.out.println("비밀번호 일치");
				mvo.setMem_password(dbPass);
			} else {
				System.out.println("비밀번호 불일치"); // 비밀번호 틀릴경우
			}
		}
		return dao.pwChk(mvo);
	}

	@Override
	public String selectHash(String mem_id) {
		return dao.selectHash(mem_id);
	}

	@Override
	public int rescancel(ReservationVO rvo) {
		return dao.rescancel(rvo);
	}
	@Override
	public int refrequest(ReservationVO rvo) {
		return dao.refrequest(rvo);
	}

	@Override
	public int infoUpdate(MemberVO mvo) throws Exception {
		
		SHA256 sha = SHA256.getInsatnce();
		String orgPasswd = mvo.getMem_password();
		
		String shaPass = sha.getSha256(orgPasswd.getBytes());
		
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		mvo.setMem_password(bcPass);
		
		return dao.infoUpdate(mvo);
	}

	
}
