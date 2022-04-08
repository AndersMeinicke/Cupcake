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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "orderlinje", value = "/orderlinje")
public class orderlinje extends HttpServlet {
    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        ServletContext context = getServletContext();
        HttpSession session = request.getSession();
        String sqlorderlinje = "SELECT * FROM cupcake.ordrelinje;";
//        String gettopNamesql = "SELECT * FROM cupcake.top WHERE Top_ID ='?';";
//        String getbottomNamesql = "SELECT * FROM cupcake.bottom WHERE Bottom_ID ='?';";
        List<Orderlinje> orderlinjeLists = new ArrayList<>();

        try {
            connectionPool.getConnection();
            try (PreparedStatement ps = connectionPool.getConnection().prepareStatement(sqlorderlinje)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderlineID = rs.getInt("Ordrelinje_ID");
                    int bottomID = rs.getInt("Bottom_ID");
                    int topID = rs.getInt("Top_ID");
                    List<Tops> toplist = (ArrayList<Tops>) context.getAttribute("toplist");
                    List<Bottoms> bottomlist = (ArrayList<Bottoms>) context.getAttribute("bottomlist");

                    //Optional<Tops> topsOptional = toplist.stream().filter(item -> item.getTopID() == topID).findFirst();
                   // Tops top = topsOptional.orElseThrow(() -> new RuntimeException("Toppen ekistere ikke!") );


                    Tops top = null;
                    Bottoms bottom = null;
                    for (int i = 0; i < toplist.size(); i++) {
                        if (toplist.get(i).getTopID() == topID) {
                            top = toplist.get(i);
                        }

                    }
                    for (int i = 0; i < bottomlist.size(); i++) {
                        if (bottomlist.get(i).getBottomID() == bottomID) {
                            bottom = bottomlist.get(i);
                        }

                    }


                    int quantity = rs.getInt("Quantity");
                    Orderlinje orderlinje = new Orderlinje(orderlineID, bottom, top, quantity);
                    orderlinjeLists.add(orderlinje);
                }
                session.setAttribute("ordrelinjelist", orderlinjeLists);
                request.getRequestDispatcher("orderLinje.jsp").forward(request, response);
            }
        } catch (SQLException e) {

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

