package com.insurance.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class Policy {
    private String policyId;
    private MobileDevice device;
    private InsurancePlan plan;
    private LocalDate startDate;
    private LocalDate expiryDate;
    private static final DateTimeFormatter FMT = DateTimeFormatter.ofPattern("dd MMM yyyy");

    public Policy(String policyId, MobileDevice device, InsurancePlan plan) {
        this.policyId  = policyId;
        this.device    = device;
        this.plan      = plan;
        this.startDate = LocalDate.now();
        this.expiryDate = startDate.plusMonths(plan.getDurationMonths());
    }

    public String getPolicyId()   { return policyId; }
    public MobileDevice getDevice() { return device; }
    public InsurancePlan getPlan()  { return plan; }
    public String getStartDate()  { return startDate.format(FMT); }
    public String getExpiryDate() { return expiryDate.format(FMT); }

    public boolean isActive() {
        return !LocalDate.now().isAfter(expiryDate);
    }

    public long getDaysRemaining() {
        if (!isActive()) return 0;
        return ChronoUnit.DAYS.between(LocalDate.now(), expiryDate);
    }

    public int getProgressPercent() {
        long total = ChronoUnit.DAYS.between(startDate, expiryDate);
        long elapsed = ChronoUnit.DAYS.between(startDate, LocalDate.now());
        if (total == 0) return 100;
        int pct = (int) ((elapsed * 100) / total);
        return Math.min(pct, 100);
    }
}
