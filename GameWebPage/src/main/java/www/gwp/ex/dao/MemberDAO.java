package www.gwp.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import www.gwp.ex.dto.MemberDTO;

public class MemberDAO {
	private static MemberDAO memberDAO = new MemberDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/testdb";
	private final String TABLE_NAME = "mGWP";
	private DataSource dataSource;
	
	private final String LOGIN_MEMBER_SQL = "SELECT * FROM " + TABLE_NAME + " WHERE id = ? AND pw = ?";
	private final String INSERT_MEMBER_SQL = "INSERT INTO " + TABLE_NAME + " (id, pw, email, birth) values(?, ?, ?, ?)";
	private final String UPDATE_MEMBER_SQL = "UPDATE " + TABLE_NAME + "SET pw=?, email=?";
	
	private MemberDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static MemberDAO getMemberDAO() {
		return memberDAO;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
public void close(ResultSet rs, PreparedStatement pstmt, Connection conn){
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close(PreparedStatement pstmt, Connection conn){
		
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public MemberDTO memberLoginDAO(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(LOGIN_MEMBER_SQL);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setEmail(rs.getString("email"));
				dto.setBirth(rs.getString("birth"));
				dto.setManage(rs.getInt("manage"));
			} else {
				dto = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return dto;
	}

	public void memberJoinDAO(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(INSERT_MEMBER_SQL);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getBirth());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}	
	}

	public void memberModifyDAO(MemberDTO dto) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(UPDATE_MEMBER_SQL);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}	
	}	
}
