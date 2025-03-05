package com.klef.jfsd.springboot.service;

import java.io.File;
import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;

public class PDFReportService {

    public File exportChartToPDF(File chartImage) throws Exception {
        Document document = new Document();
        File pdfFile = new File("mutual_fund_report.pdf");

        PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
        document.open();

        Image chart = Image.getInstance(chartImage.getAbsolutePath());
        document.add(chart);

        document.close();
        return pdfFile;
    }
}