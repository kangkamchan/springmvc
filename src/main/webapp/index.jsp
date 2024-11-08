<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="bbs/list.do?pageNo=&pageSize=&SortField=&sortOrder=">입장</a>
<div class="spinner-border text-primary" role="status">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>