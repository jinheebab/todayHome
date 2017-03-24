<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.MessageDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String content = request.getParameter("content");
	HashMap<String, Object> map = new HashMap<>();
	map.put("sender", sender);
	map.put("receiver", receiver);
	map.put("content", content);
	
	MessageDao mDao = new MessageDao();
	int rst = mDao.sendRecv(map);
	
	if(rst == 1){
	%>
		메시지가 정상적으로 등록 되었습니다.
		<b>3초</b>뒤 이전 화면으로 이동합니다..
		<meta http-equiv="refresh" content="3;url=/message/send.jsp"/>
	<%
	}else{
	%>
		메시지 등록이 실패하였습니다.
		<b>3초</b>뒤 메시지 작성 화면으로 이동됩니다.
		<meta http-equiv="refresh" content="3;url=/message/send.jsp"/>
	<%
	}
	
%>

