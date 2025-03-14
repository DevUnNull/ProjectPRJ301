/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Teacher {
    private String teacherID;
    private String teacherName;
    private String address;
    private long phone;
    private String email;

    public Teacher() {
    }

    public Teacher(String teacherID, String teacherName, String address, long phone, String email) {
        this.teacherID = teacherID;
        this.teacherName = teacherName;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    // Getters and Setters
    public String getTeacherID() { return teacherID; }
    public void setTeacherID(String teacherID) { this.teacherID = teacherID; }
    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public long getPhone() { return phone; }
    public void setPhone(long phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
