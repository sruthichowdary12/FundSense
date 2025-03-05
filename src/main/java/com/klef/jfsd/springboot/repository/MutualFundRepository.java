package com.klef.jfsd.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.MutualFunds;

@Repository
public interface MutualFundRepository extends JpaRepository<MutualFunds, Integer> {
    // Additional query methods can be defined here if needed
	Optional<MutualFunds> findTopByOrderByNavDesc();
}
