package com.jeju.JejuBnB.reservation.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.account.model.service.AccountService;
import com.jeju.JejuBnB.account.model.vo.Account;
import com.jeju.JejuBnB.mycoupon.model.service.MyCouponService;
import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;
import com.jeju.JejuBnB.reservation.model.service.ReservationService;
import com.jeju.JejuBnB.reservation.model.vo.Reservation;
import com.jeju.JejuBnB.room.model.service.RoomService;
import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.Room_File;

@Controller
public class ReservationController {
   private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
   
   @Autowired
   private ReservationService reservationService;
   
   @Autowired
   private RoomService roomService;
   
   @Autowired
   private AccountService accountService;
   
   @Autowired
   private MyCouponService mycouponService;
   
   //값 담아서 숙소 예약페이지 이동 & 쿠폰가져오기
   @RequestMapping(value="reserv.do", method=RequestMethod.POST)
   public ModelAndView insertReserv(@RequestParam(value="room_no") int room_no, Reservation reserv, ModelAndView mv,
         @RequestParam(value="user_id") String user_id, 
         @RequestParam(value="a_num", defaultValue="1") int a_num, 
         @RequestParam(value="c_num", defaultValue="0") int c_num, 
         @RequestParam(value="i_num", defaultValue="0") int i_num, HttpServletRequest request) throws Exception {   
         
      if(reserv != null) {
         Room room = roomService.selectRoom(room_no);
         reservationService.insertReserv(reserv);   
         ArrayList<MyCoupon> coup = reservationService.selectCoupon(user_id);
         reserv= reservationService.selectReserv();
         ArrayList<Room_File> rflist = roomService.selectRFile(room_no);
         logger.info("reserv: " + reserv);   
         logger.info("coup: " + coup);   
         mv.addObject("reserv", reserv);
         mv.addObject("room", room);
         mv.addObject("mycoupon", coup);
         mv.addObject("rflist", rflist);
         mv.setViewName("reservation/reservationDetailView");
         
         try {                  
             Calendar cal = Calendar.getInstance();
                       
             String in = request.getParameter("checkin_date");   
             String out = request.getParameter("checkout_date");
             SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
             Date FirstDate =  (Date)format.parse(in);
              Date SecondDate = (Date)format.parse(out);        
              
              cal.setTime(FirstDate);                           
              int FirstDateWeek = cal.get(Calendar.DAY_OF_WEEK);
              int fmonth = (cal.get(Calendar.MONTH)) + 1;
              int mfmonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
              
              cal.setTime(SecondDate);
              int SecondDateWeek = cal.get(Calendar.DAY_OF_WEEK);
              int smonth = (cal.get(Calendar.MONTH)) + 1;
              int ssmonth = cal.getActualMinimum(Calendar.DAY_OF_MONTH);                   
              
              if((smonth - fmonth) > 0) {
                long cald = (mfmonth - FirstDate.getDate() + 1) + (SecondDate.getDate() - ssmonth + 1);
                logger.info("cald : " + cald);
                mv.addObject("cald", cald);
              }
              else if((smonth - fmonth) == 0) {
                long calDate =    SecondDate.getTime() - FirstDate.getTime();
                long calDateDays = calDate / (24*60*60*1000); 
                calDateDays = Math.abs(calDateDays);
                
                logger.info("calDateDays : " + calDateDays);
                logger.info("checkin : " + FirstDateWeek);
                logger.info("checkout : " + SecondDateWeek);
                
                 mv.addObject("checkin", FirstDateWeek);
                mv.addObject("checkout", SecondDateWeek);
                mv.addObject("date", calDateDays); 
              }

         } catch (Exception e) {
            e.printStackTrace();
         }         
      }
      return mv;
            
   }
   
   //결제 팝업
   @RequestMapping(value="payment.do", method=RequestMethod.GET)
   public String reservPayment(@RequestParam(value="room_no", required=false) int room_no, 
         @RequestParam(value="re_num", required=false) int re_num,
         @RequestParam(value="date", required=false, defaultValue="0") int date,
         @RequestParam(value="room_weekday", required=false) int room_weekday,
         @RequestParam(value="room_weekend", required=false) int room_weekend,  
         @RequestParam(value="cald", required=false, defaultValue="0") int cald, 
         @RequestParam(value="pay", required=false, defaultValue="0") int pay,
         @RequestParam(value="pay1", required=false, defaultValue="0") int pay1,
         Model model) throws Exception {   
      logger.info(" 1:" + room_no);
      logger.info(" date:" + date);
      logger.info("cald:" + cald);
      Room room = roomService.selectRoom(room_no);
      Reservation reserv = new Reservation();
       reserv = reservationService.selectReserv2(re_num); 
      logger.info(" room:" + room);
      logger.info(" reserv:" + reserv);
      model.addAttribute("room", room);
      model.addAttribute("date", date);
      model.addAttribute("reserv", reserv);
      model.addAttribute("cald", cald);
      model.addAttribute("pay", pay);
      model.addAttribute("pay1", pay1);
      logger.info(" pay:" + pay);
      logger.info(" pay1:" + pay1);

      return "reservation/popupPayment";      
   }
   
