<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="com.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jxl.write.*" %>
<%@ page import="jxl.*" %>
<head>
	<%
		request.setCharacterEncoding("utf-8");
		try{
			ArrayList<Statisticinfo> info_list=new ArrayList<Statisticinfo>();

			String driverName = "com.mysql.jdbc.Driver";
			String dbURL = "jdbc:mysql://172.18.187.10:3306/boke16337157";
			String userName = "user";
			String userPwd = "123";
			Connection dbConn = null;
			dbConn= DriverManager.getConnection(dbURL,userName,userPwd);
			PreparedStatement ps;
			String sql="select year(workdate) 年,month(workdate) 月,wk.id 学号,ext.wtype 加班类型,sum(timet) 加班总时间 "+
					"from extraworkinfo ext,worker wk "+
					"where confirmstatus=1 and ext.wno=wk.wno "+
					"group by year(workdate),month(workdate),ext.wno,ext.wtype";
			ps=dbConn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Statisticinfo info=new Statisticinfo();
				info.setYear(rs.getString("年"));
				info.setMonth(rs.getString("月"));
				info.setId(rs.getInt("学号"));
				info.setWtype(rs.getString("加班类型"));

				info.setTotal_wtime(rs.getString("加班总时间"));
				info_list.add(info);
			}
			response.reset();//清空输出流
			OutputStream os = response.getOutputStream();//取得输出流
			String fileName = "请假信息统计表.xls";
			fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" +fileName);
			response.setContentType("application/msexcel");//定义输出类型
			WritableWorkbook workbook;
			workbook = Workbook.createWorkbook(os);
			WritableSheet sheet = workbook.createSheet("First Sheet",0);
			Label year = new Label(0,0,"年");
			sheet.addCell(year);
			Label month = new Label(1,0,"月");
			sheet.addCell(month);
			Label wno = new Label(2,0,"学号");
			sheet.addCell(wno);
			Label wtype = new Label(3,0,"请假类型");
			sheet.addCell(wtype);

			Label total = new Label(4,0,"请假总时间(小时)");
			sheet.addCell(total);
			for(int i=0;i<info_list.size();i++){
				Statisticinfo info=info_list.get(i);
				year = new Label(0,i+1,info.getYear());
				sheet.addCell(year);
				month = new Label(1,i+1,info.getMonth());
				sheet.addCell(month);
				String s=""+info.getWno();
				wno = new Label(2,i+1,s);
				sheet.addCell(wno);
				wtype = new Label(3,i+1,info.getWtype());
				sheet.addCell(wtype);

				total = new Label(4,i+1,info.getTotal_wtime());
				sheet.addCell(total);
			}
			workbook.write();
			workbook.close();
			os.close();
			response.flushBuffer();
			out.clear();
			out = pageContext.pushBody();
			ps.close();
			dbConn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	%>
</head>

</html>