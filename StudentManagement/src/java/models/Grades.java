package models;
public class Grades {
    private int gradeID;
    private float factor1;
    private float factor3;
    private float factor6;
    private float totalGrade;
    private String teacherID;
    private int studentID;
    private String subjectID;
    private String creditID;
    private String branchID;
    private String semesterID;
    private String academicYearID;

    public Grades() {
    }

    public Grades(int gradeID, float factor1, float factor3, float factor6, float totalGrade, String teacherID, int studentID, String subjectID, String creditID, String branchID, String semesterID, String academicYearID) {
        this.gradeID = gradeID;
        this.factor1 = factor1;
        this.factor3 = factor3;
        this.factor6 = factor6;
        this.totalGrade = totalGrade;
        this.teacherID = teacherID;
        this.studentID = studentID;
        this.subjectID = subjectID;
        this.creditID = creditID;
        this.branchID = branchID;
        this.semesterID = semesterID;
        this.academicYearID = academicYearID;
    }

    // Getters and Setters
    public int getGradeID() { return gradeID; }
    public void setGradeID(int gradeID) { this.gradeID = gradeID; }
    public float getFactor1() { return factor1; }
    public void setFactor1(float factor1) { this.factor1 = factor1; }
    public float getFactor3() { return factor3; }
    public void setFactor3(float factor3) { this.factor3 = factor3; }
    public float getFactor6() { return factor6; }
    public void setFactor6(float factor6) { this.factor6 = factor6; }
    public float getTotalGrade() { return totalGrade; }
    public void setTotalGrade(float totalGrade) { this.totalGrade = totalGrade; }
    public String getTeacherID() { return teacherID; }
    public void setTeacherID(String teacherID) { this.teacherID = teacherID; }
    public int getStudentID() { return studentID; }
    public void setStudentID(int studentID) { this.studentID = studentID; }
    public String getSubjectID() { return subjectID; }
    public void setSubjectID(String subjectID) { this.subjectID = subjectID; }
    public String getCreditID() { return creditID; }
    public void setCreditID(String creditID) { this.creditID = creditID; }
    public String getBranchID() { return branchID; }
    public void setBranchID(String branchID) { this.branchID = branchID; }
    public String getSemesterID() { return semesterID; }
    public void setSemesterID(String semesterID) { this.semesterID = semesterID; }
    public String getAcademicYearID() { return academicYearID; }
    public void setAcademicYearID(String academicYearID) { this.academicYearID = academicYearID; }
}