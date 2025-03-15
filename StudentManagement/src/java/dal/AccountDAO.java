package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Account;

public class AccountDAO {
    private DBContext db;

    public AccountDAO() {
        db = new DBContext();
    }

    // Thêm tài khoản
    public void addAccount(Account account) throws SQLException {
        String sql = "INSERT INTO Account (id, username, password, email, role) VALUES (?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, account.getId());
            ps.setString(2, account.getUsername());
            ps.setString(3, account.getPassword());
            ps.setString(4, account.getEmail());
            ps.setInt(5, account.getRole());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error adding account: " + e.getMessage());
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) db.closeConnection(conn);
        }
    }

    // Xóa tài khoản
    public void deleteAccount(int id) throws SQLException {
        String sql = "DELETE FROM Account WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error deleting account: " + e.getMessage());
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) db.closeConnection(conn);
        }
    }

    // Sửa tài khoản
    public void updateAccount(Account account) throws SQLException {
        String sql = "UPDATE Account SET username = ?, password = ?, email = ?, role = ? WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getEmail());
            ps.setInt(4, account.getRole());
            ps.setInt(5, account.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error updating account: " + e.getMessage());
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) db.closeConnection(conn);
        }
    }

    // Lấy danh sách tài khoản
    public List<Account> getAllAccounts() throws SQLException {
        List<Account> accounts = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM Account";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("email"),
                    rs.getInt("role")
                );
                accounts.add(account);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving accounts: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) db.closeConnection(conn);
        }
        return accounts;
    }
}