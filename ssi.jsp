<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.util.ArrayList" %>

<%@ page import="common.DBConnect" %>
<%@ page import="common.DBDisconnect" %>
<%@ page import="common.Upload"  %>

<%@ page import="org.json.simple.*" %>

<%@ page import="board.*" %>
<%@ page import="skill.*" %>

<%@ page import="org.apache.commons.fileupload.FileItem" %>

<%
request.setCharacterEncoding("utf-8");
%>

<%
BoardProc boardProc = new BoardProc();
BoardDAO boardDAO = new BoardDAO();

//페이지당 출력할 글 갯수
int pagePost =  0;
if (request.getParameter("pagePost") == null || request.getParameter("pagePost").equals("undefined")) {
	pagePost = 2;
} else {
	pagePost = Integer.parseInt(request.getParameter("pagePost"));
}

//현재 페이지
int nowPage =  0;
if (request.getParameter("nowPage") == null || request.getParameter("nowPage").equals("undefined")) {
	nowPage = 1; // 현재 페이지 1부터 시작
} else {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

%>