   //카카오페이 결제
   @RequestMapping(value="pay.do", method=RequestMethod.POST)
   public String kakaoPayment(@RequestParam(value="room_no", required=false) int room_no,
         @RequestParam(value="re_num", required=false) int re_num,
         @RequestParam(value="date", required=false, defaultValue="0") int date, 
         @RequestParam(value="cald", required=false, defaultValue="0") int cald,
         @RequestParam(value="pay", required=false, defaultValue="0") int pay,
         @RequestParam(value="pay1", required=false, defaultValue="0") int pay1,
         Model model, Reservation reserv)  {      
      logger.info(" 2:" + room_no);
      Room room = roomService.selectRoom(room_no);
      reserv = reservationService.selectReserv2(re_num);
      logger.info(" room:" + room);
      logger.info(" date:" + date);
      logger.info(" reserv:" + reserv);
      model.addAttribute("room_no", room_no);   
      model.addAttribute("date", date);
      model.addAttribute("room", room);
      model.addAttribute("reserv", reserv);
      model.addAttribute("cald", cald);
      model.addAttribute("pay", pay);
      model.addAttribute("pay1", pay1);
      return "reservation/Payment";         
   }

   //무통장 결제
   @RequestMapping(value="pay2.do", method=RequestMethod.POST)
   public String muPayment(@RequestParam(value="room_no", required=false) int room_no, 
         @RequestParam(value="date", required=false, defaultValue="0") int date, 
         @RequestParam(value="cald", required=false, defaultValue="0") int cald, 
         @RequestParam(value="pay", required=false, defaultValue="0") int pay,
         @RequestParam(value="pay1", required=false, defaultValue="0") int pay1,
         Model model)  {   
         Room room = roomService.selectRoom(room_no);
         Account acc = accountService.selectOne(room_no);
         logger.info("acc:" + acc);
         logger.info("date:" + date);
         logger.info("cald:" + cald);
         logger.info("room:" + room);
         logger.info(" pay:" + pay);
         logger.info(" pay1:" + pay1);
         model.addAttribute("date", date);
         model.addAttribute("room", room);
         model.addAttribute("account", acc);
         model.addAttribute("cald", cald);
         model.addAttribute("pay", pay);
         model.addAttribute("pay1", pay1);
         return "reservation/Payment2";         
   }
   
   
     //결제완료 페이지 이동
     @RequestMapping(value="success.do", method=RequestMethod.GET) 
     public String reservStationY(@RequestParam(value="room_no", required=false) int room_no,    
           @RequestParam(value="re_num", required=false) int re_num,  
           @RequestParam(value="date", required=false, defaultValue="0") int date, 
           @RequestParam(value="cald", required=false, defaultValue="0") int cald, 
           @RequestParam(value="pay", required=false, defaultValue="0") int pay,
           @RequestParam(value="pay1", required=false, defaultValue="0") int pay1,
           Model model, HttpServletRequest request) {
    
      Room room = roomService.selectRoom(room_no); 
      Reservation reserv = reservationService.selectReserv2(re_num);
      reservationService.updateReserv(reserv);
      logger.info("reservaa: " + reserv); 
      model.addAttribute("room_no", room_no);
      model.addAttribute("date", date); 
      model.addAttribute("room", room);
      model.addAttribute("reserv", reserv); 
      model.addAttribute("cald", cald);
      model.addAttribute("pay", pay);
      model.addAttribute("pay1", pay1);
      return "reservation/reservationSuccess"; 
     }
    
    
   
   //결제대기 페이지 이동
   @RequestMapping(value="reservST.do", method=RequestMethod.POST)
   public String reservStationN(@RequestParam(value="room_no", required=false) int room_no, 
         @RequestParam(value="date", required=false, defaultValue="0") int date, 
         @RequestParam(value="cald", required=false, defaultValue="0") int cald,
         @RequestParam(value="pay", required=false, defaultValue="0") int pay,
          @RequestParam(value="pay1", required=false, defaultValue="0") int pay1,
         Model model) {
      
      Room room = roomService.selectRoom(room_no);
      Account acc = accountService.selectOne(room_no);
      logger.info("room:" + room);
      logger.info("acc:" + acc);
      logger.info(" pay:" + pay);
      logger.info(" pay1:" + pay1);
      model.addAttribute("room", room);
      model.addAttribute("date", date);
      model.addAttribute("cald", cald);
      model.addAttribute("account", acc);
      model.addAttribute("pay", pay);
      model.addAttribute("pay1", pay1);
      return "reservation/reservationWaitView";
   }
   
   //결제완료 후 페이지 이동
   @RequestMapping(value="mm.do", method=RequestMethod.POST)
   public String reservStationM(@RequestParam(value="room_no", required=false) int room_no, Model model) {
         model.addAttribute("room_no", room_no);
         return "common/main";
   }
   
   @RequestMapping(value="checkIncome.do", method=RequestMethod.POST)
   public ModelAndView checkIncome(Reservation reservation, ModelAndView mv) {   
      int rv = reservationService.updateReserv(reservation);
      if(rv > 0) {
         mv.setViewName("member/hostIncomePage");
      }else {
         mv.addObject("message", "결제 완료처리를 실패 했습니다.");
         mv.setViewName("common/error");
      }      
      return mv;
   }
   //나중에 저기 빨간색 updateStateCoupon만 쿠폰 사용해서 결제 하면 업데이트 되도록 추가 
   @RequestMapping(value="TEST.do", method=RequestMethod.POST)
   public ModelAndView updateStateCoupon(Reservation reservation, ModelAndView mv) {   
      int rv = reservationService.updateStateCoupon(reservation);
      if(rv > 0) {
         mv.setViewName("member/hostIncomePage");
      }else {
         mv.addObject("message", "결제 완료처리를 실패 했습니다.");
         mv.setViewName("common/error");
      }
      
      return mv;
   }
   

}





