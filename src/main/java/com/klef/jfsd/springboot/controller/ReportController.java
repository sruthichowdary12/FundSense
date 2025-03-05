package com.klef.jfsd.springboot.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.klef.jfsd.springboot.service.ReportService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/generate-report")
    public String generateReport() {
        return "report"; // JSP page for rendering the report view
    }

    @GetMapping("/download-report")
    @ResponseBody
    public void downloadReport(HttpServletResponse response) throws IOException {
        // Generate the chart image
        File chartFile = reportService.generateMutualFundBarChart();

        // Set up response to send the image as a downloadable file
        response.setContentType("image/png");
        response.setHeader("Content-Disposition", "attachment; filename=mutual_fund_report.png");

        // Read and write the image file to the response output stream
        try (FileInputStream fileInputStream = new FileInputStream(chartFile);
             OutputStream outputStream = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
    }
}