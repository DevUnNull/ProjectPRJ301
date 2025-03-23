package dal;

import dto.GradeJoin;
import dto.StuClaDepJoin;
import java.util.ArrayList;
import java.util.List;
import models.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO extends DBContext {

    public StudentDAO() {
        super();
    }

    //Lấy thông tin sinh viên by ID
    public Student getStudentById(String studentId) throws SQLException {
        Student student = null;
        String sql = "select StudentID,\n"
                + "StudentName, \n"
                + "Gender, \n"
                + "Address, \n"
                + "Phone, \n"
                + "Email from Student WHERE studentId = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, studentId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String id = rs.getString("studentID");
            String name = rs.getString("studentName");
            String gender = rs.getString("Gender");
            String addr = rs.getString("address");
            String phone = rs.getString("phone");//fix
            String email = rs.getString("email");
            student = new Student(id, name, gender, addr, phone, email, 0);
        }

        return student;
    }

    //Lấy thông tin lớp học
    public List<StuClaDepJoin> getClass(String studentId) throws SQLException {
        List<StuClaDepJoin> cla = new ArrayList<>();
        try {
            String sql = "select c.classID ,c.className, d.departmentName from Student s \n"
                    + "left join Class c on s.classID = c.classID\n"
                    + "left join Department d on c.departmentID = d.departmentID\n"
                    + "where s.studentID = ?";
            PreparedStatement po = connection.prepareStatement(sql);
            po.setString(1, studentId);
            ResultSet rs = po.executeQuery();
            while (rs.next()) {
                String classId = rs.getString("classId");
                String nameCl = rs.getString("className");
                String depName = rs.getString("departmentName");
                StuClaDepJoin c = new StuClaDepJoin(studentId, classId, nameCl, depName);
                cla.add(c);
            }
        } catch (Exception e) {
            throw new SQLException();
        }
        return cla;
    }

    //Show điểm
    public List<GradeJoin> getAllGrade(String stuId) {
        List<GradeJoin> list = new ArrayList<>();
        try {
            String sql = "select s.SubjectName, g.Factor1, g.Factor3, g.Factor6, g.TotalGrade from Grades g\n"
                    + "join Subject s on g.SubjectID = s.SubjectID\n"
                    + "where g.StudentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, stuId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String sname = rs.getString("SubjectName");
                float grade1 = rs.getFloat("Factor1");
                float grade2 = rs.getFloat("Factor3");
                float grade3 = rs.getFloat("Factor6");
                float total = rs.getFloat("TotalGrade");
                GradeJoin g = new GradeJoin(stuId, sname, grade1, grade2, grade3, total);
                list.add(g);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi để dễ debug
        }
        return list;
    }

}
