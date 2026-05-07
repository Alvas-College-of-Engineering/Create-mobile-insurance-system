package com.insurance.model;

public class InsurancePlan {
    private String planId;
    private String planName;
    private double premium;
    private int durationMonths;
    private String coverage;

    public InsurancePlan(String planId, String planName, double premium, int durationMonths, String coverage) {
        this.planId = planId;
        this.planName = planName;
        this.premium = premium;
        this.durationMonths = durationMonths;
        this.coverage = coverage;
    }

    public String getPlanId()        { return planId; }
    public String getPlanName()      { return planName; }
    public double getPremium()       { return premium; }
    public int getDurationMonths()   { return durationMonths; }
    public String getCoverage()      { return coverage; }

    public String getPlanInfo() {
        return planName + " - ₹" + premium + " for " + durationMonths + " months";
    }
}
