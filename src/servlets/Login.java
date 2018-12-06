package servlets;

import dbutil.DBUtil;
import entities.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginuser")
public class Login extends HttpServlet {

    DBUtil dbUtil;

    public Login() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email != null && password != null){
            Users checkedUser = dbUtil.getUserByEmailAndPassword(email, password);

            if (checkedUser != null && request.getSession() != null) {

//            HttpSession session = request.getSession();   //long way
//            session.setAttribute("login", checkedUser);

                request.getSession().setAttribute("login", checkedUser);   // create session and send obj
                response.sendRedirect("pages");

            } else {
                response.sendRedirect("/login.jsp");}
        } else {

        }


    }
}
