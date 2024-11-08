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
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1>Hello, world!</h1>
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
                    <form>
                        <table class="table">
                            <tr>
                                <th>인덱스 : </th>
                                <td>${bbs.idx}</td>
                            </tr>
                            <tr>
                                <th>제목 : </th>
                                <td>${bbs.title}</td>
                            </tr>
                            <tr>
                                <th>작성자 : </th>
                                <td>${bbs.memberId}</td>
                            </tr>
                            <tr>
                                <th>내용 : </th>
                                <td>
                                    ${bbs.content}
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="button" value="수정" onclick="location.href='/bbs/modify.do?idx=${bbs.idx}'">
                                    <input type="button" value="삭제" onclick="location.href='/bbs/delete.do?idx=${bbs.idx}'">
                                    <input type="button" value="뒤로가기" onclick="location.href='/bbs/list.do'">
                                </td>
                            </tr>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>