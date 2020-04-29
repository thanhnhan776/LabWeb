/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.BookingDetailsDAO;
import dao.RoomDAO;
import entities.TblBookingDetails;
import entities.TblRoom;
import java.util.Date;
import java.util.List;

/**
 *
 * @author NhanTT
 */
public class RoomService {
    /**
     * return room by id with available amount in period
     * @param roomId
     * @param checkinDate
     * @param checkoutDate
     * @return 
     */
    public TblRoom getRoomByIdInPeriod(int roomId, Date checkinDate, Date checkoutDate) {
        RoomDAO roomDAO = new RoomDAO();
        TblRoom room = roomDAO.getRoomById(roomId);
        
        BookingDetailsDAO detailsDAO = new BookingDetailsDAO();
        List<TblBookingDetails> details = detailsDAO.getRoomBookingDetailsInPeriod(room, checkinDate, checkoutDate);
        
        for (TblBookingDetails detail : details) {
            room.setAmount(room.getAmount() - detail.getAmount());
        }
        
        return room;
    }
}
