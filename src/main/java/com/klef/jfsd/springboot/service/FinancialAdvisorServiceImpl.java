package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.FinancialAdvisor;
import com.klef.jfsd.springboot.model.Investor;
import com.klef.jfsd.springboot.repository.FinancialAdvisorRepository;

import jakarta.transaction.Transactional;

@Service
public class FinancialAdvisorServiceImpl implements FinancialAdvisorService {

    @Autowired
    private FinancialAdvisorRepository financialAdvisorRepository;
	@Override
		 public void saveFinancialAdvisor(FinancialAdvisor financialAdvisor) {
		        financialAdvisorRepository.save(financialAdvisor); // Save to the repository
		    }
	@Override
	public Optional<FinancialAdvisor> checkadvisorlogin(String username, String password) {
		  return financialAdvisorRepository.checkadvisorlogin(username, password);
    }
	@Override
	public Optional<FinancialAdvisor> getFinancialAdvisorById(Integer id) {
		return financialAdvisorRepository.findById(id);
	}
	@Override
	public List<FinancialAdvisor> getAllFinancialAdvisors() {
		 return financialAdvisorRepository.findAll();
	}
	@Override
	public void deleteFinancialAdvisorById(Integer id) {
		financialAdvisorRepository.deleteById(id);
		
	}
	@Override
	public List<FinancialAdvisor> findAll() {
		  return financialAdvisorRepository.findAll();
	}

	@Override
	public Optional<FinancialAdvisor> findById(Integer advisorId) {
		return financialAdvisorRepository.findById(advisorId);
	}
	@Override
	public List<Investor> getInvestorsByAdvisorId(Integer advisorId) {
        Optional<FinancialAdvisor> advisor = financialAdvisorRepository.findById(advisorId);
        return advisor.isPresent() ? advisor.get().getClients() : List.of();
    }
	@Override
	 public FinancialAdvisor findByEmail(String advisorEmail) {
	        return financialAdvisorRepository.findByEmail(advisorEmail);
	    }
	@Override
	public List<FinancialAdvisor> searchByName(String name) {
        return financialAdvisorRepository.findByNameContainingIgnoreCase(name);
    }

	@Transactional
    public void saveAll(List<FinancialAdvisor> advisors) {
        financialAdvisorRepository.saveAll(advisors);
    }
	 @Override
	    public long getCountOfFinancialAdvisors() {
	        return financialAdvisorRepository.count();
	    }


	}
		
	


