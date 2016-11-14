package samples;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class Member {

        String username;
        String fullname;
        boolean admin;

        public Member(String username, String fullname, boolean admin) {
                this.username = username;
                this.fullname = fullname;
                this.admin = admin;
        }

        public String getUsername() {
                return username;
        }

        public void setUsername(String username) {
                this.username = username;
        }

        public String getFullname() {
                return fullname;
        }

        public void setFullname(String fullname) {
                this.fullname = fullname;
        }

        public boolean isAdmin() {
                return admin;
        }

        public void setAdmin(boolean admin) {
                this.admin = admin;
        }

        public static Member checkLogin(String username, String password, DataSource ds) throws SQLException{
                Member member = null;
                try(Connection conn= ds.getConnection();
                        PreparedStatement pstmt=conn.prepareStatement("SELECT * FROM Account WHERE username=? AND password=?")) {
                        pstmt.setString(1, username);
                        pstmt.setString(2, password);
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {
                                member=new Member(rs.getString("username"), rs.getString("password"), rs.getBoolean("isAdmin"));
                        }
                } 
                return member;
                
        }
        public static List<Member> findByKeyword(String keyword, DataSource ds) throws SQLException{
                List<Member> list= new ArrayList<>();
                try(Connection conn=ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Account WHERE fullname LIKE ?")){
                        pstmt.setString(1, "%"+keyword+"%");
                        ResultSet rs=pstmt.executeQuery();
                        while(rs.next()){
                               Member member=new Member(rs.getString("username"), rs.getString("fullname"), rs.getBoolean("isAdmin"));
                                list.add(member);
                        }
                }
                return list;
        }
        public static Member findByUsername(String username, DataSource ds) throws SQLException{
               Member member = null;
                try(Connection conn=ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Account WHERE username =?")){
                        pstmt.setString(1, username);
                        ResultSet rs=pstmt.executeQuery();
                        if(rs.next()){
                               member =new Member(rs.getString("username"), rs.getString("fullname"), rs.getBoolean("isAdmin"));                                
                        }
                }
                return member;
        }
}
