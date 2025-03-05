package com.klef.jfsd.springboot.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.MutualFunds;

@Service
public class ReportService {

    @Autowired
    private MutualFundService mutualFundService;

    public File generateMutualFundBarChart() throws IOException {
        // Fetch data from the database
        List<MutualFunds> mutualFundsList = mutualFundService.getAllMutualFunds();

        // Create dataset
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for (MutualFunds fund : mutualFundsList) {
            dataset.addValue(fund.getNav(), fund.getFundName(), fund.getFundType());
        }

        // Generate chart
        JFreeChart barChart = ChartFactory.createBarChart(
                "Mutual Fund Report",
                "Fund Type",
                "Current Value",
                dataset
        );

        // Save chart as an image
        File chartFile = new File("mutual_fund_chart.png");
        ChartUtils.saveChartAsPNG(chartFile, barChart, 800, 600);
        return chartFile;
    }
}