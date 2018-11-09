<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>

<table class="table">
  <colgroup>
  	<col width="10%">
  	<col width="15%">
  	<col width="35%">
  	<col width="10%">
  	<col width="15%">
  	<col width="15%">
  	<col width="10%">
  </colgroup>
  <thead>
    <tr>
      <th style="text-align: center">No</th>
      <th style="text-align: center">분류</th>
      <th style="text-align: center">제목</th>
      <th style="text-align: center">작성자</th>
      <th style="text-align: center">작성일</th>
      <th style="text-align: center">조회</th>
      <th style="text-align: center">기타</th>
    </tr>
  </thead>
  
  <tbody>   
  <%
	// postCount 전체 글 갯수
	// pagePost	 페이지당 조회되는 글 갯수 
	// nowPage   현재 페이지
	int postCount = boardProc.count();

	ArrayList<BoardVO> list = boardProc.list(nowPage, pagePost); 
	  
  for(int i=0; i < list.size(); i++){
  	BoardVO boardVO = list.get(i);
 	%>	     
    <tr>
      <td style="text-align: center"><%=boardVO.getB_no() %></td>
      <td style="text-align: center"><%=boardVO.getB_type() %></td>
      <td><a href="./read.jsp?b_no=<%=boardVO.getB_no()%>"><%=boardVO.getB_title() %></a></td>
      <td style="text-align: center"><%=boardVO.getB_user() %></td>
      <td style="text-align: center"><%=boardVO.getB_ymd().substring(0,10) %></td>
      <td style="text-align: center"><%=boardVO.getB_cnt() %></td>
      <td style="text-align: center">
      	<button type="button" onclick="update_form(<%=boardVO.getB_no() %>)" class="btn btn-outline-danger">수정</button>
      </td>
    </tr>
	<%
  }
	%>
  </tbody>
</table>