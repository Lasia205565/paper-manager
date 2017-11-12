package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Paper;
import service.ConnectSQL;

public class update {
	public String paperID;
	public String dates;
	private Paper paper;
	public String firststr;
	public String secondstr;
	public String thirdstr;

	public String getFirststr() {
		return firststr;
	}

	public void setFirststr(String firststr) {
		this.firststr = firststr;
	}

	public String getSecondstr() {
		return secondstr;
	}

	public void setSecondstr(String secondstr) {
		this.secondstr = secondstr;
	}

	public String getThirdstr() {
		return thirdstr;
	}

	public void setThirdstr(String thirdstr) {
		this.thirdstr = thirdstr;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

	public String execute() {
		System.out.println(getPaperID());

		PreparedStatement pstmt;
		Connection conn = ConnectSQL.getConn();
		String sql = "select * from paper where paperID='" + getPaperID() + "';";
		System.out.println(sql);
		paper = new Paper();
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				paper.setAuthor(rs.getString(3));
				paper.setSecondauthor(rs.getString(4));
				paper.setKeyword(rs.getString(9));
				paper.setDate(rs.getString(5));
				paper.setTitle(rs.getString(2));
				paper.setPublication(rs.getString(7));
				paper.setCategory(rs.getString(6));
				dates=rs.getString(5);
				int num=rs.getInt(6);
				System.out.println(num);
				findsort(num);
				
			}
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "success";
	}
 public ResultSet findsort(int str) {
	 PreparedStatement pstmt;
		Connection conn = ConnectSQL.getConn();
		String sql = "select first.sortname ,second.sortname,third.sortname from third, second ,first where thirdID=" + str + " and third.upper=second.secondID and second.upper=first.firstID;";
		System.out.println(sql);
		ResultSet rs=null;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 while(rs.next()) {
				 System.out.println("success show!");
				 firststr=rs.getString(1);
					secondstr=rs.getString(2);
					thirdstr=rs.getString(3);
			 }
			 pstmt.close();
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	 return rs;
 }
	public String getPaperID() {
		return paperID;
	}

	public void setPaperID(String paperID) {
		this.paperID = paperID;
	}
}
