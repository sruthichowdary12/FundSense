package com.klef.jfsd.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.Analyst;

public interface AnalystRepository extends JpaRepository<Analyst, String> {
    // Additional query methods can be defined here if needed
	  @Query("select a from Analyst a where a.email=?1 and a.password=?2")
	    Optional<Analyst> checkanalystlogin(String email, String pwd);
}
