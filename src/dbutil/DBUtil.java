package dbutil;

import entities.Goods;
import entities.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.lang.Integer.parseInt;

public class DBUtil {

    private Connection connection;

    public DBUtil() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/myjdbc", "root", "admin");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addUser(String email, String password, String name, String surname, int age) {
        try {
            Statement st = connection.createStatement();
            st.executeUpdate("INSERT INTO users (email, password, name, surname, age) " +
                    "VALUES (\"" + email + "\",\"" + password + "\",\"" + name + "\",\"" + surname + "\"," + age + ")");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Users> listUsers() {
        ArrayList<Users> usersList = new ArrayList();
        try {
            Statement st = connection.createStatement();
            ResultSet result = st.executeQuery("SELECT id, email, password, name, surname, age FROM users ORDER BY id ASC");
            while (result.next()) {
                int id = result.getInt("id");
                String email = result.getString("email");
                String password = result.getString("password");
                String name = result.getString("name");
                String surname = result.getString("surname");
                int age = result.getInt("age");
                Users u = new Users(id, email, password, name, surname, age);
                usersList.add(u);
            }
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usersList;
    }


    public void deleteUser(String idUser) {
        try {
            Statement st = connection.createStatement();
            st.executeUpdate("DELETE FROM users WHERE id = \"" + idUser + "\"");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Users getUserById(int id) {
        Users getUser = null;
        for (Users x : listUsers()) {
            if (id == x.getId()) {
                getUser = x;
            }
        }
        return getUser;
    }

    public void updateUser(String email, String password, String name, String surname, int age, String id) {
        try {
            Statement st = connection.createStatement();
            st.executeUpdate("UPDATE users SET  email=\"" + email + "\", password=\"" + password + "\",name=\"" + name + "\",surname=\"" + surname + "\",age=" + age + "  WHERE id = \"" + id + "\"");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Users getUserByEmailAndPassword(String email, String password) {
        Users userEmpty = null;
        for (Users y : listUsers()) {
            if (y.getEmail().equals(email) && y.getPassword().equals(password)) {
                userEmpty = y;
            }
        }
        return userEmpty;
    }

    public ArrayList<Goods> showMyGoods(Users u) {

        int get_id_user = u.getId();

        System.out.println(get_id_user + " USER ID I KNOW!!!!! ->>>>>>>>>>");

        ArrayList<Goods> listGoods = new ArrayList<Goods>();
        try {
//            Statement st = connection.createStatement();

            PreparedStatement preparedStatement = null;
            preparedStatement = connection.prepareStatement("SELECT * FROM goods WHERE id_user = ?");
            preparedStatement.setInt(1, get_id_user);
            ResultSet result = preparedStatement.executeQuery();


//            ResultSet result = st.executeQuery("SELECT * FROM goods WHERE id_user = \"" + get_id_user + "\" ORDER BY id ASC");
            while (result.next()) {

                int id = result.getInt("id");
                int id_user = result.getInt("id_user");
                int published = result.getInt("published");
                String date = result.getString("date");
                String time = result.getString("time");
                int view_count = result.getInt("view_count");
                int price = result.getInt("price");
                String description = result.getString("description");
                String photo = result.getString("photo");
                String title = result.getString("title");

                Goods g = new Goods(id, id_user, published, date, time, view_count, price, description, photo, title);


                listGoods.add(g);
            }
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listGoods;
    }


    public void deleteGoodsById(String idGoods) {

        try {
            Statement st = connection.createStatement();
            st.executeUpdate("DELETE FROM goods WHERE id = \"" + idGoods + "\"");
            System.out.println("УДАЛЕНИЕ В ПРОЦЕССЕ!---------------->>>>");
            System.out.println(idGoods + "NUMBER OF GOODS!");
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Goods getGoodsById(String idG) {

        Goods goods = null;

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM goods WHERE id= \"" + idG + "\"  ");

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int idUser = resultSet.getInt("id_user");
                int published = resultSet.getInt("published");
                String date = resultSet.getString("date");
                String time = resultSet.getString("time");
                int viewCount = resultSet.getInt("view_count");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String photo = resultSet.getString("photo");
                String title = resultSet.getString("title");

                goods = new Goods(id, idUser, published, date, time, viewCount, price, description, photo, title);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return goods;
    }
}
