package www.gwp.ex.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import www.gwp.ex.dto.BoardDTO;

public class BoardDAO {
	private static BoardDAO boardDAO = new BoardDAO();
	private int sizeOfPage = 10;
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/testdb";
	private final String BOARD_TABLE_NAME = "bGWP";
	private final String MEMBER_TABLE_NAME = "mGWP";
	private DataSource dataSource;

	private final String SELECT_TOP_BOARD_SQL = "SELECT * FROM " +BOARD_TABLE_NAME+ " WHERE tag=? ORDER BY cnt DESC LIMIT ?";
	private final String SELECT_COUNT_OF_LIST = "SELECT COUNT(*) FROM " + BOARD_TABLE_NAME;
	private final String INCREASE_CNT_SQL="UPDATE " + BOARD_TABLE_NAME + " SET cnt = cnt + 1 WHERE b_num=?";
	private final String GET_BOARD_DTO_SQL = "SELECT * FROM "+BOARD_TABLE_NAME + " WHERE b_num=?";
	private final String GET_CURRENT_NUM_SQL = "SELECT MAX(b_num) from " +BOARD_TABLE_NAME;
	private final String INSERT_BOARD_SQL ="INSERT INTO "+BOARD_TABLE_NAME+" (title, imgSrc, sIntro, price, tag, lIntro, b_num) values (?, ?, ?, ?, ?,?,?)";
	private final String GET_INDEX_TAG_DTO_SQL = "SELECT *, MAX(cnt) FROM " + BOARD_TABLE_NAME + " WHERE tag=?";
	private final String GET_TOP_DTO_SQL = "SELECT *, MAX(cnt) FROM " + BOARD_TABLE_NAME;

	private BoardDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static BoardDAO getBoardDAO() {
		return boardDAO;
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
	public void close(ResultSet rs, PreparedStatement ps, Connection conn){

		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close(PreparedStatement ps, Connection conn){

		try {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BoardDTO> listDAO(int curPage, String tag) {
		ArrayList<BoardDTO> toplist = new ArrayList<BoardDTO>();
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(SELECT_TOP_BOARD_SQL);
			ps.setString(1, tag);
			ps.setInt(2, sizeOfPage);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setB_num(rs.getInt("b_num"));
				dto.setTitle(rs.getString("title"));
				dto.setImgSrc(rs.getString("imgSrc"));
				dto.setsIntro(rs.getString("sIntro"));
				dto.setPrice(rs.getInt("price"));
				dto.setTag(rs.getString("tag"));
				dto.setlIntro(rs.getString("lIntro"));
				dto.setCnt(rs.getInt("cnt"));
				toplist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, ps, conn);
		}
		return toplist;
	}

	public int calTotalPage() {
		int numberOfArticles = cntOfList();
		int totalPage = numberOfArticles / sizeOfPage;
		if(numberOfArticles != 0)
			totalPage = numberOfArticles % sizeOfPage == 0 ? totalPage-1 : totalPage;

		return totalPage;
	}

	private int cntOfList() {
		int cnt = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;		
		try {
			ps = conn.prepareStatement(SELECT_COUNT_OF_LIST);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, ps, conn);
		}		
		return cnt;
	}

	public BoardDTO viewDAO(BoardDTO dto) {
		increaseCnt(dto.getB_num());
		dto = getBoardDTO(dto);
		return dto;
	}


	private BoardDTO getBoardDTO(BoardDTO dto) {
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(GET_BOARD_DTO_SQL);
			System.out.println(GET_BOARD_DTO_SQL);
			ps.setInt(1, dto.getB_num());
			rs = ps.executeQuery();
			if(rs.next())
			{
				dto.setB_num(rs.getInt("b_num"));
				dto.setTitle(rs.getString("title"));
				dto.setImgSrc(rs.getString("imgSrc"));
				dto.setlIntro(rs.getString("lIntro"));
				dto.setsIntro(rs.getString("sIntro"));
				dto.setTag(rs.getString("tag"));
				dto.setPrice(rs.getInt("price"));
				dto.setCnt(rs.getInt("cnt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, ps, conn);
		}		
		return dto;
	}

	private void increaseCnt(int b_num) {
		Connection conn = getConnection();
		PreparedStatement ps = null;
		int result = 0;
		try {
			ps = conn.prepareStatement(INCREASE_CNT_SQL);
			ps.setInt(1, b_num);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps, conn);
		}
	}

	public void postOKDAO(BoardDTO dto) {
		Connection conn = getConnection();
		PreparedStatement ps = null;
		int curNum = getCurrentNum();
		int result = 0;
		try {
			ps = conn.prepareStatement(INSERT_BOARD_SQL);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getImgSrc());
			ps.setString(3, dto.getsIntro());
			ps.setInt(4, dto.getPrice());
			ps.setString(5, dto.getTag());
			ps.setString(6, dto.getlIntro());
			ps.setInt(7, curNum);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps, conn);
		}
	}

	private int getCurrentNum() {
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int curNum = 0;
		try {
			ps = conn.prepareStatement(GET_CURRENT_NUM_SQL);
			rs = ps.executeQuery();
			if(rs.next()) {
				curNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return curNum + 1;
	}

	public BoardDTO indexTagDAO(String tag) {
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		BoardDTO dto = new BoardDTO();
		try {
			ps = conn.prepareStatement(GET_INDEX_TAG_DTO_SQL);
			ps.setString(1, tag);
			rs = ps.executeQuery();
			if(rs.next())
			{
				dto.setB_num(rs.getInt("b_num"));
				dto.setTitle(rs.getString("title"));
				dto.setImgSrc(rs.getString("imgSrc"));
				dto.setsIntro(rs.getString("sIntro"));
				dto.setPrice(rs.getInt("price"));
				dto.setTag(rs.getString("tag"));
				dto.setlIntro(rs.getString("lIntro"));
				dto.setCnt(rs.getInt("cnt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, ps, conn);
		}		
		return dto;
	}

	public BoardDTO topDTO() {
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		BoardDTO dto = new BoardDTO();
		try {
			ps = conn.prepareStatement(GET_TOP_DTO_SQL);
			rs = ps.executeQuery();
			if(rs.next())
			{
					dto.setB_num(rs.getInt("b_num"));
					dto.setTitle(rs.getString("title"));
					dto.setImgSrc(rs.getString("imgSrc"));
					dto.setsIntro(rs.getString("sIntro"));
					dto.setPrice(rs.getInt("price"));
					dto.setTag(rs.getString("tag"));
					dto.setlIntro(rs.getString("lIntro"));
					dto.setCnt(rs.getInt("cnt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, ps, conn);
		}		
		return dto;
	}



}
