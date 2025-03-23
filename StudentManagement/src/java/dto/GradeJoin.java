
package dto;

public class GradeJoin {
    private String stuId;
    private String subName;
    private float f1;
    private float f2;
    private float f3;
    private float totalGrade;

    public GradeJoin(String stuId, String subName, float f1, float f2, float f3, float totalGrade) {
        this.stuId = stuId;
        this.subName = subName;
        this.f1 = f1;
        this.f2 = f2;
        this.f3 = f3;
        this.totalGrade = totalGrade;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public float getF1() {
        return f1;
    }

    public void setF1(float f1) {
        this.f1 = f1;
    }

    public float getF2() {
        return f2;
    }

    public void setF2(float f2) {
        this.f2 = f2;
    }

    public float getF3() {
        return f3;
    }

    public void setF3(float f3) {
        this.f3 = f3;
    }

    public float getTotalGrade() {
        return totalGrade;
    }

    public void setTotalGrade(float totalGrade) {
        this.totalGrade = totalGrade;
    }
    
    
}
