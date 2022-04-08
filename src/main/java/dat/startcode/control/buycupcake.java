package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.Bottoms;
import dat.startcode.model.entities.Tops;
import dat.startcode.model.exceptions.DatabaseException;
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
        ServletContext context = getServletContext();
        HttpSession session = request.getSession();
        String sqlbottom = "SELECT * FROM cupcake.bottom;";
        String sqltop = "SELECT * FROM cupcake.top;";
        List<Bottoms> bottomsList = new ArrayList<>();
        List<Tops> topsList = new ArrayList<>();
        try{connectionPool.getConnection();
            try(PreparedStatement ps = connectionPool.getConnection().prepareStatement(sqlbottom)){
               ResultSet rs = ps.executeQuery();
               while (rs.next()){
                   int bottomID = rs.getInt("Bottom_ID");
                   String bottomName = rs.getString("Bottom_Name");
                   int bottomPricing = rs.getInt("Pricing");
                  Bottoms bottoms = new Bottoms(bottomID,bottomName,bottomPricing);
                   bottomsList.add(bottoms);
               }
                session.setAttribute("bottomlist", bottomsList);
                context.setAttribute("bottomlist", bottomsList);

            }
            try(PreparedStatement ps = connectionPool.getConnection().prepareStatement(sqltop)){
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    int topID = rs.getInt("Top_ID");
                    String topName = rs.getString("Top_Name");
                    int topPricing = rs.getInt("Pricing");
                    Tops tops = new Tops(topID,topName,topPricing);
                    topsList.add(tops);
                }
                session.setAttribute("toplist",topsList);
                context.setAttribute("toplist",topsList);
                request.getRequestDispatcher("buyCupcake.jsp").forward(request,response);
            }
        }catch (SQLException e){

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String makeOrdrelinjeSql = "INSERT INTO cupcake.ordrelinje (Bottom_ID, Top_ID, Quantity) VALUES (?, ?, ?);";
        int bottomID = Integer.parseInt(request.getParameter("bottom"));;
        int topID = Integer.parseInt(request.getParameter("top"));;
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        try{connectionPool.getConnection();
            try(PreparedStatement ps = connectionPool.getConnection().prepareStatement(makeOrdrelinjeSql)){
                ps.setInt(1,bottomID);
                ps.setInt(2,topID);
                ps.setInt(3,quantity);
                ps.executeUpdate();
            }
            request.getRequestDispatcher("buyCupcake.jsp").forward(request,response);
        }
        catch (SQLException e){
            session.setAttribute("error","der skete en fejl");
            request.getRequestDispatcher("buyCupcake.jsp").forward(request,response);
        }
    }
}
