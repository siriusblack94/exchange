package test


import java.sql.*;

public class ConnectMysql {

    public static void main(String[] args) {
        //声明Connection对象
        Connection con;
        //驱动程序名
        String driver = "com.mysql.jdbc.Driver";
        //URL指向要访问的数据库名
        String url = "jdbc:mysql://39.107.94.92:3306/ex_trade";
        //MySQL配置时的用户名
        String user = "root";
        //MySQL配置时的密码
        String password = "X4AuFk9NSBjd72g5RbGz0ohcqIPryU";
        //遍历查询结果集
        try {
            //加载驱动程序
            Class.forName(driver);
            //1.getConnection()方法，连接MySQL数据库！！
            con = DriverManager.getConnection(url, user, password);
            if (!con.isClosed())
                System.out.println("Succeeded connecting to the Database!");
            //2.创建statement类对象，用来执行SQL语句！！
            String sql = "select sell_user_id from turnover_order WHERE   group by sell_user_id ";
            String accountSelect = "select * from  WHERE   group by sell_user_id ";

            PreparedStatement statement = con.prepareStatement(accountSelect);
            //要执行的SQL语句

            //3.ResultSet类，用来存放获取的结果集！！
            ResultSet rs = statement.executeQuery(accountSelect);
            rs.

                    String id = null;
            while (rs.next()) {
                //获取stuname这列数据
                job = rs.getString("job");
                //获取stuid这列数据
                id = rs.getString("ename");

                //输出结果
                System.out.println(id + "\t" + job);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException e) {
            //数据库驱动类异常处理
            System.out.println("Sorry,can`t find the Driver!");
            e.printStackTrace();
        } catch (SQLException e) {
            //数据库连接失败异常处理
            e.printStackTrace();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            System.out.println("数据库数据成功获取！！");
        }
    }

}