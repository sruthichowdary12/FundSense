package com.klef.jfsd.springboot.model;


import java.math.BigDecimal;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "financial_advisor_table")
public class FinancialAdvisor {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "advisor_id")
    private int id;

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

	public int getExperienceYears() {
		return experienceYears;
	}

	public void setExperienceYears(int experienceYears) {
		this.experienceYears = experienceYears;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public BigDecimal getRating() {
		return rating;
	}

	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}

	public List<Investor> getClients() {
		return clients;
	}

	public void setClients(List<Investor> clients) {
		this.clients = clients;
	}

	@Column(name = "advisor_name", nullable = false, length = 50)
    private String name;

    @Column(name = "advisor_email", nullable = false, unique = true, length = 30)
    private String email;

    @Column(name = "advisor_password", nullable = false, length = 30)
    private String password;

    @Column(name = "advisor_contactno", nullable = false, unique = true, length = 15)
    private String contactNo;

    @Column(name = "experience_years", nullable = false)
    private int experienceYears;

    @Column(name = "specialization", length = 50)
    private String specialization;

    @Column(name = "advisor_rating", precision = 2, scale = 1)
    private BigDecimal rating;

    @OneToMany
    @JoinColumn(name = "advisor_id", referencedColumnName = "advisor_id")
    private List<Investor> clients;

  
}
