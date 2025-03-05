package com.klef.jfsd.springboot.controller;

import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.ArrayList;
// import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Analyst;
import com.klef.jfsd.springboot.model.FinancialAdvisor;
import com.klef.jfsd.springboot.model.Investor;
//import com.klef.jfsd.springboot.model.MutualFund;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.AnalystService;
import com.klef.jfsd.springboot.service.EmailService;
import com.klef.jfsd.springboot.service.FinancialAdvisorService;
import com.klef.jfsd.springboot.service.InvestorService;
import com.klef.jfsd.springboot.service.MailService;
import com.klef.jfsd.springboot.service.MutualFundService;
//import com.klef.jfsd.springboot.service.MutualFundService;
import com.opencsv.CSVReader;

import io.swagger.v3.oas.annotations.Operation;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	  @Autowired
	   private MutualFundService mutualFundService;

	
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private InvestorService investorService;

    @Autowired
    private FinancialAdvisorService financialAdvisorService;
    
    @Autowired
    private AnalystService analystService;

    @Autowired
    private EmailService emailService; // Inject EmailService

    @Autowired
    private MailService mailService;

   
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("index");
        return mv;
    }
    @GetMapping("/blogs")
    public ModelAndView blogs() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("blogs");
        return mv;
    }
   
    @GetMapping("/all")
    public ModelAndView all() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("all");
        return mv;
    }
    @GetMapping("/toppicks")
    public ModelAndView toppicks() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("toppicks");
        return mv;
    }
    @GetMapping("/fundframeworks")
    public ModelAndView fundframeworks() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fundframeworks");
        return mv;
    }
    @GetMapping("/markettrends")
    public ModelAndView markettrends() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("markettrends");
        return mv;
    }
    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("index");
        return mv;
    }
   
    @GetMapping("report")
    public ModelAndView report() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("report");
        return mv;
    }
   
    @Operation
    @GetMapping("/searchAdvisors")
    public String searchAdvisors(@RequestParam("searchName") String searchName, Model model) {
        List<FinancialAdvisor> advisors = financialAdvisorService.searchByName(searchName);
        model.addAttribute("advisors", advisors);
        model.addAttribute("searchName", searchName); // To keep search term in the input field
        return "viewAllFinancialAdvisors";  // Name of the JSP file to display results
    }
    
    @Operation
    @GetMapping("/admindashboard")
    public String adminDashboard(Model model) {
        // Fetch counts from the services
        long advisorCount = financialAdvisorService.getCountOfFinancialAdvisors();
        long investorCount = investorService.getCountOfInvestors();
        long fundCount = mutualFundService.getCountOfMutualFunds();
        long analystCount = analystService.getCountofanalysts();
        

        // Add counts to the model
        model.addAttribute("advisorCount", advisorCount);
        model.addAttribute("investorCount", investorCount);
        System.out.println("Advisor Count: " + advisorCount);
        model.addAttribute("analystCount", analystCount);
        model.addAttribute("fundCount", fundCount);
       

        return "admindashboard"; 
    }
    
    
    @Operation
    @GetMapping("/adminlogin")
    public ModelAndView adminlogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminlogin"); 
        return mv;
    }
    @Operation(summary = "Admin Login Check", description = "Validates admin credentials and sets up session")
    @PostMapping("/checkadminlogin")
    public ModelAndView checkadminlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();

        try {
            // Retrieve input parameters
            String auname = request.getParameter("auname");
            String apwd = request.getParameter("apwd");

            // Validate input parameters
            if (auname == null || apwd == null || auname.trim().isEmpty() || apwd.trim().isEmpty()) {
                mv.setViewName("adminloginfail");
                mv.addObject("message", "Username and password are required");
                return mv;
            }

            // Check admin credentials using the service
            Optional<Admin> adminOpt = adminService.checkAdminLogin(auname, apwd);

            if (adminOpt.isPresent()) {
                Admin admin = adminOpt.get();

                // Set session attributes
                session.setAttribute("admin", admin);  // Storing Admin object in session
                session.setAttribute("adminUsername", auname);  // Storing admin username

                // Set session timeout (30 minutes)

                // Fetch statistics
                long advisorCount = financialAdvisorService.getCountOfFinancialAdvisors();
                long investorCount = investorService.getCountOfInvestors();
                long fundCount = mutualFundService.getCountOfMutualFunds();
                long analystCount = analystService.getCountofanalysts();

                // Add statistics to the model
                mv.addObject("advisorCount", advisorCount);
                mv.addObject("investorCount", investorCount);
                mv.addObject("fundCount", fundCount);
                mv.addObject("analystCount", analystCount);

                // Set success view
                mv.setViewName("admindashboard");
                mv.addObject("message", "Welcome " + auname);

                // Optional: Log successful login for debugging or analytics
                // log.info("Admin login successful: " + auname);

            } else {
                mv.setViewName("adminloginfail");
                mv.addObject("message", "Invalid username or password");
            }

        } catch (Exception e) {
            // Log the exception for better debugging
            // log.error("Error during admin login", e);

            mv.setViewName("adminloginfail");
            mv.addObject("message", "An error occurred during login. Please try again.");
        }

        return mv;
    }
    
    
    @Operation(summary = "adding financial advisor")
    @GetMapping("/addFinancialAdvisor")
    public ModelAndView showAddFinancialAdvisorForm() {
        ModelAndView mv = new ModelAndView("addFinancialAdvisor"); // View for adding advisor
        return mv;
    }
    
    @Operation
    @PostMapping("/saveFinancialAdvisor")
    public ModelAndView saveFinancialAdvisor(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        try {
            // Retrieve Financial Advisor details from the form
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contactNo = request.getParameter("contactNo");
            String experienceYearsStr = request.getParameter("experienceYears"); // New field
            String specialization = request.getParameter("specialization"); // New field
            String ratingStr = request.getParameter("rating"); // New field

            // Validate the fields
            if (name == null || email == null || password == null || contactNo == null || 
                experienceYearsStr == null || specialization == null || ratingStr == null ||
                name.isEmpty() || email.isEmpty() || password.isEmpty() || contactNo.isEmpty() || 
                experienceYearsStr.isEmpty() || specialization.isEmpty() || ratingStr.isEmpty()) {
                
                mv.setViewName("addFinancialAdvisor"); // Return to the add form
                mv.addObject("message", "Error: All fields are required.");
                return mv;
            }

            // Parse the numeric fields
            int experienceYears = Integer.parseInt(experienceYearsStr); // Parse to int
            BigDecimal rating = BigDecimal.valueOf(Double.parseDouble(ratingStr)); // Parse to BigDecimal

            // Create and set properties for FinancialAdvisor object
            FinancialAdvisor advisor = new FinancialAdvisor();
            advisor.setName(name);
            advisor.setEmail(email);
            advisor.setPassword(password);
            advisor.setContactNo(contactNo);
            advisor.setExperienceYears(experienceYears);
            advisor.setSpecialization(specialization);
            advisor.setRating(rating);

            // Attempt to save the Financial Advisor to the database
            financialAdvisorService.saveFinancialAdvisor(advisor);

            // Send email to the financial advisor with their credentials
            emailService.sendCredentials(email, name, password);

            mv.setViewName("financialDashboard"); // Redirect to admin home after saving
            mv.addObject("message", "Financial Advisor added successfully and email sent!");
        } catch (NumberFormatException e) {
            mv.setViewName("addFinancialAdvisor"); // Return to the add form
            mv.addObject("message", "Error: Please ensure all fields are filled in correctly.");
        } catch (DataIntegrityViolationException e) {
            mv.setViewName("addFinancialAdvisor"); // Return to the add form
            mv.addObject("message", "Error: " + e.getMostSpecificCause().getMessage());
        }

        return mv;
    }

    

    @Operation(summary = "Log out admin user")
    @GetMapping("/adminlogout")
    public ModelAndView adminlogout(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        session.invalidate(); 
        mv.setViewName("adminlogin");
        return mv;
    }
    @Operation(summary = "View all financial advisors")
   
    @GetMapping("/viewAllFinancialAdvisors")
    public ModelAndView viewAllFinancialAdvisors() {
        ModelAndView mv = new ModelAndView("viewAllFinancialAdvisors");
        List<FinancialAdvisor> advisors = financialAdvisorService.getAllFinancialAdvisors(); // Fetch all advisors
        mv.addObject("advisors", advisors); // Add the list to the model
        return mv;
    } @Operation(summary = "View all financial advisors by id")
    @GetMapping("/viewFinancialAdvisor/{id}")
    public ModelAndView viewFinancialAdvisor(@PathVariable Integer id) {
        ModelAndView mv = new ModelAndView("viewFinancialAdvisorByID");
        Optional<FinancialAdvisor> advisorOpt = financialAdvisorService.getFinancialAdvisorById(id);
        
        if (advisorOpt.isPresent()) {
            mv.addObject("advisor", advisorOpt.get()); // Add the advisor to the model
        } else {
            mv.addObject("advisor", null); // If not found, set advisor to null
        }
        
        return mv;
    }
    @Operation
    @GetMapping("/updateFinancialAdvisor/{id}")
    public ModelAndView showUpdateFinancialAdvisorForm(@PathVariable Integer id) {
        ModelAndView mv = new ModelAndView("updateFinancialAdvisor");
        Optional<FinancialAdvisor> advisorOpt = financialAdvisorService.getFinancialAdvisorById(id);
        
        if (advisorOpt.isPresent()) {
            mv.addObject("advisor", advisorOpt.get()); // Add the advisor to the model
        } else {
            mv.addObject("advisor", null); // If not found, set advisor to null
        }
        
        return mv;
    }
    @Operation

    // Method to save the updated financial advisor details
    @PostMapping("/saveUpdatedFinancialAdvisor")
    public ModelAndView saveUpdatedFinancialAdvisor(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        try {
            // Retrieve Financial Advisor details from the form
            Integer id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String contactNo = request.getParameter("contactNo");
            int experienceYears = Integer.parseInt(request.getParameter("experienceYears"));
            String specialization = request.getParameter("specialization");
            BigDecimal rating = BigDecimal.valueOf(Double.parseDouble(request.getParameter("rating")));

            Optional<FinancialAdvisor> advisorOpt = financialAdvisorService.getFinancialAdvisorById(id);
            if (advisorOpt.isPresent()) {
                FinancialAdvisor advisor = advisorOpt.get();
                advisor.setName(name);
                advisor.setEmail(email);
                advisor.setContactNo(contactNo);
                advisor.setExperienceYears(experienceYears);
                advisor.setSpecialization(specialization);
                advisor.setRating(rating);

                // Save the updated advisor
                financialAdvisorService.saveFinancialAdvisor(advisor);
                mv.setViewName("admindashboard");
                mv.addObject("message", "Financial Advisor updated successfully!");
            } else {
                mv.setViewName("updateFinancialAdvisor");
                mv.addObject("message", "Error: Advisor not found.");
            }
        } catch (NumberFormatException e) {
            mv.setViewName("updateFinancialAdvisor");
            mv.addObject("message", "Error: Please ensure all fields are filled in correctly.");
        }

        return mv;
    }
 // Method to delete a financial advisor by ID
    @Operation
    @GetMapping("/deleteFinancialAdvisor/{id}")
    public ModelAndView deleteFinancialAdvisor(@PathVariable Integer id) {
        ModelAndView mv = new ModelAndView("admindashboard");

        try {
            financialAdvisorService.deleteFinancialAdvisorById(id);
            mv.addObject("message", "Financial Advisor deleted successfully!");
        } catch (Exception e) {
            mv.addObject("message", "Error: Unable to delete financial advisor. " + e.getMessage());
        }

        return mv;
    }
    @Operation
    // Show the form to add a new analyst
    @GetMapping("/admin/addAnalystForm")
    public String showAddAnalystForm(Model model) {
        return "addAnalyst"; // Returns the JSP page for adding an analyst
    }

    // Handle the submission of the new analyst form
    @Operation
    @PostMapping("/admin/addAnalyst")
    public ModelAndView addAnalyst(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Analyst analyst = new Analyst();
        analyst.setEmail(email);
        analyst.setPassword(password); // Consider hashing the password here

        analystService.addAnalyst(analyst); // Call service to save the analyst

        // Send email with the analyst's password
        String subject = "Your Analyst Account Password";
        String text = "Hello,\n\nYour analyst account has been created successfully. Here are your login details:\n\n" +
                      "Email: " + email + "\nPassword: " + password + "\n\nThank you!";
        mailService.sendWelcomeEmail(email, subject, text); // Sending email

        mv.setViewName("addAnalyst");
        mv.addObject("message", "Analyst added successfully! Password sent to their email.");
        return mv;
    }
    @Operation
    @GetMapping("/viewAllAnalysts")
    public ModelAndView viewAllAnalysts() {
        ModelAndView mv = new ModelAndView("viewAllAnalysts");
        List<Analyst> analysts = analystService.getAllAnalysts(); // Fetch all analysts
        mv.addObject("analysts", analysts); // Add the list to the model
        return mv;
    }
   
    // View analyst by email
    @Operation
    @GetMapping("/viewAnalystByID/{email}")
    public ModelAndView viewAnalystByEmail(@PathVariable String email) {
        ModelAndView mv = new ModelAndView("viewAnalystByID");
        Optional<Analyst> analystOpt = analystService.getAnalystByEmail(email);
        
        if (analystOpt.isPresent()) {
            mv.addObject("analyst", analystOpt.get());
        } else {
            mv.addObject("message", "Analyst not found.");
        }
        
        return mv;
    }
    @Operation
    @GetMapping("/updateAnalyst/{email}")
    public ModelAndView showUpdateAnalystForm(@PathVariable String email) {
        ModelAndView mv = new ModelAndView("updateAnalyst");
        Optional<Analyst> analystOpt = analystService.getAnalystByEmail(email);
        
        if (analystOpt.isPresent()) {
            mv.addObject("analyst", analystOpt.get());
        } else {
            mv.addObject("message", "Analyst not found.");
        }
        
        return mv;
    }
    @Operation
    @PostMapping("/saveUpdatedAnalyst")
    public ModelAndView saveUpdatedAnalyst(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Optional<Analyst> analystOpt = analystService.getAnalystByEmail(email);
        
        if (analystOpt.isPresent()) {
            Analyst analyst = analystOpt.get();
            analyst.setPassword(password); // Update the password
            
            analystService.saveAnalyst(analyst); // Save updated analyst
            mv.setViewName("admindashboard");
            mv.addObject("message", "Analyst updated successfully!");
        } else {
            mv.setViewName("updateAnalyst");
            mv.addObject("message", "Error: Analyst not found.");
        }

        return mv;
    }
    @Operation
    @GetMapping("/deleteAnalyst/{email}")
    public ModelAndView deleteAnalyst(@PathVariable String email) {
        ModelAndView mv = new ModelAndView("admindashboard");

        try {
            analystService.deleteAnalystByEmail(email);
            mv.addObject("message", "Analyst deleted successfully!");
        } catch (Exception e) {
            mv.addObject("message", "Error: Unable to delete analyst. " + e.getMessage());
        }

        return mv;
    }
    @Operation
    @GetMapping("/viewAllInvestors")
    public ModelAndView viewAllInvestors() {
        ModelAndView mv = new ModelAndView("viewAllInvestors");
        List<Investor> investors = investorService.getAllInvestors(); // Fetch all investors
        mv.addObject("investors", investors); // Add the list to the model
        return mv;
    }
    @Operation
    @GetMapping("/viewInvestor/{id}")
    public ModelAndView viewInvestor(@PathVariable Integer id) {
        ModelAndView mv = new ModelAndView("viewInvestorByID");
        Optional<Investor> investorOpt = investorService.getInvestorById(id);
        
        if (investorOpt.isPresent()) {
            mv.addObject("investor", investorOpt.get());
        } else {
            mv.addObject("message", "Investor not found.");
        }
        
        return mv;
    }
    @Operation
    @GetMapping("/updateInvestor/{id}")
    public ModelAndView showUpdateInvestorForm(@PathVariable Integer id) {
        ModelAndView mv = new ModelAndView("updateInvestor");
        Optional<Investor> investorOpt = investorService.getInvestorById(id);
        
        if (investorOpt.isPresent()) {
            mv.addObject("investor", investorOpt.get());
        } else {
            mv.addObject("message", "Investor not found.");
        }
        
        return mv;
    }
    @Operation
    @PostMapping("/saveUpdatedInvestor")
    public ModelAndView saveUpdatedInvestor(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        try {
            Integer id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String contactNo = request.getParameter("contactNo");
            String dob = request.getParameter("dob");
            String riskProfile = request.getParameter("riskProfile");
            String preferredInvestmentType = request.getParameter("preferredInvestmentType");
            BigDecimal annualIncome = BigDecimal.valueOf(Double.parseDouble(request.getParameter("annualIncome")));
            String kycStatus = request.getParameter("kycStatus");

            Optional<Investor> investorOpt = investorService.getInvestorById(id);
            if (investorOpt.isPresent()) {
                Investor investor = investorOpt.get();
                investor.setName(name);
                investor.setAddress(address);
                investor.setEmail(email);
                investor.setContactNo(contactNo);
                // Convert dob string to Date object (add parsing logic)
                investor.setDob(new java.util.Date(dob));
                investor.setRiskProfile(riskProfile);
                investor.setPreferredInvestmentType(preferredInvestmentType);
                investor.setAnnualIncome(annualIncome);
                investor.setKycStatus(kycStatus);

                investorService.saveInvestor(investor);
                mv.setViewName("admindashboard");
                mv.addObject("message", "Investor updated successfully!");
            } else {
                mv.setViewName("updateInvestor");
                mv.addObject("message", "Error: Investor not found.");
            }
        } catch (NumberFormatException e) {
            mv.setViewName("updateInvestor");
            mv.addObject("message", "Error: Please ensure all fields are filled in correctly.");
        }

        return mv;
    }
    @Operation
    @GetMapping("/deleteInvestor/{id}")
    public ModelAndView deleteInvestor(@PathVariable Integer id) {
        ModelAndView mv = new ModelAndView("admindashboard");

        try {
            investorService.deleteInvestorById(id);
            mv.addObject("message", "Investor deleted successfully!");
        } catch (Exception e) {
            mv.addObject("message", "Error: Unable to delete investor. " + e.getMessage());
        }

        return mv;
    }
   

    @PostMapping("/uploadFinancialAdvisorscsv")
    public ModelAndView uploadFinancialAdvisors(@RequestParam("file") MultipartFile file) {
        ModelAndView mv = new ModelAndView("addFinancialAdvisor");

        try {
            InputStreamReader reader = new InputStreamReader(file.getInputStream());

            CSVReader csvReader = new CSVReader(reader);
            List<String[]> records = csvReader.readAll();

            List<FinancialAdvisor> advisors = new ArrayList<>();

            for (String[] row : records) {
                if (row.length >= 7) {
                    FinancialAdvisor advisor = new FinancialAdvisor();
                    advisor.setName(row[0]);
                    advisor.setEmail(row[1]);
                    advisor.setPassword(row[2]);
                    advisor.setContactNo(row[3]);
                    advisor.setExperienceYears(Integer.parseInt(row[4]));
                    advisor.setSpecialization(row[5]);
                    advisor.setRating(new BigDecimal(row[6]));

                    advisors.add(advisor);
                }
            }

            financialAdvisorService.saveAll(advisors);

            mv.addObject("message", "Financial Advisors uploaded successfully!");
        } catch (Exception e) {
            mv.addObject("message", "Error uploading financial advisors: " + e.getMessage());
        }

        return mv;
    }
    
    
    
    
}