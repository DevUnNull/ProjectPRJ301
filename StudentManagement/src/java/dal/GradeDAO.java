package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Grades;

public class GradeDAO {
    private DBContext db;

    public GradeDAO() {
        db = new DBContext();
    }

    // Thêm điểm
    public void addGrade(Grades grade) throws SQLException {
        String sql = "INSERT INTO Grades (gradeID, factor1, factor3, factor6, totalGrade, teacherID, studentID, subjectID, creditID, branchID, semesterID, academicYearID) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, grade.getGradeID());
            ps.setFloat(2, grade.getFactor1());
            ps.setFloat(3, grade.getFactor3());
            ps.setFloat(4, grade.getFactor6());
            ps.setFloat(5, grade.getTotalGrade());
            ps.setString(6, grade.getTeacherID());
            ps.setInt(7, grade.getStudentID());
            ps.setString(8, grade.getSubjectID());
            ps.setString(9, grade.getCreditID());
            ps.setString(10, grade.getBranchID());
            ps.setString(11, grade.getSemesterID());
            ps.setString(12, grade.getAcademicYearID());
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Sửa điểm
    public void updateGrade(Grades grade) throws SQLException {
        String sql = "UPDATE Grades SET factor1 = ?, factor3 = ?, factor6 = ?, totalGrade = ?, teacherID = ?, studentID = ?, subjectID = ?, creditID = ?, branchID = ?, semesterID = ?, academicYearID = ? " +
                     "WHERE gradeID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setFloat(1, grade.getFactor1());
            ps.setFloat(2, grade.getFactor3());
            ps.setFloat(3, grade.getFactor6());
            ps.setFloat(4, grade.getTotalGrade());
            ps.setString(5, grade.getTeacherID());
            ps.setInt(6, grade.getStudentID());
            ps.setString(7, grade.getSubjectID());
            ps.setString(8, grade.getCreditID());
            ps.setString(9, grade.getBranchID());
            ps.setString(10, grade.getSemesterID());
            ps.setString(11, grade.getAcademicYearID());
            ps.setInt(12, grade.getGradeID());
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Xóa điểm (cho Admin)
    public void deleteGrade(int gradeID) throws SQLException {
        String sql = "DELETE FROM Grades WHERE gradeID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, gradeID);
            ps.executeUpdate();
        } finally {
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
    }

    // Lấy điểm của một sinh viên (cho Student hoặc Teacher)
    public List<Grades> getGradesByStudent(int studentID) throws SQLException {
        List<Grades> grades = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            String sql = "SELECT * FROM Grades WHERE studentID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, studentID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Grades grade = new Grades(
                    rs.getInt("gradeID"),
                    rs.getFloat("factor1"),
                    rs.getFloat("factor3"),
                    rs.getFloat("factor6"),
                    rs.getFloat("totalGrade"),
                    rs.getString("teacherID"),
                    rs.getInt("studentID"),
                    rs.getString("subjectID"),
                    rs.getString("creditID"),
                    rs.getString("branchID"),
                    rs.getString("semesterID"),
                    rs.getString("academicYearID")
                );
                grades.add(grade);
            }
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            db.closeConnection(conn);
        }
        return grades;
    }
}