package com.klef.jfsd.springboot.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Analyst;
import com.klef.jfsd.springboot.model.MutualFunds;
import com.klef.jfsd.springboot.service.AnalystService;
import com.klef.jfsd.springboot.service.MutualFundService;

import jakarta.servlet.http.HttpServletRequest;
import io.swagger.v3.oas.annotations.Operation;

@Controller
public class AnalystController {

    @Autowired
    private AnalystService analystService;
    
    @Autowired
    private MutualFundService mutualFundService;

@Operation(summary = "analyst login ")
    @GetMapping("analystlogin")
    public ModelAndView analystLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("analystlogin"); // View for analyst login
        return mv;
    }
@Operation
@PostMapping("checkanalystlogin")
public ModelAndView checkAnalystLoginAndShowDashboard(HttpServletRequest request) {
    ModelAndView mv = new ModelAndView();

    String aUsername = request.getParameter("email");
    String aPassword = request.getParameter("password");
    Optional<Analyst> analystOpt = analystService.checkanalystLogin(aUsername, aPassword);

    // If the analyst is authenticated, proceed to show the dashboard
    if (analystOpt.isPresent()) {
        // Get the best mutual fund details
        MutualFunds bestFund = mutualFundService.getBestFund();

        // Add the best fund details to the model
        mv.addObject("bestFundName", bestFund.getFundName());
        mv.addObject("bestFundNav", bestFund.getNav());
        mv.addObject("bestFundAnnualReturn", bestFund.getAnnualReturn());
        mv.addObject("bestFundCategory", bestFund.getCategory());
        mv.addObject("bestFundDescription", bestFund.getDescription());
        mv.addObject("bestFundCost", bestFund.getCost());
        mv.addObject("bestFundUrl", bestFund.getUrl());

        // Redirect to the analyst dashboard
        mv.setViewName("analystDashboard");
    } else {
        // If login fails, redirect to the login failure page
        mv.setViewName("analystloginfail");
        mv.addObject("message", "Analyst Login Fail");
    }

    return mv;
}
}
