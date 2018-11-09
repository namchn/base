<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>
 
<%
int postCount = boardProc.count();

int pagePerBlock = 7; // 블럭당 페이지 수 
int totalPage = (int)(Math.ceil((double)postCount/pagePost)); // 전체 페이지  
int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
 
int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동     
 
_nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
%>

<nav aria-label='Page navigation example'>
<ul class='pagination'>
<%
if (nowGrp >= 2){
%>
	<li class='page-item'>
	<a class='page-link' href='./paging.jsp?nowPage=<%=_nowPage%>&pagePost=<%=pagePost %>'>이전</a></li>
<%    	
} 

for(int i=startPage; i<=endPage; i++){ 
  if (i > totalPage){ 
    break; 
  }   
  if (nowPage == i){
%>  	
  <li class='page-item'><a class='page-link' href='#'><%=i %></a></li>
<%
  }else{
%>	
  <!-- <li class='page-item'><a class='page-link' href='./paging.jsp?nowPage=<%=i %>&pagePost=<%=pagePost %>'><%=i %></a></li> -->
  <li class='page-item'><a class='page-link' onclick="paging(<%=i %>, <%=pagePost %>)"><%=i %></a></li>
<%
  } 
} 
%>

<%
if (nowGrp < totalGrp){
%>
	<li class='page-item'>
	<a class='page-link' href='./paging.jsp?nowPage=<%=_nowPage %>&pagePost=<%=pagePost %>'>다음</a></li>
<%	
} 
%>
</ul>
</nav>

