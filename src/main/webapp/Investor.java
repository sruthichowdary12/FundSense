
package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "investor_table")
public class Investor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "investor_id")
    private int id;

    @Column(name = "investor_name", nullable = false, length = 50)
    private String name;

    @OneToOne
    @JoinColumn(name = "aadhar_id", referencedColumnName = "aadhar_id", nullable = false)
    private Aadhar aadhar;

    @Column(name = "investor_address", nullable = false)
    private String address;

    @Column(name = "investor_email", nullable = false, unique = true, length = 30)
    private String email;

    @Column(name = "investor_password", nullable = false, length = 30)
    private String password;

    @Column(name = "investor_contactno", nullable = false, unique = true, length = 15)
    private String contactNo;

    @Column(name = "investor_dob", nullable = false)
    private Date dob;

    @Column(name = "risk_profile", length = 20)
    private String riskProfile;

    @Column(name = "preferred_investment_type", length = 20)
    private String preferredInvestmentType;

    @Column(name = "annual_income", precision = 15, scale = 2)
    private BigDecimal annualIncome;

    @Column(name = "kyc_status", nullable = false, length = 20)
    private String kycStatus;

    @ManyToOne
    @JoinColumn(name = "advisor_id", referencedColumnName = "advisor_id")
    private FinancialAdvisor financialAdvisor;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Aadhar getAadhar() {
        return aadhar;
    }

    public void setAadhar(Aadhar aadhar) {
        this.aadhar = aadhar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getRiskProfile() {
        return riskProfile;
    }

    public void setRiskProfile(String riskProfile) {
        this.riskProfile = riskProfile;
    }

    public String getPreferredInvestmentType() {
        return preferredInvestmentType;
    }

    public void setPreferredInvestmentType(String preferredInvestmentType) {
        this.preferredInvestmentType = preferredInvestmentType;
    }

    public BigDecimal getAnnualIncome() {
        return annualIncome;
    }

    public void setAnnualIncome(BigDecimal annualIncome) {
        this.annualIncome = annualIncome;
    }

    public String getKycStatus() {
        return kycStatus;
    }

    public void setKycStatus(String kycStatus) {
        this.kycStatus = kycStatus;
    }
    public FinancialAdvisor getFinancialAdvisor() {
        return financialAdvisor;
    }

    public void setFinancialAdvisor(FinancialAdvisor financialAdvisor) {
        this.financialAdvisor = financialAdvisor;
    }
}
