package com.klef.jfsd.springboot.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.klef.jfsd.springboot.model.Aadhar;

public interface AadharRepository extends JpaRepository<Aadhar, Integer> {
    Optional<Aadhar> findByAadharNo(String aadharNo);
}
