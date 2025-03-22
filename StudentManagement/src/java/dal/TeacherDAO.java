package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Teacher;

public class TeacherDAO {
    private DBContext db;

    public TeacherDAO() {
        db = new DBContext();
    }

    // Thêm giáo viên
    public void addTeacher(Teacher teacher) throws SQLException {
        String sql = "INSERT INTO Teacher (teacherID, teacherName, gender, address, phone, email) VALUES (?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, teacher.getTeacherID());
            ps.setString(2, teacher.getTeacherName());
            ps.setString(3, teacher.getGender());
            ps.setString(4, teacher.getAddress());
            ps.setString(5, teacher.getPhone());
            ps.setString(6, teacher.getEmail());
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Xóa giáo viên
    public void deleteTeacher(String teacherID) throws SQLException {
        String sql = "DELETE FROM Teacher WHERE teacherID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, teacherID);
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Sửa giáo viên
    public void updateTeacher(Teacher teacher) throws SQLException {
        String sql = "UPDATE Teacher SET teacherName = ?, address = ?, gender = ?, phone = ?, email = ? WHERE teacherID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, teacher.getTeacherName());
            ps.setString(2, teacher.getAddress());
            ps.setString(3, teacher.getGender());
            ps.setString(4, teacher.getPhone());
            ps.setString(5, teacher.getEmail());
            ps.setString(6, teacher.getTeacherID());
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Lấy danh sách giáo viên
    public List<Teacher> getAllTeachers() throws SQLException {
        List<Teacher> teachers = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM Teacher";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Teacher teacher = new Teacher(
                    rs.getString("teacherID"),
                    rs.getString("teacherName"),
                    rs.getString("gender"),
                    rs.getString("address"),
                    rs.getString("phone"),
                    rs.getString("email")
                );
                teachers.add(teacher);
            }
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
        return teachers;
    }
}