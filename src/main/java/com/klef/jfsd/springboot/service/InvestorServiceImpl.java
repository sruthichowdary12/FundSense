package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Investor;
import com.klef.jfsd.springboot.repository.InvestorRepository;

@Service
public class InvestorServiceImpl implements InvestorService {

    @Autowired
    private InvestorRepository investorRepository;
 

    @Override
    public Optional<Investor> checkinvestorLogin(String email, String password) {
        return investorRepository.checkLogin(email, password);
    }

	@Override
	public void registerInvestor(Investor investor) {
		 investorRepository.save(investor); 
		
	}

	@Override
	public List<Investor> getAllInvestors() {
		 return investorRepository.findAll();
	}

	@Override
	public Optional<Investor> getInvestorById(Integer id) {
		return  investorRepository.findById(id);
	}

	@Override
	public void deleteInvestorById(Integer id) {
		investorRepository.deleteById(id);
		
	}

	@Override
	public void saveInvestor(Investor investor) {
		investorRepository.save(investor);
		
	}
	 @Override
	    public long getCountOfInvestors() {
	        return investorRepository.count();
	    }
	

}
