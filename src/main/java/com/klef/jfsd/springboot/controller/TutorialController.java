package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Tutorial;
import com.klef.jfsd.springboot.service.TutorialService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/tutorials")
public class TutorialController {

    @Autowired
    private TutorialService tutorialService;

    // Display the tutorial form page
    @GetMapping("/form")
    public String showTutorialForm(Model model) {
        model.addAttribute("tutorial", new Tutorial());
        return "tutorial_form"; // JSP page for the tutorial form
    }
    
   
    // Handle the submission of the tutorial form
    @PostMapping("/add")
    public String addTutorial(
        @ModelAttribute("tutorial") Tutorial tutorial,
        @RequestParam("videoFile") MultipartFile videoFile,
        Model model) {

        try {
            // Convert videoFile to Blob and set in the Tutorial model
            Blob videoBlob = new SerialBlob(videoFile.getBytes());
            tutorial.setVideo(videoBlob);
            tutorialService.addTutorial(tutorial);
            model.addAttribute("message", "Tutorial uploaded successfully!");
        } catch (IOException | SQLException e) {
            model.addAttribute("error", "Error uploading tutorial: " + e.getMessage());
        }

        return "redirect:/tutorials/all"; // Redirects to list all tutorials
    }

    // Display all tutorials
    @GetMapping("/all")
    public String getAllTutorials(Model model) {
        List<Tutorial> tutorials = tutorialService.getAllTutorials();
        model.addAttribute("tutorials", tutorials);
        return "tutorial_list"; // JSP page for listing all tutorials
    }

    // Display a specific tutorial by ID
    @GetMapping("/{id}")
    public String getTutorialById(@PathVariable int id, Model model) {
        Tutorial tutorial = tutorialService.getTutorialById(id);
        if (tutorial != null) {
            model.addAttribute("tutorial", tutorial);
            return "tutorial_detail"; // JSP page to display tutorial details
        } else {
            model.addAttribute("error", "Tutorial not found.");
            return "error"; // JSP page for displaying errors
        }
    }
 
    @GetMapping("/investorTutorials")
    public String showInvestorTutorials(Model model) {
        List<Tutorial> tutorials = tutorialService.getAllTutorials();
        model.addAttribute("tutorials", tutorials);
        return "investorTutorials"; // Ensure this JSP exists
    }

    
    
    // Delete a tutorial by ID
    @GetMapping("/delete/{id}")
    public String deleteTutorial(@PathVariable int id, Model model) {
        tutorialService.deleteTutorial(id);
        model.addAttribute("message", "Tutorial deleted successfully.");
        return "redirect:/tutorials/all";
    }
    
    @GetMapping("/video/{id}")
    public void streamVideo(@PathVariable int id, HttpServletResponse response) {
        Tutorial tutorial = tutorialService.getTutorialById(id);
        if (tutorial != null && tutorial.getVideo() != null) {
            try (InputStream videoStream = tutorial.getVideo().getBinaryStream();
                 OutputStream outputStream = response.getOutputStream()) {

                response.setContentType("video/mp4");
                response.setHeader("Content-Disposition", "inline; filename=\"video.mp4\"");
                
                byte[] buffer = new byte[8192];
                int bytesRead;
                while ((bytesRead = videoStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.flush();
            } catch (IOException | SQLException e) {
                throw new RuntimeException("Error streaming video", e);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }

}
