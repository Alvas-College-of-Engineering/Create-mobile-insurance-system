package com.insurance.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class PlanRegistry {
    private static final Map<String, InsurancePlan> PLANS = new LinkedHashMap<>();

    static {
        PLANS.put("BASIC",    new InsurancePlan("BASIC",    "Basic Shield",    4999,  6,  "Screen damage, liquid damage"));
        PLANS.put("STANDARD", new InsurancePlan("STANDARD", "Standard Guard", 8999,  12, "Screen, liquid, theft protection"));
        PLANS.put("PREMIUM",  new InsurancePlan("PREMIUM",  "Premium Armor",  14999, 24, "All risks + accidental damage + theft + extended warranty"));
    }

    public static Map<String, InsurancePlan> getAll() { return PLANS; }

    public static InsurancePlan getById(String id) { return PLANS.get(id); }
}
