package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Investor;

import java.util.List;
import java.util.Optional;

public interface InvestorService {
    Optional<Investor> checkinvestorLogin(String email, String password);
    public void registerInvestor(Investor investor);
	List<Investor> getAllInvestors();
	Optional<Investor> getInvestorById(Integer id);
	void deleteInvestorById(Integer id);
	void saveInvestor(Investor investor);
	  long getCountOfInvestors();
  
}
