package com.klef.jfsd.springboot.service;

import java.util.List;
import com.klef.jfsd.springboot.model.MutualFunds;

public interface MutualFundService {
    MutualFunds createMutualFund(MutualFunds fund);
    MutualFunds updateMutualFund(MutualFunds fund);
    void deleteMutualFund(int fundId);
    MutualFunds getMutualFundById(int fundId);
    List<MutualFunds> getAllMutualFunds();
    long getCountOfMutualFunds();
    MutualFunds getBestFund();
}
