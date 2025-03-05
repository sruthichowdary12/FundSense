package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "post_table")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String content;
    

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    private Date createdAt;

    @ManyToOne
    @JoinColumn(name = "admin_id", referencedColumnName = "admin_username", nullable = true)
    private Admin admin;

    @ManyToOne
    @JoinColumn(name = "advisor_id", referencedColumnName = "advisor_id", nullable = true)
    private FinancialAdvisor financialAdvisor;

    @ManyToOne
    @JoinColumn(name = "analyst_id", referencedColumnName = "analyst_email", nullable = true)
    private Analyst analyst;

    @ManyToOne
    @JoinColumn(name = "investor_id", referencedColumnName = "investor_id", nullable = true)
    private Investor investor;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Like> likes;

    // Set createdAt to the current date/time on persist
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public FinancialAdvisor getFinancialAdvisor() {
		return financialAdvisor;
	}

	public void setFinancialAdvisor(FinancialAdvisor financialAdvisor) {
		this.financialAdvisor = financialAdvisor;
	}

	public Analyst getAnalyst() {
		return analyst;
	}

	public void setAnalyst(Analyst analyst) {
		this.analyst = analyst;
	}

	public Investor getInvestor() {
		return investor;
	}

	public void setInvestor(Investor investor) {
		this.investor = investor;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Like> getLikes() {
		return likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

    
	
}
