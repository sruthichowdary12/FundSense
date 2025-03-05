package com.klef.jfsd.springboot.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Aadhar;
import com.klef.jfsd.springboot.repository.AadharRepository;

@Service
public class AadharService {

    @Autowired
    private AadharRepository aadharRepository;

    // Method to check if an Aadhar number exists in the AadharRepository
    public Optional<Aadhar> findByAadharNo(String aadharNo) {
        return aadharRepository.findByAadharNo(aadharNo);
    }
}
