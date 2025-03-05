package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Investor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface InvestorRepository extends JpaRepository<Investor, Integer> {

    @Query("select i from Investor i where i.email=?1 and i.password=?2")
    Optional<Investor> checkLogin(String email, String password);
}
