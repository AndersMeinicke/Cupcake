package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.Bottoms;
import dat.startcode.model.entities.Tops;
import dat.startcode.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "showusers", value = "/showusers")
public class showusers extends HttpServlet {
    ConnectionPool connectionPool;
    @Override
    public void init() throws ServletException
    {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String sql = "SELECT * FROM cupcake.user;";
        List<String> userNames = new ArrayList<>();
        try{connectionPool.getConnection();
            try(PreparedStatement ps = connectionPool.getConnection().prepareStatement(sql)){
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    String userName = rs.getString("Bottom_Name");
                    userNames.add(userName);
                }
                session.setAttribute("usernames", userNames);
            }
        }catch (SQLException e){

        }
        request.getRequestDispatcher("showUsers.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
