package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.Bottoms;
import dat.startcode.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "buycupcake", value = "/buycupcake")
public class buycupcake extends HttpServlet {
    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException
    {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String sql = "SELECT * FROM cupcake.bottom;";
        List<Bottoms> bottomsList = new ArrayList<>();
        try{connectionPool.getConnection();
            try(PreparedStatement ps = connectionPool.getConnection().prepareStatement(sql)){
               ResultSet rs = ps.executeQuery();
               while (rs.next()){
                   int bottomID = rs.getInt("Bottom_ID");
                   String bottomName = rs.getString("Bottom_Name");
                   int pricing = rs.getInt("Pricing");
                  Bottoms bottoms = new Bottoms(bottomID,bottomName,pricing);
                   bottomsList.add(bottoms);
                   //TODO: This sends an error code, fix it.
               }
                session.setAttribute("bottomlist", bottomsList);
               request.getRequestDispatcher("buyCupcake.jsp").forward(request,response);
            }
        }catch (SQLException e){

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
