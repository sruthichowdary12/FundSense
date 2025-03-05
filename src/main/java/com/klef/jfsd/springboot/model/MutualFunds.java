package com.klef.jfsd.springboot.model;

import java.math.BigDecimal;
import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "mutual_funds")
public class MutualFunds {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Use AUTO or SEQUENCE depending on your database
    @Column(name = "fund_id", updatable = false, nullable = false)
    private int fundId;

    @Column(name = "fund_name", length = 100, nullable = false)
    private String fundName;

    @Column(name = "net_asset_value", nullable = false)
    private BigDecimal nav;

    @Column(name = "annual_return", nullable = false)
    private BigDecimal annualReturn;

    @Column(name = "fund_type", length = 50)
    private String fundType;

    @Column(name = "risk_level", length = 20)
    private int riskLevel;

    @Column(name = "fund_category", nullable = false, length = 100)
    private String category;

    @Column(name = "fund_desc", nullable = false, length = 500)
    private String description;

    @Column(name = "fund_cost", nullable = false)
    private double cost;

    @Column(name = "fund_url", length = 200, nullable = false)
    private String url;

    @Column(name = "fund_image", nullable = false)
    private Blob image;

    // Getters and Setters
    public int getFundId() {
        return fundId;
    }

    public void setFundId(int fundId) {
        this.fundId = fundId;
    }

    public String getFundName() {
        return fundName;
    }

    public void setFundName(String fundName) {
        this.fundName = fundName;
    }

    public BigDecimal getNav() {
        return nav;
    }

    public void setNav(BigDecimal nav) {
        this.nav = nav;
    }

    public BigDecimal getAnnualReturn() {
        return annualReturn;
    }

    public void setAnnualReturn(BigDecimal annualReturn) {
        this.annualReturn = annualReturn;
    }

    public String getFundType() {
        return fundType;
    }

    public void setFundType(String fundType) {
        this.fundType = fundType;
    }

    public int getRiskLevel() {
        return riskLevel;
    }

    public void setRiskLevel(int riskLevel) {
        this.riskLevel = riskLevel;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }
}