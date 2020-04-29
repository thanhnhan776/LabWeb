/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entities.TblBooking;
import entities.TblBookingDetails;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CartService;

/**
 *
 * @author NhanTT
 */
@WebServlet(name = "UpdateCartServlet", urlPatterns = {"/UpdateCartServlet"})
public class UpdateCartServlet extends HttpServlet {

    private final String viewCartPage = "viewCart.jsp";
    private final String errorPage = "error.jsp";

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

        String url = viewCartPage;

        String btAction = request.getParameter("btAction");
        String amountStr = request.getParameter("amount");
        String detailPositionStr = request.getParameter("detailPosition");

        try {
            int amount = amountStr == null ? 1 : Integer.parseInt(amountStr);
            int detailPosition = amountStr == null ? 1 : Integer.parseInt(detailPositionStr);

            CartService cartService = new CartService(request.getSession());
            TblBooking cart = cartService.getCart();
            List<TblBookingDetails> details = (List<TblBookingDetails>) cart.getTblBookingDetailsCollection();

            if ("Update".equals(btAction)) {
                details.get(detailPosition).setAmount(amount);
            } else if ("Delete".equals(btAction)) {
                details.remove(detailPosition);
            }
            cart.setTblBookingDetailsCollection(details);
            cartService.setCart(cart);
        } catch (NumberFormatException ex) {
            url = errorPage;
            Logger.getLogger(UpdateCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
