package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.springboot.model.MutualFunds;
import com.klef.jfsd.springboot.service.MutualFundService;

import jakarta.servlet.http.HttpServletResponse;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/mutualfunds")
public class MutualFundController {

    @Autowired
    private MutualFundService mutualFundService;

    @GetMapping("")
    public String listMutualFunds(Model model) {
        List<MutualFunds> funds = mutualFundService.getAllMutualFunds();
        model.addAttribute("funds", funds);
        return "listFunds";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("mutualFund", new MutualFunds());
        return "createFund";
    }

    @PostMapping("/create")
    public String createMutualFund(@ModelAttribute MutualFunds mutualFund, 
                                   @RequestParam("imageFile") MultipartFile imageFile) {
        try {
            if (!imageFile.isEmpty()) {
                byte[] bytes = imageFile.getBytes();
                mutualFund.setImage(new SerialBlob(bytes));
            }
            mutualFundService.createMutualFund(mutualFund);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mutualfunds";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        MutualFunds fund = mutualFundService.getMutualFundById(id);
        model.addAttribute("mutualFund", fund);
        return "editFund";
    }

    @PostMapping("/edit/{id}")
    public String updateMutualFund(@PathVariable int id, 
                                   @ModelAttribute MutualFunds mutualFund,
                                   @RequestParam("imageFile") MultipartFile imageFile) {
        try {
            if (!imageFile.isEmpty()) {
                byte[] bytes = imageFile.getBytes();
                mutualFund.setImage(new SerialBlob(bytes));
            }
            mutualFundService.updateMutualFund(mutualFund);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mutualfunds";
    }

    @GetMapping("/delete/{id}")
    public String deleteMutualFund(@PathVariable int id) {
        mutualFundService.deleteMutualFund(id);
        return "redirect:/mutualfunds/";
    }

    @GetMapping("/view/{id}")
    public String viewMutualFund(@PathVariable int id, Model model) {
        MutualFunds fund = mutualFundService.getMutualFundById(id);
        model.addAttribute("fund", fund);
        return "viewFund";
    }
    @GetMapping("/mutualfunds/image/{id}")
    public void showImage(@PathVariable int id, HttpServletResponse response) throws IOException, SQLException {
        MutualFunds fund = mutualFundService.getMutualFundById(id);
        if (fund != null && fund.getImage() != null) {
            Blob imageBlob = fund.getImage();
            response.setContentType("image/jpeg");
            response.getOutputStream().write(imageBlob.getBytes(1, (int) imageBlob.length()));
            response.getOutputStream().close();
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
        }
    }
    @GetMapping("/analystDashboard")
    public String showAnalystDashboard(Model model) {
        // Get the best mutual fund
        MutualFunds bestFund = mutualFundService.getBestFund();

        // Add the best fund details to the model
        if (bestFund != null) {
            model.addAttribute("bestFundName", bestFund.getFundName());
            model.addAttribute("bestFundNav", bestFund.getNav());
            model.addAttribute("bestFundAnnualReturn", bestFund.getAnnualReturn());
            model.addAttribute("bestFundCategory", bestFund.getCategory());
            model.addAttribute("bestFundDescription", bestFund.getDescription());
            model.addAttribute("bestFundCost", bestFund.getCost());
            model.addAttribute("bestFundUrl", bestFund.getUrl());
        }

        return "analyst-dashboard";  // Return the analyst-dashboard.jsp page
    }
    }
