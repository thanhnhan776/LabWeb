/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.BookingDAO;
import dao.DiscountDAO;
import entities.TblBooking;
import entities.TblBookingDetails;
import entities.TblDiscount;
import entities.TblStatus;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NhanTT
 */
public class CartService {

    private HttpSession session;

    public CartService(HttpSession session) {
        this.session = session;
    }

    public boolean addRoomToCart(TblBookingDetails detail) {
        if (!this.ensureCartExist()) {
            return false;
        }

        TblBooking cart = this.getCart();

        boolean isFound = false;
        for (TblBookingDetails d : cart.getTblBookingDetailsCollection()) {
            if (Objects.equals(d.getRoomId().getId(), detail.getRoomId().getId())) {
                d.setAmount(d.getAmount() + detail.getAmount());
                isFound = true;
                break;
            }
        }

        if (!isFound) {
            detail.setBookingId(cart);
            cart.getTblBookingDetailsCollection().add(detail);
        }
        return true;
    }

    public TblBooking getCart() {
        if (session == null) {
            return null;
        }
        TblBooking cart = (TblBooking) session.getAttribute("CART");
        return cart;
    }

    public boolean ensureCartExist() {
        if (session == null) {
            return false;
        }
        TblBooking cart = this.getCart();
        if (cart == null) {
            cart = new TblBooking();
            cart.setTblBookingDetailsCollection(new ArrayList<>());
            this.setCart(cart);
        }
        return true;
    }

    public boolean setCart(TblBooking cart) {
        if (session == null) {
            return false;
        }
        session.setAttribute("CART", cart);
        return true;
    }
    
    public boolean saveCart(String discountCode) {
        DiscountDAO discountDAO = new DiscountDAO();
        TblDiscount discount = discountDAO.getDiscountByCode(discountCode);

        TblBooking cart = this.getCart();
        if (discount != null) {
            cart.setDiscountPercent(discount.getDiscountPercent());
        }
        
        cart.setDateCreated(Date.from(Instant.now()));
        TblStatus status = new TblStatus(1);
        cart.setStatusId(status);

        BookingDAO bookingDAO = new BookingDAO();
        TblBooking result = bookingDAO.saveBooking(cart);

        return result != null;
    }
}
