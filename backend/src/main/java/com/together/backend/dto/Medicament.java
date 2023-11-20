package com.together.backend.dto;

public class Medicament {

    private String id;
    private String name;
    private String comercialName;
    private String composition;
    private Boolean requireFormula;
    private String dosage;
    private String usage;
    private String pharmaceuticalLabs;

    public Medicament() {
    }

    public Medicament(String name, String comercialName, String composition, Boolean requireFormula, String dosage,
            String usage, String pharmaceuticalLabs) {
        this.name = name;
        this.comercialName = comercialName;
        this.composition = composition;
        this.requireFormula = requireFormula;
        this.dosage = dosage;
        this.usage = usage;
        this.pharmaceuticalLabs = pharmaceuticalLabs;
    }
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getComercialName() {
        return comercialName;
    }
    public void setComercialName(String comercialName) {
        this.comercialName = comercialName;
    }
    public String getComposition() {
        return composition;
    }
    public void setComposition(String composition) {
        this.composition = composition;
    }
    public Boolean getRequireFormula() {
        return requireFormula;
    }
    public void setRequireFormula(Boolean requireFormula) {
        this.requireFormula = requireFormula;
    }
    public String getDosage() {
        return dosage;
    }
    public void setDosage(String dosage) {
        this.dosage = dosage;
    }
    public String getUsage() {
        return usage;
    }
    public void setUsage(String usage) {
        this.usage = usage;
    }
    public String getPharmaceuticalLabs() {
        return pharmaceuticalLabs;
    }
    public void setPharmaceuticalLabs(String pharmaceuticalLabs) {
        this.pharmaceuticalLabs = pharmaceuticalLabs;
    }

    @Override
    public String toString() {
        return "Medicament [id=" + id + ", name=" + name + ", comercialName=" + comercialName + ", composition="
                + composition + ", requireFormula=" + requireFormula + ", dosage=" + dosage + ", usage=" + usage
                + ", pharmaceuticalLabs=" + pharmaceuticalLabs + "]";
    }

}
