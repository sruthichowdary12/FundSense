package com.klef.jfsd.springboot.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Aadhar;
import com.klef.jfsd.springboot.model.FinancialAdvisor; // Import FinancialAdvisor model
import com.klef.jfsd.springboot.model.Investor;
import com.klef.jfsd.springboot.model.MutualFunds;
import com.klef.jfsd.springboot.service.AadharService;
import com.klef.jfsd.springboot.service.InvestorService;
import com.klef.jfsd.springboot.service.MailService;
import com.klef.jfsd.springboot.service.MutualFundService;
import com.klef.jfsd.springboot.service.FinancialAdvisorService; // Import FinancialAdvisorService

import jakarta.servlet.http.HttpServletRequest;
import io.swagger.v3.oas.annotations.Operation;

@Controller
public class InvestorController {

    @Autowired
    private InvestorService investorService;

    @Autowired
    private AadharService aadharService;

    @Autowired
    private MailService mailService;
    
    @Autowired
    private MutualFundService mutualfundService;

    @Autowired
    private FinancialAdvisorService financialAdvisorService; // Service for financial advisors
@Operation
@GetMapping("/register")
public String showRegisterInvestorPage(Model model) {
	List<FinancialAdvisor> advisors = financialAdvisorService.getAllFinancialAdvisors();
	System.out.println("Advisors: " + advisors);
	model.addAttribute("advisors", advisors);
return "register";
}

@Operation
    @PostMapping("/register")
    public String registerInvestor(
            @RequestParam String name,
            @RequestParam String aadhaarId,
            @RequestParam String address,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String contactNo,
            @RequestParam Date dob,
            @RequestParam(required = false) String riskProfile,
            @RequestParam(required = false) String preferredInvestmentType,
            @RequestParam(required = false) BigDecimal annualIncome,
            @RequestParam String kycStatus,
            @RequestParam(required = false) Integer advisorId, // Use Integer for advisor ID
            Model model) {
        
        Optional<Aadhar> aadhar = aadharService.findByAadharNo(aadhaarId);
        if (aadhar.isEmpty()) {
            model.addAttribute("message", "Aadhaar ID is not valid or does not exist.");
            return "investornotfound"; // Return to the registration page if Aadhaar is invalid
        }

        // Optional: Find the financial advisor by ID if provided
        Optional<FinancialAdvisor> advisor = advisorId != null ? financialAdvisorService.findById(advisorId) : Optional.empty();

        // Create and save Investor
        Investor investor = new Investor();
        investor.setName(name);
        investor.setAadhar(aadhar.get());
        investor.setAddress(address);
        investor.setEmail(email);
        investor.setPassword(password);
        investor.setContactNo(contactNo);
        investor.setDob(dob);
        investor.setRiskProfile(riskProfile);
        investor.setPreferredInvestmentType(preferredInvestmentType);
        investor.setAnnualIncome(annualIncome);
        investor.setKycStatus(kycStatus);

        // Link to the financial advisor if present
        advisor.ifPresent(investor::setFinancialAdvisor);
        
        investorService.registerInvestor(investor);

        // Send Welcome Email
        String subject = "Welcome to the Fundsense Platform!";
        String message = "Dear " + name + ",\n\n" +
                         "Thank you for registering on our platform! We’re thrilled to have you onboard.\n" +
                         "You can now log in and explore investment options suited to your profile.\n\n" +
                         "Best regards,\nThe Fundsense Team";
        mailService.sendWelcomeEmail(email, subject, message);
        
        model.addAttribute("message", "Registration successful! Welcome, " + name + ".");
        return "investorlogin"; 
    }
	@Operation
    @PostMapping("/checkInvestorLogin")
    public ModelAndView checkInvestorLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        // Retrieve email and password from request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate credentials
        Optional<Investor> investor = investorService.checkinvestorLogin(email, password);
        if (investor.isPresent()) {
            mv.setViewName("investorDashboard");
            mv.addObject("investor", investor.get());
            FinancialAdvisor advisor = investor.get().getFinancialAdvisor();
            if (advisor != null) {
                mv.addObject("advisor", advisor);
            } else {
                mv.addObject("advisorMessage", "No financial advisor assigned.");
            }
       
        } else {
            mv.setViewName("loginFailed"); 
            mv.addObject("message", "Invalid email or password. Please try again.");
        }
        return mv;
    }
	
	
@Operation
    @GetMapping("/investorlogin")
    public ModelAndView login() {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("investorlogin");
       return mv;
    }

@GetMapping("/logout")
public String logout(HttpServletRequest request) {

    return "redirect:/selectrole";
}

@GetMapping("/viewmf")
	 public String listMutualFunds(Model model) {
	        List<MutualFunds> funds = mutualfundService.getAllMutualFunds();
	        model.addAttribute("funds", funds);
	        return "viewMutualFundFromInvestor";
	    }
@GetMapping("/investorDashboard")
public ModelAndView investorDashboard() {
	
   ModelAndView mv = new ModelAndView();
   mv.setViewName("investorDashboard");
   
   return mv;
}
	 
}
