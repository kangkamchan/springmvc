<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-07
  Time: 오전 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>modify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1>modify</h1>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Navbar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Dropdown
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                            </li>
                        </ul>>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <form id="frm">

                        <table class="table">

                            <thead>
                            <tr>
                                <th scope="row">
                                    <label for="title" class="form-label">제목</label>
                                </th>
                                <td>
                                    <div class="mb-3">
                                        <textarea class="form-control" id="title" name="title" rows="1" style="resize:none;">${dto.title}</textarea>
                                        <div id="err_title" style="display:none;"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="memberId" class="form-label">아이디</label>

                                </th>
                                <td>
                                    <div class="mb-3">
                                        <input type="hidden" id="memberId" name="memberId" value="${dto.memberId}">
                                        ${dto.memberId}
                                        <div id="err_memberId" style="display:none;"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="displayDate" class="form-label">게시일</label>
                                </th>
                                <td>
                                    <div class="mb-3">
                                        <input type="date" class="form-control" id="displayDate" name="displayDate" value="${dto.displayDate}"/>
                                        <div id="err_displayDate" style="display:none;"></div>
                                    </div>
                                </td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="2">
                                    <div class="mb-3">
                                        <textarea class="form-control" id="content" name="content" rows="10" style="resize:none;">
                                            ${dto.content}
                                        </textarea>
                                        <div id="err_content" style="display:none;"></div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="2">
                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-primary mb-3" id="btnSubmit">등록</button>
                                        <button class="btn btn-primary mb-3" id="btnBack">취소</button>
                                    </div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
                <div class="card-body">
                </div>
            </div>
        </div>
    </div>
    <div class="row content">
    </div>
    <div class="row footer">
        <div class="row fixed-bottom" style="z-index : -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">
                    footer
                </p>
            </footer>
        </div>
    </div>
</div>
<script>
    const frm = document.getElementById("frm");
    const btnSubmit = document.getElementById("btnSubmit");
    const btnBack = document.getElementById("btnBack");
    btnSubmit.addEventListener("click",(e)=>{
        e.preventDefault();
        e.stopPropagation()
        if(frm.title.value===""){
            frm.title.focus();
            alert('제목입력');
            return;
        }else if(frm.content.value===""){
            frm.content.focus();
            alert('내용입력');
            return;
        }
        frm.action='/bbs/modify.do';
        frm.method="post";
        frm.submit();
    },false);
    btnBack.addEventListener("click",(e)=>{
        e.preventDefault();
        e.stopPropagation()
        location.href="/bbs/view.do?idx=${dto.idx}";
    },false);
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
<script>
    const serverValidateResult = {};
    <c:if test="${not empty errors}">
        <c:forEach items="${errors}" var="err">
            if(document.getElementById("err_${err.field}")!=null){
                    document.getElementById("err_${err.field}").innerHTML = "<span style='color:red;'>${err.field}필드는 ${err.defaultMessage}</span>";
                    document.getElementById("err_${err.field}").style.display="block";
                    serverValidateResult["${err.field}"] = "a${err.defaultMessage.replace(';','')}a";
            }
        </c:forEach>
    </c:if>
    console.log(JSON.stringify(StringserverValidateResult));
</script>
</body>
</html>
