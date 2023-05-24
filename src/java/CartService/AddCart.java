package CartService;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import CapheClass.item;
import CapheClass.SanPham;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/AddCart"})
public class AddCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            // Lấy thông tin sản phẩm được thêm vào từ yêu cầu HTTP
        int id=Integer.parseInt(request.getParameter("masp"));
        String productName = request.getParameter("productName");
        int price = Integer.parseInt(request.getParameter("price"));
        String image= request.getParameter("image");
        String mota = request.getParameter("mota");
        int maloai = Integer.parseInt(request.getParameter("maloai"));
        
        // Lấy giỏ hàng từ Session
        HttpSession session = request.getSession();
        SanPham sp = new SanPham(id, productName, price, image, mota, maloai);
        List<item> cart=null;
        // Nếu giỏ hàng chưa được khởi tạo, tạo mới giỏ hàng
        if (session.getAttribute("cart") == null) {
              cart = new ArrayList<>();
        } else {
            cart = (List<item>)session.getAttribute("cart");
        }
        // Kiểm tra sản phẩm có trong giỏ hàng chưa
        boolean check=false;
            for (item item : cart){
                if (item.getSanpham().getId()==sp.getId()) {
                    // Sản phẩm đã có trong giỏ hàng, tăng số lượng lên 1
                    item.setSoluong(item.getSoluong() + 1);
                    item.setTotalprice(item.getTotalprice()+sp.getGia());
                    check = true;
                    break;
                } 
            }
       
        if (!check) {
            // Sản phẩm chưa có trong giỏ hàng, tạo mới item và thêm vào giỏ hàng
            item newItem = new item();
            newItem.setId(id);
            newItem.setSanpham(sp);
            newItem.setSoluong(1);
            newItem.setTotalprice(sp.getGia());
            cart.add(newItem);
            // Cập nhật lại giỏ hàng trong session
            session.setAttribute("cart", cart);
        }
        

    // Chuyển hướng về trang giỏ hàng
        response.sendRedirect(request.getContextPath() + "/Order.jsp");
    }
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
