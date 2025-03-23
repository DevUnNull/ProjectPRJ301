
package dto;

public class StuClaDepJoin {
    private String StudentId;
    private String claId;
    private String claName;
    private String depName;

    public StuClaDepJoin(String StudentId, String claId, String claName, String depName) {
        this.StudentId = StudentId;
        this.claId = claId;
        this.claName = claName;
        this.depName = depName;
    }

    public String getStudentId() {
        return StudentId;
    }

    public void setStudentId(String StudentId) {
        this.StudentId = StudentId;
    }

    public String getClaId() {
        return claId;
    }

    public void setClaId(String claId) {
        this.claId = claId;
    }

    public String getClaName() {
        return claName;
    }

    public void setClaName(String claName) {
        this.claName = claName;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    
}
