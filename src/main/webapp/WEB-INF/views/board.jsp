<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <%--<link rel="stylesheet" href="<c:url value='/css/menu.css'/>">--%>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo">fastcampus</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='/login/login'/>">login</a></li>
    <%--<li><a href="<c:url value='/register/add'/>">Sign in</a></li>--%>
    <li><a href=""><i class="fas fa-search small"></i></a></li>
  </ul>
</div>
<div style="text-align:center">
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>
  <body>
  <h2>게시물 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
  <form action="" id="form">
    <input type="text" name="bno" value= "${boardDto.bno}" >
    <input type="text" name="title"  value="${boardDto.title}" ${mode=="new" ? '' : 'readonly="readonly"'}>
    <textarea name="content" id="" cols="30" rows="10" ${mode=="new" ? '' : 'readonly="readonly"'}>${boardDto.content}</textarea>
    <button type="button" id="writeBtn" class="btn">등록</button>
    <button type="button" id="modifyBtn" class="btn">수정</button>
    <button type="button" id="removeBtn" class="btn">삭제</button>
    <button type="button" id="listBtn" class="btn">목록</button>
  </form>
  </body>
  </html>
</div>
<script>
  $(document).ready(function (){ //main()
      $('#listBtn').on("click",function (){
        location.href="<c:url value='/board/list'/>?page=${page}&pageSize=${pageSize}";
      });

    $('#removeBtn').on("click",function (){
      if(!confirm("정말로 삭제하시겠습니까?")) return;
      let form =  $('#form');
      form.attr("action", "<c:url value="/board/remove"/>?page=${page}&pageSize=${pageSize} ");
      form.attr("method", "post");
      form.submit();
    });
  })
</script>
</body>
</html>