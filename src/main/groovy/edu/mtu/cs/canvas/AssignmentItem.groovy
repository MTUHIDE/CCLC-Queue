package edu.mtu.cs.canvas

class AssignmentItem {
    private boolean isMostRecent
    private Date date
    private String group
    private String url
    private String name
    private Integer attempt
    private String status
    private Double points
    private Double possiblePoints
    private Double cumulativePoints
    private Double possibleCumulativePoints

    boolean getIsMostRecent() {
        return isMostRecent
    }

    void setIsMostRecent(boolean isMostRecent) {
        this.isMostRecent = isMostRecent
    }

    Date getDate() {
        return date
    }

    void setDate(Date date) {
        this.date = date
    }

    AssignmentItem(boolean isMostRecent, Date date, String group, String url, String name, Integer attempt, String status, Double points, Double possiblePoints, Double cumulativePoints, Double possibleCumulativePoints) {
        this.isMostRecent = isMostRecent
        this.date = date
        this.group = group
        this.url = url
        this.name = name
        this.attempt = attempt
        this.status = status
        this.points = points
        this.possiblePoints = possiblePoints
        this.cumulativePoints = cumulativePoints
        this.possibleCumulativePoints = possibleCumulativePoints
    }
}
