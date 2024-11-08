<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-07
  Time: 오전 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>게시판-목록</title>
</head>
<body>
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
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    게시판 목록<div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                    <div class="spinner-border text-secondary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <div class="spinner-border text-success" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <div class="spinner-border text-danger" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <div class="spinner-border text-warning" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <div class="spinner-border text-info" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <div class="spinner-border text-light" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <div class="spinner-border text-dark" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
                <div class="card-body">
                    <div>
                        <form id="search" method="get" action="/bbs/list.do">
                            <select name="searchCategory">
                                <option value="">선택</option>
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="memberId">작성자</option>
                            </select>
                            <input type="text" name="searchWord" value="${not empty pageDTO.searchWord ? pageDTO.searchWord : ''}">
                            <input type="submit" value="검색">
                        </form>
                        <form id="sort" method="get" action="/bbs/list.do">
                            <select name="sortField">
                                <option value="">선택</option>
                                <option value="idx">인덱스</option>
                                <option value="title">제목</option>
                                <option value="regDate">날짜</option>
                            </select>
                            <select name="sortOrder">
                                <option value="">선택</option>
                                <option value="desc">내림차순</option>
                                <option value="asc">오름차순</option>
                            </select>
                            <input type="submit" value="검색">
                        </form>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">선택</th>
                                <th scope="col">인덱스</th>
                                <th scope="col">제목</th>
                                <th scope="col">내용</th>
                                <th scope="col">작성자</th>
                                <th scope="col">작성일</th>
                                <th scope="col">삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="bbs" items="${pageDTO.dtoList}" varStatus="loop">
                                <tr>
                                    <th scope="row"><input type="checkbox" value="${bbs.idx}" name="bbsChk"></th>
                                    <td>${bbs.idx}</td>
                                    <td><a href="${pageContext.request.contextPath}/bbs/view.do?idx=${bbs.idx}">${bbs.title}</a></td>
                                    <td>${bbs.content}</td>
                                    <td>${bbs.memberId}</td>
                                    <td>${bbs.regDate}</td>
                                    <td>삭제</td>
                                </tr>

                            </c:forEach>
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
                <div class="container text-center">
                    <div class="row">
                        <div class="col"></div>
                        <div class="col-8">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${pageDTO.prev}">
                                        <li class="page-item"><a class="page-link" href="/bbs/list.do?pageNo=1&${pageDTO.queryString}">&lt;&lt;</a></li>
                                        <li class="page-item"><a class="page-link" href="/bbs/list.do?pageNo=${pageDTO.blockStart-1}&${pageDTO.queryString}">&lt;</a></li>
                                    </c:if>
                                    <c:forEach begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}" var="num">
                                        <li class="page-item ${pageDTO.pageNo eq num ? 'active' : ''}"><a class="page-link" href="/bbs/list.do?pageNo=${num}&${pageDTO.queryString}">${num}</a></li>
                                    </c:forEach>
                                    <c:if test="${pageDTO.next}">
                                        <li class="page-item"><a class="page-link" href="/bbs/list.do?pageNo=${pageDTO.blockEnd+1}&${pageDTO.queryString}">&gt;</a></li>
                                        <li class="page-item"><a class="page-link" href="/bbs/list.do?pageNo=${pageDTO.totalPage}&${pageDTO.queryString}">&gt;&gt;</a></li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-primary" onclick="location.href='/bbs/regist.do';">등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row content">
        main
    </div>
    <div class="row footer">
        footer
        <div class="row fixed-bottom" style="z-index : -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">
                    footer
                </p>
            </footer>
        </div>
    </div>
</div>
<c:if test="${not empty pageDTO.searchCategory}">
    <script>
        const categoryOptions = document.querySelectorAll("select[name='searchCategory'] option");
        for(let i of categoryOptions){
           if(i.value=='${pageDTO.searchCategory}'){
               i.selected = true;
           }
        }
    </script>
</c:if>
<c:if test="${not empty pageDTO.sortField}">
    <script>
        const sortFieldOptions = document.querySelectorAll("select[name='sortField'] option");
        for(let i of sortFieldOptions){
            if(i.value=='${pageDTO.sortField}'){
                i.selected = true;
            }
        }
    </script>
</c:if>
<c:if test="${not empty pageDTO.sortOrder}">
    <script>
        const sortOrderOptions = document.querySelectorAll("select[name='sortOrder'] option");
        for(let i of sortOrderOptions){
            if(i.value=='${pageDTO.sortOrder}'){
                i.selected = true;
            }
        }
    </script>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
</script>
</body>
</html>
