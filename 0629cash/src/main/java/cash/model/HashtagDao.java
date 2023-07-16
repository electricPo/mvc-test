package cash.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cash.vo.Hashtag;

public class HashtagDao {
	
	// 월별 해시태그 출력 
	public List<Map<String, Object>> selectWordCountByMonth(String memberId, int targetYear, int targetMonth){
		//반환할 리스트 생성
		List<Map<String, Object>> list = new ArrayList<>();
		//db접속
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//sql 가져오기
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
			String sql = "SELECT word, COUNT(*) cnt "
					+ "FROM hashtag h INNER JOIN cashbook c "
					+ "ON h.cashbook_no = c.cashbook_no "
					+ "WHERE c.member_id = ? AND year(c.cashbook_date) = ? AND month(c.cashbook_date) = ? "
					+ "GROUP BY cashword "
					+ "ORDER BY COUNT(*) DESC";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberId);
			stmt.setInt(2, targetYear);
			stmt.setInt(3, targetMonth);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("cashword", rs.getString("cashword"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	// 해시태그 추가
	public void insertHashtag(Hashtag hashtag) {
		//db접속
		Connection conn = null;
		PreparedStatement stmt = null;
		
		//sql 가져오기
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
			String sql = "INSERT INTO hashtag(cashbook_no, cashword, updatedate, createdate) "
					+ "VALUES(?,?,NOW(),NOW())";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, hashtag.getCashbookNo());
			stmt.setString(2, hashtag.getCashword());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				stmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return;
	}
	
	// 해시태그 삭제
	public int removeHashtag(int cashbookNo) {

		int row = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String sql = "DELETE FROM hashtag WHERE cashbook_no = ?";
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/cash","root","java1234");
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cashbookNo);
			row = stmt.executeUpdate();
			
		} catch (Exception e1) {
			e1.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return row;
	}
}