/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Student;

public class StudentDAO {
    private DBContext db;

    public StudentDAO() {
        db = new DBContext();
    }

    // Thêm học sinh
    public void addStudent(Student student) throws SQLException {
        String sql = "INSERT INTO Student (studentID, studentName, address, phone, email, classID) VALUES (?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, student.getStudentId());
            ps.setString(2, student.getStudentName());
            ps.setString(3, student.getAddress());
            ps.setLong(4, student.getPhone());
            ps.setString(5, student.getEmail());
            ps.setInt(6, student.getClassID());
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Xóa học sinh
    public void deleteStudent(int studentID) throws SQLException {
        String sql = "DELETE FROM Student WHERE studentID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, studentID);
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Sửa học sinh
    public void updateStudent(Student student) throws SQLException {
        String sql = "UPDATE Student SET studentName = ?, address = ?, phone = ?, email = ?, classID = ? WHERE studentID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, student.getStudentName());
            ps.setString(2, student.getAddress());
            ps.setLong(3, student.getPhone());
            ps.setString(4, student.getEmail());
            ps.setInt(5, student.getClassID());
            ps.setInt(6, student.getStudentId());
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Lấy danh sách học sinh
    public List<Student> getAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM Student";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Student student = new Student(
                    rs.getInt("studentID"),
                    rs.getString("studentName"),
                    rs.getString("address"),
                    rs.getLong("phone"),
                    rs.getString("email"),
                    rs.getInt("classID")
                );
                students.add(student);
            }
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
        return students;
    }
}
