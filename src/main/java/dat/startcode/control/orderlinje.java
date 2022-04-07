package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.Bottoms;
import dat.startcode.model.entities.Orderlinje;
import dat.startcode.model.entities.Tops;
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

@WebServlet(name = "orderlinje", value = "/orderlinje")
public class orderlinje extends HttpServlet {
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
        String sqlorderlinje = "SELECT * FROM cupcake.ordrelinje;";
        //String sqltop = "SELECT * FROM cupcake.top;";
        List<Orderlinje> orderlinjeLists = new ArrayList<>();
        //List<Tops> topsList = new ArrayList<>();
        try{connectionPool.getConnection();
            try(PreparedStatement ps = connectionPool.getConnection().prepareStatement(sqlorderlinje)){
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    int orderlineID = rs.getInt("Ordrelinje_ID");
                    int bottomID = rs.getInt("Bottom_ID");
                    int topID = rs.getInt("Top_ID");
                    int quantity = rs.getInt("Quantity");
                    Orderlinje orderlinje = new Orderlinje(orderlineID,bottomID,topID,quantity);
                    orderlinjeLists.add(orderlinje);
                }
                session.setAttribute("ordrelinjelist", orderlinjeLists);
                request.getRequestDispatcher("orderLinje.jsp").forward(request,response);
            }
        }catch (SQLException e){

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

