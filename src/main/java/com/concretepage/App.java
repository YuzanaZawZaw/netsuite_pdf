package com.concretepage;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import java.io.*;
import org.faceless.pdf2.PDF;
import org.faceless.report.ReportParser;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;

public class App {

	public static void main(String[] args) throws Exception {
		
		Configuration cfg = new Configuration();
		cfg.setIncompatibleImprovements(new Version(2, 3, 20));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setLocale(Locale.US);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		
		Map<String, Object> input = new HashMap<String, Object>();

		input.put("title", "");
						
		// 2.2. Get the template
		Template template = cfg.getTemplate("resources/test.ftl");
		
		// For the sake of example, also write output into a file:
		Writer fileWriter = new FileWriter(new File("output/output.xml"));
		try {
			template.process(input, fileWriter);
			
		} finally {
			fileWriter.close();
		}
					 
		FileOutputStream fout=new FileOutputStream("test1.pdf");
		ReportParser parser = ReportParser.getInstance();
		PDF pdf = parser.parse("output/output.xml");
		pdf.render(fout);
		fout.close();

	}
}
