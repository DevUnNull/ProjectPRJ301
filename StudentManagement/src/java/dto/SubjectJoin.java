package dto;

public class SubjectJoin {
    private String subId;
    private String subName;
    private String creditName;
    private String branchName;

    public SubjectJoin(String subId, String subName, String creditName, String branchName) {
        this.subId = subId;
        this.subName = subName;
        this.creditName = creditName;
        this.branchName = branchName;
    }

    public String getSubId() {
        return subId;
    }

    public void setSubId(String subId) {
        this.subId = subId;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public String getCreditName() {
        return creditName;
    }

    public void setCreditName(String creditName) {
        this.creditName = creditName;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }
    
}
