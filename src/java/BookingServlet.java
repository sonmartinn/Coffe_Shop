

import Connection.SQLDataAccess;
import java.io.IOException;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    public void addBooking(String name, String email, String phone, String date, String time, String guests) {
        SQLDataAccess db = new SQLDataAccess();
        String sql = "INSERT INTO customer (name, email, phone, date, time, guests) VALUES (?, ?, ?, ?, ?, ?)";
        Object[] param = {name, email, phone, date, time, guests};
        db.ExecuteSQL(sql, param);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String guests = request.getParameter("guests");

        BookingServlet bookingServlet = new BookingServlet();
        bookingServlet.addBooking(name, email, phone, date, time, guests);


        // Tiếp tục xử lý và trả về kết quả cho client
//        response.setContentType("text/html;charset=UTF-8");
//        response.getWriter().println("<h1>Đặt bàn thành công!</h1>");

        RequestDispatcher dispatcher = request.getRequestDispatcher("bookingDetail.jsp");
        dispatcher.forward(request, response);
    }
}


