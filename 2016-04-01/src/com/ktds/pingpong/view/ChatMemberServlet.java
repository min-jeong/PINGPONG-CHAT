package com.ktds.pingpong.view;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.pingpong.member.biz.MemberBiz;
import com.ktds.pingpong.member.vo.MemberVO;
import com.ktds.pingpong.team.biz.TeamBiz;
import com.ktds.pingpong.team.vo.TeamVO;

/**
 * Servlet implementation class ChatMemberServlet
 */
public class ChatMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberBiz memberBiz;
	private TeamBiz teamBiz;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatMemberServlet() {
        super();
        memberBiz = new MemberBiz();
        teamBiz = new TeamBiz();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("_MEMBER_");
		
		List<MemberVO> members = memberBiz.getAllMember();  
		List<TeamVO> teams = teamBiz.getListTeamById(loginMember.getEmail());
		//System.out.println("팀사이즈"+teams.size());
		
		request.setAttribute("allTeams", teams);	
		request.setAttribute("allMember", members);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/chat/chat_mem_view.jsp");
		rd.forward(request, response);
	}

}
