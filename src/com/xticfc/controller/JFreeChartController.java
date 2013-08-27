package com.xticfc.controller;

import java.awt.Font;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
  
@Controller
@RequestMapping(value="/chart")
public class JFreeChartController {  
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
    	
        
		return "views/chart/index";
	}
    /** 
     * 创建数据集合 
     * @return dataSet 
     */  
    public static CategoryDataset createDataSet() {  
        // 实例化DefaultCategoryDataset对象  
        DefaultCategoryDataset dataSet = new DefaultCategoryDataset();  
        // 向数据集合中添加数据  
        dataSet.addValue(500, "Java图书", "J2SE类");  
        dataSet.addValue(100, "Java图书222", "J2ME类");  
        dataSet.addValue(900, "Java图书111", "J2EE类");  
        return dataSet;  
    }  
    /** 
     * 创建JFreeChart对象 
     * @return chart 
     */  
    public static JFreeChart createChart() {  
        StandardChartTheme standardChartTheme = new StandardChartTheme("CN"); //创建主题样式  
        standardChartTheme.setExtraLargeFont(new Font("隶书", Font.BOLD, 20)); //设置标题字体  
        standardChartTheme.setRegularFont(new Font("宋体", Font.PLAIN, 15)); //设置图例的字体  
        standardChartTheme.setLargeFont(new Font("宋体", Font.PLAIN, 15)); //设置轴向的字体  
        ChartFactory.setChartTheme(standardChartTheme);//设置主题样式  
        // 通过ChartFactory创建JFreeChart  
        JFreeChart chart = ChartFactory.createBarChart3D(  
                "Java图书销量统计", //图表标题  
                "Java图书", //横轴标题  
                "销量（本）",//纵轴标题  
                createDataSet(),//数据集合  
                PlotOrientation.VERTICAL, //图表方向  
                true,//是否显示图例标识  
                false,//是否显示tooltips  
                false);//是否支持超链接  
        return chart;  
    }  
    // 本地测试  
    public static void main(String[] args) {  
        ChartFrame cf = new ChartFrame("Test", createChart());  
        cf.pack();  
        cf.setVisible(true);  
    }  
    @RequestMapping(value="/testBarChart3D")
	public String testBarChart3D(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
    	
        response.setContentType("image/png");
        OutputStream out = response.getOutputStream();
        ChartUtilities.writeChartAsPNG(out, createChart(),500,270);
		return null;
	}
    @RequestMapping(value="/testBarChart2D")
    public String testBarChart2D(HttpServletRequest request,
    		HttpServletResponse response) throws Exception{
    	
    	response.setContentType("image/png");
    	OutputStream out = response.getOutputStream();
    	StandardChartTheme standardChartTheme = new StandardChartTheme("CN"); //创建主题样式  
        standardChartTheme.setExtraLargeFont(new Font("隶书", Font.BOLD, 20)); //设置标题字体  
        standardChartTheme.setRegularFont(new Font("宋体", Font.PLAIN, 15)); //设置图例的字体  
        standardChartTheme.setLargeFont(new Font("宋体", Font.PLAIN, 15)); //设置轴向的字体  
        ChartFactory.setChartTheme(standardChartTheme);//设置主题样式  
        // 通过ChartFactory创建JFreeChart  
        JFreeChart chart = ChartFactory.createBarChart(  
                "Java图书销量统计", //图表标题  
                "Java图书", //横轴标题  
                "销量（本）",//纵轴标题  
                createDataSet(),//数据集合  
                PlotOrientation.VERTICAL, //图表方向  
                true,//是否显示图例标识  
                false,//是否显示tooltips  
                false);//是否支持超链接  
    	ChartUtilities.writeChartAsJPEG(out, chart, 500, 270);
    	return null;
    }
    
    @RequestMapping(value="/testPieChart2D")
	public String testPieChart2D(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
    	
        response.setContentType("image/png");
        OutputStream out = response.getOutputStream();
        DefaultPieDataset pd = new DefaultPieDataset();
        pd.setValue("Java图书", 500);
        pd.setValue("Javaaaa图书", 200);
        pd.setValue("Javabbb图书", 100);
        
        JFreeChart chart = ChartFactory.createPieChart("饼图2D", pd, true, true, false);
        ChartUtilities.writeChartAsPNG(out, chart,500,270);
		return null;
	}
    @RequestMapping(value="/testPieChart3D")
    public String testPieChart3D(HttpServletRequest request,
    		HttpServletResponse response) throws Exception{
    	
    	response.setContentType("image/png");
    	OutputStream out = response.getOutputStream();
    	DefaultPieDataset pd = new DefaultPieDataset();
    	pd.setValue("Java图书", 500);
    	pd.setValue("Javase图书", 200);
    	pd.setValue("Javaee图书", 100);
    	
    	JFreeChart chart = ChartFactory.createPieChart3D("饼图3D", pd, true, true, false);
    	ChartUtilities.writeChartAsPNG(out, chart,500,270);
    	return null;
    }
    @RequestMapping(value="/testPieChartRegulation")
    public String testPieChartRegulation(HttpServletRequest request,
    		HttpServletResponse response) throws Exception{
    	
    	response.setContentType("image/png");
    	OutputStream out = response.getOutputStream();
    	DefaultPieDataset pd = new DefaultPieDataset();
    	pd.setValue("Java图书", 500);
    	pd.setValue("Javase图书", 200);
    	pd.setValue("Javaee图书", 100);
    	DefaultPieDataset prePd = new DefaultPieDataset();
    	prePd.setValue("Java图书", 400);
    	prePd.setValue("Javase图书", 100);
    	prePd.setValue("Javaee图书", 300);
    	
    	JFreeChart chart = ChartFactory.createPieChart("饼图数据增减", pd, prePd, 200, true, true, true, true, true, true);
    	ChartUtilities.writeChartAsPNG(out, chart,500,270);
    	return null;
    }
    
    @RequestMapping(value="/testLineChart2D")
    public String testLineChart2D(HttpServletRequest request,
    		HttpServletResponse response) throws Exception{
    	
    	response.setContentType("image/png");
    	OutputStream out = response.getOutputStream();
    	
    	DefaultCategoryDataset dcd = new DefaultCategoryDataset();
    	dcd.setValue(500, "b", "aaaa");
    	dcd.setValue(300, "b", "bbbb");
    	dcd.setValue(700, "b", "cccc");
    	dcd.setValue(200, "b", "dddd");
    	dcd.setValue(300, "b", "eeee");
    	dcd.setValue(900, "b", "ffff");
    	dcd.setValue(100, "b", "gggg");
    	dcd.setValue(400, "c", "aaaa");
    	dcd.setValue(500, "c", "bbbb");
    	dcd.setValue(900, "c", "cccc");
    	dcd.setValue(300, "c", "dddd");
    	dcd.setValue(100, "c", "eeee");
    	dcd.setValue(200, "c", "ffff");
    	dcd.setValue(700, "c", "gggg");
    	JFreeChart chart = ChartFactory.createLineChart("曲线图2D", null, "bbbb", dcd, PlotOrientation.VERTICAL, true, true, true);
    	ChartUtilities.writeChartAsPNG(out, chart,500,270);
    	return null;
    }
}  