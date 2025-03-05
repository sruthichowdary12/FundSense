package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Analyst;
import com.klef.jfsd.springboot.repository.AnalystRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AnalystServiceImpl implements AnalystService {

    @Autowired
    private AnalystRepository analystRepository;

	@Override
	public Optional<Analyst> checkanalystLogin(String email, String password) {
        return analystRepository.checkanalystlogin(email, password);

	}
	 @Override
	    public void addAnalyst(Analyst analyst) {
	        analystRepository.save(analyst); // Save the analyst to the database
	    }
	@Override
	public List<Analyst> getAllAnalysts() {
		return analystRepository.findAll();
	}
	@Override
	public Optional<Analyst> getAnalystByEmail(String email) {
		return analystRepository.findById(email);
	}
	  @Override
	    public Analyst saveAnalyst(Analyst analyst) {
	        return analystRepository.save(analyst);
	    }

	    @Override
	    public void deleteAnalystByEmail(String email) {
	        analystRepository.deleteById(email);
	    }
		@Override
		public long getCountofanalysts() {
			// TODO Auto-generated method stub
			return analystRepository.count();
		}
	    

   

}
