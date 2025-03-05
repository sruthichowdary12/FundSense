package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import com.klef.jfsd.springboot.model.FinancialAdvisor;
import com.klef.jfsd.springboot.model.Investor;

public interface FinancialAdvisorService {
	void saveFinancialAdvisor(FinancialAdvisor financialAdvisor);
    Optional<FinancialAdvisor> checkadvisorlogin(String username, String password);
    Optional<FinancialAdvisor> getFinancialAdvisorById(Integer id);
    List<FinancialAdvisor> getAllFinancialAdvisors();  // Method to get all financial advisors
	void deleteFinancialAdvisorById(Integer id);
	
	List<FinancialAdvisor> findAll();
	Optional<FinancialAdvisor> findById(Integer advisorId);
	List<Investor> getInvestorsByAdvisorId(Integer advisorId);
	FinancialAdvisor findByEmail(String advisorEmail);
	List<FinancialAdvisor> searchByName(String searchName);
	   long getCountOfFinancialAdvisors();
	public void saveAll(List<FinancialAdvisor> advisors) ;

}

