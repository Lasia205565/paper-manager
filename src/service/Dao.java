package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import action.SearchPaper;
import model.Paper;
import model.User;
import model.gradeinfo;
import support.UserSupport;

public class Dao {

	public static List<gradeinfo> inforesult;

	public List<gradeinfo> getInforesult() {
		return inforesult;
	}

	public void setInforesult(List<gradeinfo> inforesult) {
		this.inforesult = inforesult;
	}
	
	static private Logger logger = Logger.getLogger(Dao.class);

	public static Connection getConn() {
		String driver = "com.mysql.jdbc.Driver";
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		//System.getenv("MYSQL_HOST_S"); 为从库，只读
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		Connection conn = null;
		try {
			Class.forName(driver); // classLoader,加载对应驱动
			conn = DriverManager.getConnection(dbUrl, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static User findUser(String username) throws SQLException {
		User user = null;
		Connection conn = Dao.getConn();
		String sql = "select password, email, realName, authority from user where username = '" + username + "'";
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			user = new User();
			user.setUsername(username);
			user.setPassword(rs.getString(1));
			user.setEmail(rs.getString(2));
			user.setRealName(rs.getString(3));
			user.setAuthority(rs.getInt(4));
		}
		return user;
	}
	
	public static void inputUser(User user) throws SQLException {
		Connection conn = Dao.getConn();
		String sql = "insert into user values(?,?,?,?,?,?)";
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, user.getUsername());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getRealName());
		//当前日期
		pstmt.setString(5, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		pstmt.setInt(6, user.getAuthority());
		pstmt.executeUpdate();
		//logger.info("register successful");
		pstmt.close();
		conn.close();
	}

	public static Paper findPaper(String paperID) throws SQLException {
		Connection conn = Dao.getConn();
		
		PreparedStatement pstmt;
		String sql = "SELECT * FROM paper,upload WHERE paper.PaperID=upload.paperID AND paper.PaperID= '" + paperID + "'";
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Paper temp = null;
		if (rs.next()) {
			
			temp = new Paper();
			temp.setPaperID(rs.getString(1));
			temp.setTitle(rs.getString(2));
			temp.setAuthor(rs.getString(3));
			temp.setSecondAuthor(rs.getString(4));
			temp.setDate(rs.getString(5));
			temp.setSort(rs.getInt(6));
			temp.setPublication(rs.getString(7));
			temp.setStatus(rs.getInt(8));
			temp.setKeyword(rs.getString(9));
			temp.setDescription(rs.getString(10));
			temp.setFilename(rs.getString(11));
			temp.setLevel(rs.getInt(12));
			temp.setClickTime(rs.getInt(16));
			logger.info("find papr by paperid successful --Dao"+temp.getTitle());
		}
      
		

		return temp;
	}
    
	public static int insertPaper(Paper paper) throws SQLException {
		Connection conn = getConn();
		String sql = "REPLACE INTO paper VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, paper.getPaperID());
		pstmt.setString(2, paper.getTitle());
		pstmt.setString(3, paper.getAuthor());
		pstmt.setString(4, paper.getSecondAuthor());
		pstmt.setString(5, paper.getDate());
		pstmt.setLong(6, paper.getSort());
		pstmt.setString(7, paper.getPublication());
		pstmt.setInt(8, paper.getStatus());
		pstmt.setString(9, paper.getKeyword());
		pstmt.setString(10, paper.getDescription());
		pstmt.setString(11, paper.getFilename());
		pstmt.setInt(12, paper.getLevel());
		int result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}
	
	public static int removePaper(Paper paper) throws SQLException {
		Connection conn = getConn();
		String sql = "DELETE FROM paper WHERE PaperID = " + paper.getPaperID();
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		logger.info("remove paper successfully！");
		pstmt.close();
		conn.close();
		return result;
	}
	public static int addUpload(String username, String paperID) throws SQLException {
		Connection conn = Dao.getConn();
		String sql = "insert into upload values(?,?,?,?)";
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setString(2, paperID);
		pstmt.setString(3, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		pstmt.setInt(4, 0);
		int result = pstmt.executeUpdate();
		//logger.info("register successful");
		pstmt.close();
		conn.close();
		return result;
	}

	public static int removeUpload(String paperID) throws SQLException {
		Connection conn = Dao.getConn();
		String sql = "DELETE FROM upload WHERE PaperID = " + paperID;
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return result;
	}
	
	public static int findSortLevel(String sortstr) throws SQLException {
		Connection conn = Dao.getConn();
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement("select * from first where sortname='" + sortstr +"'");
		ResultSet rs = pstmt.executeQuery("select * from first where sortname='" + sortstr +"'");
		if (rs.next()) {
			return 0;
		}
		pstmt = (PreparedStatement) conn.prepareStatement("select * from second where sortname='" + sortstr +"'");
		rs = pstmt.executeQuery("select * from second where sortname='" + sortstr +"'");
		if (rs.next()) {
			return 1;
		}
		pstmt = (PreparedStatement) conn.prepareStatement("select * from third where sortname='" + sortstr +"'");
		rs = pstmt.executeQuery("select * from third where sortname='" + sortstr +"'");
		if (rs.next()) {
			return 2;
		}
		return -1;
	}
	

	public static int findSortID(String sortstr) throws SQLException {
		String sql = "select * from first where sortname='" + sortstr 
				+ "' union select * from second where sortname='"
				+ sortstr + "' union select * from third where sortname='" + sortstr +"'";
		Connection conn = Dao.getConn();
		PreparedStatement pstmt;
		int result = -1;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			result = rs.getInt(1);
		}
		pstmt.close();
		conn.close();
		return result;
	}
	
	//获取类型
	public static String findsortname(int num) throws SQLException {
		String sql = "select sortname from third where thirdID=" + num+";";
		String str=null;
		Connection conn = Dao.getConn();
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		while(rs.next()) {
			 str=rs.getString(1);
		}
		
		pstmt.close();
		conn.close();
		return str;
	}
	//获取论文等级名字
	public static String matchlevel(int num) {
		String str=null;
		switch(num) {
		case 60: 
			str="SCI";
			break;
		case 45:
			str="EI，CSSCI,SSCI,一级刊物";
			break;
		case 30:
			str="核心期刊(国际会议)";
			break;
		case 15:
			str="公开发表";
			break;
		case 10:
			str="普通论文";
			break;
		}
		
		return str;
	}
	//计算第一作者应得的分数
	public static List<gradeinfo> findFirstAuthor(String str) {
	 	
	 	String sql="select * from paper,new where paper.FirstAuthorID='"+str+"' and new.PaperID=paper.PaperID";
		Connection conn=Dao.getConn();
		PreparedStatement pstmt;
		inforesult = new ArrayList<>();
		try {
			pstmt= (PreparedStatement)conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				float num=0;
				if(rs.getString(4)!=null) {
					String[] b=rs.getString(4).trim().split(",");
					List<String> listA = Arrays.asList(b);
					String tempstrr=listA.toString();
					
					if(tempstrr.length()<=2) {
						
						num=num+rs.getFloat(12);//只有一个作者
					}else {
						
						num=num+(int)(rs.getFloat(12)*0.5);//有合作者
					}
				}
				
				gradeinfo  grainfobean=new gradeinfo();
				grainfobean.setAuthor(rs.getString(3));
				grainfobean.setTitle(rs.getString(2));
				grainfobean.setPaperID(rs.getString(1));
				grainfobean.setLevel(rs.getInt(12));
				grainfobean.setDate(rs.getString(5));
				grainfobean.setSecondAuthor(rs.getString(4));
				grainfobean.setSort(rs.getInt(6));
				grainfobean.setLevelname(matchlevel(rs.getInt(12)));
				grainfobean.setSortname(findsortname(rs.getInt(6)));
				grainfobean.setKeywords(rs.getString(9));
				grainfobean.setGotscore(num);
				inforesult.add(grainfobean);
			}
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	 return inforesult;
	}
//计算作为第二作者获得的分数;
	public static List<gradeinfo> findSecondtAuthor(String str) {
		inforesult = new ArrayList<>();
	 String sql="select * from paper,new where paper.SecondAuthorID like '%"+str+"%' AND new.PaperID=paper.PaperID;";
		Connection conn=Dao.getConn();
		PreparedStatement pstmt;
		try {
			pstmt= (PreparedStatement)conn.prepareStatement(sql);
			ResultSet rs= pstmt.executeQuery(sql);
			String[] b=null;
			while(rs.next()) {
				if(rs.getString(4)!=null) {
				 b=rs.getString(4).trim().split(",");
				}
				List<String> listA = Arrays.asList(b);
			float num=0;
			if(listA.contains(str)) {
				int amount=b.length;
				num=num+(float) (rs.getFloat(12)*0.5)/amount;
				gradeinfo  grainfobean=new gradeinfo();
				grainfobean.setAuthor(rs.getString(3));
				grainfobean.setTitle(rs.getString(2));
				grainfobean.setPaperID(rs.getString(1));
				grainfobean.setLevel(rs.getInt(12));
				grainfobean.setDate(rs.getString(5));
				grainfobean.setSecondAuthor(rs.getString(4));
				grainfobean.setSort(rs.getInt(6));
				grainfobean.setLevelname(matchlevel(rs.getInt(12)));
				grainfobean.setSortname(findsortname(rs.getInt(6)));
				grainfobean.setGotscore(num);
				inforesult.add(grainfobean);
			}else {
				num=num+0;
			}
			}
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	 return  inforesult;
	}
	
	public static List<Paper> PadingResult(String sql) throws SQLException{
		Connection conn = getConn();
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		List<Paper> list=new ArrayList<>();
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Paper temp = new Paper();
			temp.setPaperID(rs.getString(1));
			temp.setTitle(rs.getString(2));
			temp.setAuthor(rs.getString(3));
			temp.setSecondAuthor(rs.getString(4));
			temp.setDate(rs.getString(5));
			temp.setSort(rs.getInt(6));
			temp.setPublication(rs.getString(7));
			temp.setStatus(rs.getInt(8));
			temp.setKeyword(rs.getString(9));
			temp.setDescription(rs.getString(10));
			temp.setFilename(rs.getString(11));
			temp.setLevel(rs.getInt(12));
			logger.info("!"+rs.getString(16));
			temp.setClickTime(rs.getInt(16));
			logger.info("!"+rs.getString(16));
				list.add(temp);	}
		
	
		return list;
	}

	public static void setStatus(String paperID, int i) throws SQLException {
		Connection conn = Dao.getConn();
		String sql = "UPDATE paper SET Status=" + i + " WHERE PaperID = " + paperID;
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();		
	}
	//统计下载量
	public static void sumClickTime(String paperID) throws SQLException {
		Connection conn = getConn();
		String sql = "update  upload set clickTime=clickTime+1 where paperID='"+ paperID+"';";
		PreparedStatement pstmt;
		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		logger.info("sumClickTime   successfully！");
		pstmt.close();
		conn.close();
		
	}
}
