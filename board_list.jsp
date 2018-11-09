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
  board();
  $('#btn_proc').html('글쓰기'); // 버튼 레이블 지정
  $('#btn_proc').off('click');   // 이벤트 해제
  $('#btn_proc').on('click', create_form);
});
 
function board(){
  $.ajax({
    url: "./board.jsp",
    type: "POST",
    cache: false,
    dataType: "html",
    success: function(data){ // 정상 처리
      $('#board').html(data);
    },
    // 통신 에러, 요청 실패, 200 아닌 경우, dataType이 다른경우
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);   
    }
  }); 
}

function update_form(b_no){
  $.ajax({
    url: "./update_form.jsp",
    type: "POST",
    cache: false,
    dataType: "json",
    data: "b_no=" + b_no,
    success: function(data){
      $('#b_no').val(data.b_no);
      $('#b_type').val(data.b_type);  
    	$('#b_title').val(data.b_title);	      
    	$('#b_content').val(data.b_content);
    	$('#b_file').val(data.b_file);
    	$('#b_user').val(data.b_user);
      
      $('#btn_proc').html('저장'); 
      $('#btn_proc').off('click'); 
      $('#btn_proc').on('click', update_proc);      
    },
    
    error: function (request, status, error){        
    	var msg = "ERROR : " + request.status + "<br>"
      msg +=  + "내용 : " + request.responseText + "<br>" + error;
      console.log(msg);              
    }
  });
}
 
function update_proc(){  
	alert($('#frm').serialize());
  $.ajax({
    url: "./update_proc.jsp",
    type: "POST",
    cache: false,
    dataType: "json",
    data: $('#frm').serialize(),
    success: function(data){      
      var str = '';
      var msgs = data.msgs; 
      for (var i=0; i < msgs.length; i++) {
        str += msgs[i];
      }
      alert(str);
      list();  // 목록 새로 고침
      init();  // 글쓰기 버튼으로 새로 고침   
    },   
    
    error: function (request, status, error){  
      var msg = "ERROR<br><br>"
      msg += request.status + "<br>" + request.responseText + "<br>" + error;
      console.log(msg);                    
    }
  });
}

function create_form(){
	$(location).attr('href','../board/create_form.jsp');	
}

function getCloseButton() {
  var str = "<br>[<A href=\"javascript: $('#panel').hide(); $('#b_title').focus();\"><span style='color: white;'>CLOSE</span></A>]";
  
  return str;
}

function init() {
	  $('#b_no').val('');
	  $('#b_type').val('');
	  $('#b_title').val('');
	  $('#b_content').val('');
	  $('#b_file').val('');
	  $('#b_user').val('');
	  
	  $('#btn_proc').html('글쓰기');
	  $('#btn_proc').off('click');
	  $('#btn_proc').on('click', create_form); 	  	
}
</script>

</head>
<body>
<jsp:include page="/common/top.jsp" flush='false' />
<form name="frm" id="frm" action='' method='POST'>
<input type="hidden" name="b_no" id="b_no" value="">

<div class="row">
	<div class="col">
	  <!-- 전송시 체크된 값 관련 메시지 출력 -->
	  <DIV id='panel' class='popup1' style='display: none; height: 150px;'>
	    현재 알림이 없습니다.
	    <br>[<A href="javascript: $('#panel').hide()">CLOSE</A>]
	  </DIV>
	  
		<div style="float: right">
			<button type="button" class="btn btn-outline-secondary" id="btn_proc" onclick=""></button> 
		</div>
	  
    <div class="form-group">   
      <label for="type" class="col-md-1 control-label">분류</label>
      <div class="col-md-11">
        <input type='text' class="form-control input-md" name='b_type' id='b_type' value='' required="required" style='width: 45%;'>
      </div>
    </div>  
      
    <div class="form-group">   
      <label for="title" class="col-md-1 control-label">제목</label>
      <div class="col-md-11">
        <input type='text' class="form-control input-md" name='b_title' id='b_title' value='' required="required" style='width: 45%;'>
      </div>
    </div>     
    
    <div class="form-group">   
      <label for="content" class="col-md-1 control-label">내용</label>
      <div class="col-md-11">
        <textarea class="form-control input-md" name='b_content' id='b_content' rows='10'></textarea>
      </div>
    </div> 
    <!-- 
    <div class="form-group">   
      <label for="file1MF" class="col-md-1 control-label">파일</label>
      <div class="col-md-11">
        <input type="file" class="form-control input-md" name='b_file' id='b_file' value='' size='40' style='width: 25%;'>         
      </div>
    </div> --> 

		<div class="form-group">   
      <label for="file1MF" class="col-md-1 control-label">작성자</label>
      <div class="col-md-11">
        <input type="text" class="form-control input-md" name='b_user' id='b_user' value="" size='40' style='width: 25%;'>         
      </div>
    </div>
	  
	  <DIV id='board'></DIV>
	  
	</div>
</div>

</form>
<jsp:include page="/common/bottom.jsp" flush='false' />

</body>
</html>