package com.xticfc.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;

import com.xticfc.util.Constants;


public class DoHttpRequest extends Thread {

	private String stateTask;
	private String ywbid;
	private String userid;
	private String plFlag;
	private String reportinfoId;

	

	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			testPost();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void testPost() throws IOException {

		/**
		 * 首先要和URL下的URLConnection对话。 URLConnection可以很容易的从URL得到。比如： // Using
		 * java.net.URL and //java.net.URLConnection
		 */
		URL url = new URL(Constants.get("clientUrl")+"/uploadReport.do");
		URLConnection connection = url.openConnection();
		/**
		 * 然后把连接设为输出模式。URLConnection通常作为输入来使用，比如下载一个Web页。
		 * 通过把URLConnection设为输出，你可以把数据向你个Web页传送。下面是如何做：
		 */
		connection.setDoOutput(true);
		/**
		 * 最后，为了得到OutputStream，简单起见，把它约束在Writer并且放入POST信息中，例如： ...
		 */
		OutputStreamWriter out = new OutputStreamWriter(connection
				.getOutputStream(), "utf-8");
		String param = "stateTask=" + stateTask + "&ywbid=" + ywbid
				+ "&userid=" + "&plFlag=N&reportinfoId="+reportinfoId;
		out.write(param); // post的关键所在！
		// remember to clean up
		out.flush();
		out.close();
		/**
		 * 这样就可以发送一个看起来象这样的POST： POST /jobsearch/jobsearch.cgi HTTP 1.0 ACCEPT:
		 * text/plain Content-type: application/x-www-form-urlencoded
		 * Content-length: 99 username=bob password=someword
		 */
		// 一旦发送成功，用以下方法就可以得到服务器的回应：
		String sCurrentLine;
		String sTotalString;
		sCurrentLine = "";
		sTotalString = "";
		InputStream l_urlStream;
		l_urlStream = connection.getInputStream();
		// 传说中的三层包装阿！
		BufferedReader l_reader = new BufferedReader(new InputStreamReader(
				l_urlStream));
		while ((sCurrentLine = l_reader.readLine()) != null) {
			sTotalString += sCurrentLine + "   ";

		}
		if(null != sTotalString){
			sTotalString = new String(sTotalString.getBytes("gbk"),"UTF-8");
		}
		System.out.println(sTotalString);
	}

	public String getStateTask() {
		return stateTask;
	}

	public void setStateTask(String stateTask) {
		this.stateTask = stateTask;
	}

	public String getYwbid() {
		return ywbid;
	}

	public void setYwbid(String ywbid) {
		this.ywbid = ywbid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPlFlag() {
		return plFlag;
	}

	public void setPlFlag(String plFlag) {
		this.plFlag = plFlag;
	}

	public String getReportinfoId() {
		return reportinfoId;
	}

	public void setReportinfoId(String reportinfoId) {
		this.reportinfoId = reportinfoId;
	}
}
