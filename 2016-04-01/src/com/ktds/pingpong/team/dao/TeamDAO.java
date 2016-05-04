package com.ktds.pingpong.team.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ktds.pingpong.util.xml.XML;
import com.ktds.pingpong.Const;
import com.ktds.pingpong.member.vo.MemberVO;
import com.ktds.pingpong.team.vo.TeamListVO;
import com.ktds.pingpong.team.vo.TeamVO;

public class TeamDAO {
	
	public List<TeamVO> getAllListTeam() {

		loadOracleDriver();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		List<TeamVO> teams = new ArrayList<TeamVO>();
		try {

			conn = DriverManager.getConnection(Const.DB_URL, Const.DB_USER, Const.DB_PASSWORD);

			String query = XML.getNodeString("//query/team/getAllListTeam/text()");
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();
			
			TeamVO validTeam = null;

			while (rs.next()) {
				validTeam = new TeamVO();
				validTeam.setTeamId(rs.getInt("TEAM_ID"));
				validTeam.setChatId(rs.getInt("CHAT_ID"));
				validTeam.setTeamName(rs.getString("TEAM_NAME"));
				validTeam.setLeaderEmail(rs.getString("LEADER_EMAIL"));
				teams.add(validTeam);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		} 
		finally {
			closeDB(conn, stmt, rs);
		}
		return teams;
	}

	public int insertNewTeam( TeamVO team ){
		
		int insertCount = 0;
		
		loadOracleDriver();		
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DriverManager.getConnection(Const.DB_URL, Const.DB_USER, Const.DB_PASSWORD);
			String query = XML.getNodeString("//query/team/insertNewTeam/text()");
			stmt = conn.prepareStatement(query);
			stmt.setString(1, team.getTeamName());
			stmt.setString(2, team.getLeaderEmail());
			
			insertCount = stmt.executeUpdate();
			
			if ( insertCount > 0 ){
				
				stmt.close();
				query = XML.getNodeString("//query/team/getLatestTeamId/text()");
				stmt = conn.prepareStatement(query);
				
				ResultSet rs = stmt.executeQuery();
				
				int teamId = 0;
				
				if ( rs.next() ){
					teamId = rs.getInt(1);
				}
				
				rs.close();
				return teamId;
			}
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		finally {
			closeDB(conn, stmt, null);
		}	
		return insertCount;
	}
	
	public void insertNewTeamList( TeamListVO teamList ){
		
		loadOracleDriver();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DriverManager.getConnection(Const.DB_URL, Const.DB_USER, Const.DB_PASSWORD);
			String query = XML.getNodeString("//query/team/insertNewTeamList/text()");
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, teamList.getTeamId());
			stmt.setString(2, teamList.getEmail());
//			stmt.setString(3, teamList.getIsLeader());
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		finally {
			closeDB(conn, stmt, null);
		}	
	}
	
	
	private void loadOracleDriver() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	private void closeDB(Connection conn, PreparedStatement stmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
			}
		}

	}

	public TeamVO showDetail(int teamId) {
		TeamVO team = new TeamVO();

		loadOracleDriver();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {

			conn = DriverManager.getConnection(Const.DB_URL, Const.DB_USER, Const.DB_PASSWORD);

			String query = XML.getNodeString("//query/team/showDetail/text()");
			stmt = conn.prepareStatement(query);

			stmt.setInt(1, teamId);

			rs = stmt.executeQuery();

			if (rs.next()) {
				team.setTeamId(rs.getInt("TEAM_ID"));
				team.setChatId(rs.getInt("CHAT_ID"));
				team.setTeamName(rs.getString("TEAM_NAME"));
				team.setLeaderEmail(rs.getString("LEADER_EMAIL"));
			}

		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		} finally {
			closeDB(conn, stmt, rs);
		}

		return team;
		
	}

	public void removeTeam(int teamId) {
		
		loadOracleDriver();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {

			conn = DriverManager.getConnection(Const.DB_URL, Const.DB_USER, Const.DB_PASSWORD);

			String query = XML.getNodeString("//query/team/removeTeam/text()");
			stmt = conn.prepareStatement(query);

			stmt.setInt(1, teamId);

			rs = stmt.executeQuery();

		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		} finally {
			closeDB(conn, stmt, rs);
		}
	}

	public List<TeamVO> getListTeamById(String email) {
		loadOracleDriver();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		List<TeamVO> teams = new ArrayList<TeamVO>();
		try {

			conn = DriverManager.getConnection(Const.DB_URL, Const.DB_USER, Const.DB_PASSWORD);

			String query = XML.getNodeString("//query/team/getListTeamById/text()");
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, email);
			
			rs = stmt.executeQuery();
			
			TeamVO validTeam = null;

			while (rs.next()) {
				validTeam = new TeamVO();
				validTeam.setTeamId(rs.getInt("TEAM_ID"));
				validTeam.setTeamListId(rs.getInt("TEAM_LIST_ID"));
				validTeam.setChatId(rs.getInt("CHAT_ID"));
				validTeam.setTeamName(rs.getString("TEAM_NAME"));
				validTeam.setLeaderEmail(rs.getString("LEADER_EMAIL"));
				validTeam.setIsLeader(rs.getString("ISLEADER"));
				validTeam.setEmail("EMAIL");
				
				teams.add(validTeam);
				
				System.out.println(validTeam.getTeamId());
			}
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		} 
		finally {
			closeDB(conn, stmt, rs);
		}
		return teams;
	}

	public TeamVO getTeamInfoById(int teamId) {
		
		loadOracleDriver();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(Const.DB_URL, Const.DB_USER, Const.DB_PASSWORD);
			String query = XML.getNodeString("//query/team/getTeamInfoById/text()");
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, teamId);
			
			rs = stmt.executeQuery();

			TeamVO team = new TeamVO();

			if (rs.next()) {
				
				team.setTeamId(rs.getInt("TEAM_ID"));
				team.setTeamListId(rs.getInt("TEAM_LIST_ID"));
				team.setChatId(rs.getInt("CHAT_ID"));
				team.setTeamName(rs.getString("TEAM_NAME"));
				team.setLeaderEmail(rs.getString("LEADER_EMAIL"));
				team.setIsLeader(rs.getString("ISLEADER"));
				team.setEmail("EMAIL");
				
			}
			return team;
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(), e);
		} finally {
			closeDB(conn, stmt, rs);
		}
	}
}
