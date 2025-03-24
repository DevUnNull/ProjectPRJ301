package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Account;

public class AccountDAO {

    // Lấy tất cả tài khoản
    public List<Account> getAllAccounts() {
        List<Account> accounts = new ArrayList<>();
        DBContext db = new DBContext();
        Connection conn = null;
        String sql = "SELECT * FROM Account";

        try {
            conn = db.getConnection();
            if (conn == null) {
                System.err.println("⚠️ Lỗi: Không thể kết nối database!");
                return accounts;
            }

            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    accounts.add(new Account(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getInt("role")
                    ));
                }
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi lấy danh sách tài khoản: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (conn != null) {
                db.closeConnection(conn);
            }
        }
        return accounts;
    }

    // Lấy tài khoản theo ID
    public Account getAccountById(int id) {
        DBContext db = new DBContext();
        Connection conn = null;
        Account acc = null;
        String sql = "SELECT * FROM Account WHERE id = ?";

        try {
            conn = db.getConnection();
            if (conn == null) {
                System.err.println("⚠️ Lỗi: Không thể kết nối database!");
                return null;
            }

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        acc = new Account(
                                rs.getInt("id"),
                                rs.getString("username"),
                                rs.getString("password"),
                                rs.getString("email"),
                                rs.getInt("role")
                        );
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi lấy tài khoản ID=" + id + ": " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (conn != null) {
                db.closeConnection(conn);
            }
        }
        return acc;
    }

    // Cập nhật role của tài khoản
    public boolean updateAccountRole(int id, int role) {
        DBContext db = new DBContext();
        Connection conn = null;
        String sql = "UPDATE Account SET role = ? WHERE id = ?";
        boolean isUpdated = false;

        try {
            conn = db.getConnection();
            if (conn == null) {
                System.err.println("⚠️ Lỗi: Không thể kết nối database!");
                return false;
            }

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, role);
                ps.setInt(2, id);
                isUpdated = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi cập nhật role cho tài khoản ID=" + id + ": " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (conn != null) {
                db.closeConnection(conn);
            }
        }
        return isUpdated;
    }

    // Đặt role về 0
    public boolean setRoleToZero(int id) {
        return updateAccountRole(id, 0);
    }
    
    // Cập nhật thông tin tài khoản (username, email, role)
public boolean updateAccountDetails(int id, String username, String email, int role) {
    DBContext db = new DBContext();
    Connection conn = null;
    String sql = "UPDATE Account SET username = ?, email = ?, role = ? WHERE id = ?";
    boolean isUpdated = false;

    try {
        conn = db.getConnection();
        if (conn == null) {
            System.err.println("⚠️ Lỗi: Không thể kết nối database!");
            return false;
        }

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setInt(3, role);
            ps.setInt(4, id);
            isUpdated = ps.executeUpdate() > 0;
        }
    } catch (Exception e) {
        System.err.println("Lỗi khi cập nhật tài khoản ID=" + id + ": " + e.getMessage());
        e.printStackTrace();
    } finally {
        if (conn != null) {
            db.closeConnection(conn);
        }
    }
    return isUpdated;
}

}
