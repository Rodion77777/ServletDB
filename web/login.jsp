<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SALE RACECAR</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="style_2.css">
    <link rel="stylesheet" href="style_3.css">
    <link rel="stylesheet" href="ModalDialogStyle.css">
    <style type="text/css">
        body {
            background: no-repeat url(image/Fon/FonAuto2.jpg);
        }
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
        <a class="href" href="#"><button class="button_menu">Menu</button></a>
        <a class="href" href="#"><button class="button_menu">Contact</button></a>
        <a class="href" href="#openModalRegist"><button class="button_menu">Regist</button></a>

        <div class="div_MainMenu_logPass">
            <form action="loginuser" method="get">
                <input class="enterMail" type="email" name="email" placeholder="Login/Email" autofocus>
                <input class="enterMail" type="password" name="password" placeholder="Password">
                <button type="submit" class="menu_button_enter">Enter</button>
            </form>
        </div>
    </div>

    <!--Альбом в котором будут рандомно пролистываются фото из новостей-->
    <!--расположен по центру экрана-->
    <div class="divAlbum">
            <a href="#"><img class="ImgAlbum" src="image/Album/Nissan_Silvia_1.jpg"/></a>
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