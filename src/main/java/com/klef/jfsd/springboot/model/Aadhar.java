package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;

@Entity
@Table(name = "aadhar_table")
public class Aadhar {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "aadhar_id")
    private int id;

    @Column(name = "aadhar_number", nullable = false, unique = true, length = 12)
    private String aadharNo;

    @Column(name = "holder_name", nullable = false, length = 50)
    private String holderName;

    @Column(name = "dob", nullable = false)
    private String dob;

    @Column(name = "address", nullable = false)
    private String address;

    @OneToOne(mappedBy = "aadhar")
    private Investor investor;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getaadharNo() {
        return aadharNo;
    }

    public void setAadharNumber(String aadharNo) {
        this.aadharNo = aadharNo;
    }

    public String getHolderName() {
        return holderName;
    }

    public void setHolderName(String holderName) {
        this.holderName = holderName;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Investor getInvestor() {
        return investor;
    }

    public void setInvestor(Investor investor) {
        this.investor = investor;
    }
}
