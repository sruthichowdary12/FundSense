package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.MutualFunds;
import com.klef.jfsd.springboot.repository.MutualFundRepository;

@Service
public class MutualFundServiceImpl implements MutualFundService {

    @Autowired
    private MutualFundRepository mutualFundRepository;

    @Override
    public MutualFunds createMutualFund(MutualFunds fund) {
        return mutualFundRepository.save(fund);
    }

    @Override
    public MutualFunds updateMutualFund(MutualFunds fund) {
        return mutualFundRepository.save(fund);
    }

    @Override
    public void deleteMutualFund(int fundId) {
        mutualFundRepository.deleteById(fundId);
    }

    @Override
    public MutualFunds getMutualFundById(int fundId) {
        return mutualFundRepository.findById(fundId).orElse(null);
    }

    @Override
    public List<MutualFunds> getAllMutualFunds() {
        return mutualFundRepository.findAll();
    }
    @Override
    public long getCountOfMutualFunds() {
        return mutualFundRepository.count();
    }
    @Override
    public MutualFunds getBestFund() {
        // Fetch the mutual fund with the highest NAV
        Optional<MutualFunds> bestFund = mutualFundRepository.findTopByOrderByNavDesc();
        return bestFund.orElse(null);  // Return null if no fund found
    }
}
