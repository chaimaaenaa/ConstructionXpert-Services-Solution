package Model;

import java.sql.Date;

public class Project {
    private int pId;
    private String pName;
    private String pDescription;
    private Date pStartdate;
    private Date pEndDate;
    private double budget;



    public Project() {}

    public Project(int pId, String pName, String pDescription, Date pStartdate, Date pEndDate, double budget) {
        this.pId = pId;
        this.pName = pName;
        this.pDescription = pDescription;
        this.pStartdate = pStartdate;
        this.pEndDate = pEndDate;
        this.budget = budget;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public Date getpStartdate() {
        return pStartdate;
    }

    public void setpStartdate(Date pStartdate) {
        this.pStartdate = pStartdate;
    }

    public Date getpEndDate() {
        return pEndDate;
    }

    public void setpEndDate(Date pEndDate) {
        this.pEndDate = pEndDate;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    @Override
    public String toString() {
        return "Project{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pDescription='" + pDescription + '\'' +
                ", pStartdate=" + pStartdate +
                ", pEndDate=" + pEndDate +
                ", budget=" + budget +
                '}';
    }
}
