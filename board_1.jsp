<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(function() {
	paging();
	list();
});
		
function paging(nowPage, pagePost){	
  $.ajax({
    url: "./paging.jsp",
    type: "POST",
    cache: false,
    data: "nowPage="+nowPage+"&pagePost="+pagePost,
    dataType: "html",
    success: function(data){ // 정상 처리
      $('#paging').html(data);
    	$('#nowPage').val(nowPage);
    	$('#pagePost').val(pagePost);  
    	list(nowPage, pagePost);
    },
   
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);   
    }
  }); 
}

function list(nowPage, pagePost){		
	  $.ajax({
	    url: "./list.jsp",
	    type: "POST",
	    cache: false,
	    data: "nowPage="+nowPage+"&pagePost="+pagePost,
	    dataType: "html",
	    success: function(data){ // 정상 처리
	      $('#list').html(data);	    		 
	    },
	   
	    error: function (request, status, error){        
	    	var msg = "ERROR : " + request.status + "<br>"
	      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	      console.log(msg);   
	    }
	  });
}
</script>
</head>
<body>

<div class="row">
	<div class="col">
		<div id="list"></div>
	</div>
</div>		
<div class="row">
	<div class="col-md-auto" style="margin: 0px auto">		
		<div id="paging"></div>
	</div>			 
</div>
</body>
</html>