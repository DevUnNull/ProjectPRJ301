
package dto;

public class StudentClass {
    private String className;
    private String studentID;
    private String studentName;
    private String gender;
    private String address;
    private String phone;
    private String email;

    public StudentClass(String className, String studentID, String studentName, String gender, String address, String phone, String email) {
        this.className = className;
        this.studentID = studentID;
        this.studentName = studentName;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
