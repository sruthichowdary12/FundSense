package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "like_table")
public class Like {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

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

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    private Date likedAt;

    // Automatically set likedAt timestamp
    @PrePersist
    protected void onLike() {
        this.likedAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Date getLikedAt() {
		return likedAt;
	}

	public void setLikedAt(Date likedAt) {
		this.likedAt = likedAt;
	}

 
}
