<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.Goods" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Blog Post - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/blog-post.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Барахолка</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Товары
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mygoods">Мои товары</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Настройки</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Выход</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8 offset-2">

            <!-- Title -->
            <h1 class="mt-4">Мои товары</h1>
            <hr>
            <%
                ArrayList<Goods> MyListGoods = (ArrayList<Goods>) request.getAttribute("MyList");
                if (MyListGoods != null && MyListGoods.size() > 0) {
                    for (Goods g : MyListGoods) {
            %>
            <h3><% out.print(g.getTitle()); %></h3>
            <% if (g.getPublished() == 1) {
                out.print("<p class=\"published\">Объявление: опубликовано</p>");
            } else {
                out.print("<p class=\"no-published\">Объявление: не опубликовано</p>");
            }
            %>
            <p>Дата создания: <% out.print(g.getDate()); %> <% out.print(g.getTime()); %></p>
            <p>Количество просмотров: <% out.print(g.getView_count()); %></p>
            <p>Номер товара # <% out.print(g.getId()); %></p>
            <p>Стоимость: <% out.print(g.getPrice()); %></p>
            <p>Описание товара: <% out.print(g.getDescription()); %></p>
            <p>Фотография: <% out.print(g.getPhoto()); %></p>

            <form action="editgoods" method="post">
                <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                <button type="submit" class="btn btn-primary" name="edit">Редактировать</button>

            </form>

            <form action="deletegoods" method="post">
                <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                <button type="submit" class="btn btn-danger" name="delete">Удалить</button>
            </form>

            <hr>
            <%
                    }
                } else {
                    out.print("<p> Нет товаров !</p> ");
                }
            %>
        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Барахолка 2017</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
