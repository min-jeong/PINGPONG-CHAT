package com.ktds.pingpong.team.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.pingpong.team.biz.TeamBiz;
import com.ktds.pingpong.team.vo.TeamListVO;
import com.ktds.pingpong.team.vo.TeamVO;

/**
 * Servlet implementation class addNewMemberServlet
 */
public class addNewMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TeamBiz teamBiz;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewMemberServlet() {
        super();
        teamBiz = new TeamBiz();
        // TODO Auto-generated constructor stub
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
		TeamVO team = (TeamVO) session.getAttribute("_TEAM_");
		
		request.setCharacterEncoding("UTF-8");
		
		String[] emailList = request.getParameterValues("email");
		System.out.println("배열 잘 받아오냐..."+emailList.length);
		
		teamBiz.addNewMember(emailList, team.getTeamId());
		
		response.sendRedirect("/goManageTeam");
	}

}
