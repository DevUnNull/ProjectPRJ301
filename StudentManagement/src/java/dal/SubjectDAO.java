package dal;

import dto.SubjectJoin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SubjectDAO extends DBContext {

    public SubjectDAO() {
        super();
    }

    public SubjectJoin getInfoSubjectByName(String subName) {
        SubjectJoin sj = null;
        try {
            String sql = "select s.SubjectID, s.SubjectName, c.Credits, b.BranchName from Subject s \n"
                    + "join Credit c on s.CreditID = c.CreditID\n"
                    + "join Branch b on s.BranchID = b.BranchID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String sId = rs.getString("SubjectID");
                String sName = rs.getString("SubjectName");
                String sCredit = rs.getString("Credits");
                String sBranch = rs.getString("BranchName");
                sj = new SubjectJoin(sId, subName, sCredit, sBranch);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sj;
    }
}
