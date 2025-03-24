package dal;

import dto.GradeJoin;
import dto.StuClaDepJoin;
import dto.StudentClass;
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

    public List<Student> getAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT StudentID, StudentName, Gender, Address, Phone, Email FROM Student";
        
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Student student = new Student(
                    rs.getString("StudentID"),
                    rs.getString("StudentName"),
                    rs.getString("Gender"),
                    rs.getString("Address"),
                    rs.getString("Phone"),
                    rs.getString("Email"),
                    0 // Giả sử có một thuộc tính khác trong Student
                );
                students.add(student);
            }
        }
        return students;
    }
    //Lấy ra danh sách sinh của 1 lớp
    public List<StudentClass> getAllStudentByClassName(String className) {
        List<StudentClass> sc = new ArrayList<>();
        try {
            String sql = "select s.StudentID, s.StudentName, s.Gender, s.Address, s.Phone, s.Email from Student s\n"
                    + "join Class c on s.ClassID = c.ClassID\n"
                    + "where c.ClassName = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, className);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String stuId = rs.getString("StudentID");
                String stuName = rs.getString("StudentName");
                String stuGender = rs.getString("Gender");
                String stuAdd = rs.getString("Address");
                String stuPhone = rs.getString("Phone");
                String stuEmail = rs.getString("Email");
                StudentClass st = new StudentClass(className, stuEmail, stuName, stuGender, stuAdd, stuPhone, stuEmail);
                sc.add(st);
            }
        } catch (Exception e) {
        }
        return sc;
    }
}
