package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "comment_table")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 500)  // Limit content to 500 characters
    private String content;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    private Date createdAt;

    @ManyToOne
    @JoinColumn(name = "post_id", nullable = false)
    private Post post;

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

    // Automatically set createdAt timestamp
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

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
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

    
}
