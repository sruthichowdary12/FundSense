package com.klef.jfsd.springboot.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import io.swagger.v3.oas.annotations.OpenAPI31;
import io.swagger.v3.oas.annotations.Operation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.FinancialAdvisor;
import com.klef.jfsd.springboot.model.Investor;
import com.klef.jfsd.springboot.service.FinancialAdvisorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FinancialAdvisorController {

    @Autowired
    private FinancialAdvisorService financialAdvisorService;
  

    @Operation
    @PostMapping("/registerFinancialAdvisor")
    public ModelAndView registerFinancialAdvisor(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNo = request.getParameter("contactNo");
        int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
        String specialization = request.getParameter("specialization");
        BigDecimal rating = BigDecimal.valueOf(Double.parseDouble(request.getParameter("rating")));
        
        FinancialAdvisor advisor = new FinancialAdvisor();
        advisor.setName(name);
        advisor.setEmail(email);
        advisor.setPassword(password);
        advisor.setContactNo(contactNo);
        advisor.setExperienceYears(experienceYears);
        advisor.setSpecialization(specialization);
        advisor.setRating(rating);
        financialAdvisorService.saveFinancialAdvisor(advisor);

        mv.setViewName("registrationSuccess");
        mv.addObject("message", "Registration successful. Welcome, Financial Advisor!");
        return mv;
    }
   

   
    // Show Financial Advisor Login Page
    @Operation
    @GetMapping("/advisorlogin")
    public ModelAndView advisorLogin() {
        return new ModelAndView("advisorlogin"); // Returns the login page for financial advisors
    }
    @Operation
    @PostMapping("/checkadvisorlogin")
    public ModelAndView checkadvisorlogin(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        session.setAttribute("loggedInAdvisorEmail", email);
        Optional<FinancialAdvisor> advisor = financialAdvisorService.checkadvisorlogin(email, password);

        if (advisor.isPresent()) {
             List<Investor> mappedInvestors = financialAdvisorService.getInvestorsByAdvisorId(advisor.get().getId());
            mv.setViewName("advisorDashboard"); // Redirect to advisor dashboard on successful login
           mv.addObject("advisor", advisor.get());
        mv.addObject("mappedInvestors", mappedInvestors); 
        } else {
            mv.setViewName("advisorloginfail"); // Redirect to login failure page
            mv.addObject("message", "Login failed. Please check your credentials.");
        }
        return mv;
    }
    @Operation
    @PostMapping("/submitQuiz")
    public ModelAndView submitQuiz(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        
        // Retrieve answers from the quiz form
        String q1 = request.getParameter("q1");
        String q2 = request.getParameter("q2");
        String q3 = request.getParameter("q3");
        String q4 = request.getParameter("q4");
        String q5 = request.getParameter("q5");
        
        // Correct answers
        int correctAnswers = 0;
        if ("C".equals(q1)) correctAnswers++;
        if ("B".equals(q2)) correctAnswers++;
        if ("B".equals(q3)) correctAnswers++;
        if ("C".equals(q4)) correctAnswers++;
        if ("D".equals(q5)) correctAnswers++;

        // Check if all answers are correct
        if (correctAnswers == 5) {
            mv.setViewName("financialAdvisorSignup"); // Redirect to signup page
            mv.addObject("message", "Congratulations! You can now become a financial advisor.");
            
        } else {
            mv.setViewName("index"); // Redirect to index page
            mv.addObject("message", "Oops! You can learn and try again.");
        }
        

        return mv;
    }
    
    
    @Operation
    @GetMapping("/viewInvestors/{advisorId}")
    public String viewInvestors(@PathVariable Integer advisorId, Model model) {
        List<Investor> investors = financialAdvisorService.getInvestorsByAdvisorId(advisorId);
        model.addAttribute("investors", investors);
        return "viewInvestors"; 
    }
    @OpenAPI31
    @GetMapping("/advisorlogout")
    public ModelAndView adminlogout() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("advisorlogin");
        return mv;
    }

    
    @GetMapping("/selectrole")
    public ModelAndView selectrole() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("selectrole");
        return mv;
    }
 
    
}


   

