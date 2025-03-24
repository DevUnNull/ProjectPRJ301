
package models;

public class Semester {
    private String seId;
    private String seName;

    public Semester(String seId, String seName) {
        this.seId = seId;
        this.seName = seName;
    }

    public String getSeId() {
        return seId;
    }

    public void setSeId(String seId) {
        this.seId = seId;
    }

    public String getSeName() {
        return seName;
    }

    public void setSeName(String seName) {
        this.seName = seName;
    }
    
}
