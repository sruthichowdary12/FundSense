package com.klef.jfsd.springboot.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.klef.jfsd.springboot.model.FinancialAdvisor;
import com.klef.jfsd.springboot.model.Investor;

public interface FinancialAdvisorRepository extends JpaRepository<FinancialAdvisor, Integer> {

    @Query("select f from FinancialAdvisor f where f.email=?1 and f.password=?2")
    Optional<FinancialAdvisor> checkadvisorlogin(String email, String password);
    @Query("SELECT i FROM Investor i WHERE i.financialAdvisor.id = :advisorId")
    List<Investor> findInvestorsByAdvisorId(@Param("advisorId") Integer advisorId);
    FinancialAdvisor findByEmail(String email);
	List<FinancialAdvisor> findByNameContainingIgnoreCase(String name);
	
}
