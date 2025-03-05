package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Analyst;

import java.util.List;
import java.util.Optional;

public interface AnalystService {
    Optional<Analyst> checkanalystLogin(String email, String password);
    void addAnalyst(Analyst analyst);
	List<Analyst> getAllAnalysts();
	Optional<Analyst> getAnalystByEmail(String email);
	 Analyst saveAnalyst(Analyst analyst);
	   void deleteAnalystByEmail(String email);
	   long getCountofanalysts();

}
