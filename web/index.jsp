<%@ page import="entities.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SALE RACECAR</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="style_2.css">
    <link rel="stylesheet" href="style_3.css">
    <link rel="stylesheet" href="ModalDialogStyle.css">
    <link rel="stylesheet" href="style_table_account.css">
    <style type="text/css">
        body { background: no-repeat url(image/Fon/FonAuto2.jpg); }
    </style>
</head>
<body>
<!--фиксированное меню сайта с выбором сортировки содержимого-->
<div class="Left_Menu">
    <table>
        <tr><td style="color: Black; text-align: center; font-size: 14pt;">SORT</td></tr>
        <tr><td><a class="ButtMenu" href="#" title="Only photo"><div class="Butt_Left_Menu">Ph</div></a></td></tr>
        <tr><td><a class="ButtMenu" href="#" title="Only video"><div class="Butt_Left_Menu">Vi</div></a></td></tr>
        <tr><td><a class="ButtMenu" href="#" title="Only XX"><div class="Butt_Left_Menu">XX</div></a></td></tr>
        <tr><td><a class="ButtMenu" href="#" title="to UP"><div class="Butt_Left_Menu">Back</div></a></td></tr>
    </table>
</div>
<div class="controlPosCont">
    <!--Шапка сайта. Не трогать! Подгонял пиксели 8+ часов-->
    <div class="div1">
        <table>
            <tr>
                <td><a href="#" class="href"><div class="div1A">TimeAttack</div><div class="Slogan">#ONLYFIRST, ONLY THE BEST</div></a>
                    <div class="div1A1"></div></td>
                <td><a href="#"><div class="div1B"><img class="Imgdiv1B" src="image/Rekl/Tomei.jpg"/></div></a></td>
            </tr>
        </table>
    </div>

    <!--главная менюшка сайта-->
    <div class="Menu">
        <a class="href" href="#"><button class="button_menu">Home</button></a>
        <a class="href" href="#"><button class="button_menu">Store</button></a>
        <a class="href" href="/index.jsp"><button class="button_menu">Menu</button></a>
        <a class="href" href="#"><button class="button_menu">Contact</button></a>
        <a class="href" href="#openModalRegist"><button class="button_menu">Regist</button></a>

        <%
            if (null != request.getSession().getAttribute("login")) {
                Users x = (Users) request.getSession().getAttribute("login");
        %>
            <div class="nameUserandLogout">
                <div class="welcome_text">Welcome <% out.print(x.getName() + " " + x.getSurname() + " "); %></div>
                <a href="/logout"><button class="menu_button_enter button_logout">Logout</button></a>
            </div>
        <%
            } else {
                %><div class="welcome_text">Welcome Anonym</div><%
                //out.print("<h4> Welcome Anonum <a href=\"login.jsp\">Login</a></h4>");
                //out.print("");
            }
        %>
    </div>

    <!--Альбом в котором будут рандомно пролистываются фото из новостей-->
    <!--расположен по центру экрана-->
    <div class="divAlbum">
        <div class="accountAdminUser">
            <h2 align="center">Admin Panel</h2>
            <a href="mygoods">Мой список товаров!</a>

            <table align="center" class="tableInMDregist">
                <tr>
                    <th> id </th>
                    <th> Email </th>
                    <th> Password </th>
                    <th> Name </th>
                    <th> Surname </th>
                    <th> Age </th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    ArrayList<Users> users = (ArrayList<Users>) request.getAttribute("users");
                    for (Users u : users) {
                %>
                <tr>
                    <td><% out.print(u.getId()); %></td>
                    <td><% out.print(u.getEmail()); %></td>
                    <td><% out.print(u.getPassword()); %></td>
                    <td><% out.print(u.getName()); %></td>
                    <td><% out.print(u.getSurname()); %></td>
                    <td><% out.print(u.getAge()); %></td>
                    <td>
                        <form action="edituser" method="post">
                            <input type="hidden" name="idUser" value="<% out.print(u.getId()); %>">
                            <button type="submit" class="btn_MD_regist btnEdit">Edit</button>
                        </form>
                    </td>
                    <td>
                        <form action="deleteuser" method="post">
                            <input type="hidden" name="idUser" value="<% out.print(u.getId()); %>">
                            <button type="submit" class="btn_MD_regist btnDelete">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>

    <!--Реклама - иконки спонсоров/фирм/производителей-->
    <div class="Sponsors"></div>
</div>

<!--модальное окно-->
<div id="openModalRegist" class="ModalDialogRegist">
    <div>
        <h1 class="h1MDregist">Registration</h1>
        <table class="tableInMDregist">
            <tr>
                <td>
                    Log in or register for an opportunity to buy/sell a car, accessories or your services.
                    <br><br><br><br>
                </td>
                <td>
                    <form action="addUser" method="post" class="formInMDregist">
                        <input class="enterMail enter2" type="email" name="email" placeholder="Email" autofocus>
                        <input class="enterMail enter2" type="password" name="password" placeholder="Password">
                        <input class="enterMail enter2" type="password" name="password2" placeholder="Re-Password">
                        <input class="enterMail enter2" type="text" name="name" placeholder="Name">
                        <input class="enterMail enter2" type="text" name="surname" placeholder="Surname">
                        <input class="enterMail enter2" type="number" name="age" placeholder="   Age">
                        <a href="#close"><button type="button" class="btn_MD_regist btnCLose">Close</button></a>
                        <button type="submit" class="btn_MD_regist btnEnter">Enter</button>
                    </form>
                </td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>