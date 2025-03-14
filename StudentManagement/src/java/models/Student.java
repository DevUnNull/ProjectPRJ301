package models;
public class Student {
    private int studentID;
    private String studentName;
    private String address;
    private long phone;
    private String email;
    private int classID;

    public Student() {
    }

    public Student(int studentID, String studentName, String address, long phone, String email, int classID) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.classID = classID;
    }

    // Getters and Setters
    public int getStudentId() { return studentID; }
    public void setStudentId(int studentID) { this.studentID = studentID; }
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public long getPhone() { return phone; }
    public void setPhone(long phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public int getClassID() { return classID; }
    public void setClassID(int classID) { this.classID = classID; }
}