package com.jeju.JejuBnB.room.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.account.model.service.AccountService;
import com.jeju.JejuBnB.account.model.vo.Account;
import com.jeju.JejuBnB.filter.model.service.FilterService;
import com.jeju.JejuBnB.filter.model.vo.Amenity;
import com.jeju.JejuBnB.filter.model.vo.Build_type;
import com.jeju.JejuBnB.filter.model.vo.Facility;
import com.jeju.JejuBnB.filter.model.vo.Rule;
import com.jeju.JejuBnB.myroom.model.service.MyRoomService;
import com.jeju.JejuBnB.myroom.model.vo.MyRoom;
import com.jeju.JejuBnB.review.model.service.ReviewService;
import com.jeju.JejuBnB.review.model.vo.Review;
import com.jeju.JejuBnB.room.model.service.RoomService;
import com.jeju.JejuBnB.room.model.vo.CheckTime;
import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.RoomLatLng;
import com.jeju.JejuBnB.room.model.vo.Room_File;

@Controller
public class RoomController {
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private RoomService roomService;
	

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private FilterService filterService;
	
	@Autowired
	private MyRoomService myroomService;
	
	@Autowired
	private AccountService accountService;
	// ????????? ??????
	@RequestMapping("roomlist.do")
	public String SelectList(HttpServletRequest request, Model model, HttpSession session) {
		int limit = 8;
		int currentPage = 1;
		
		//?????? ??? ??? ?????? ?????? ??????
		Calendar cal = Calendar.getInstance();
		String year = (""+(cal.get(Calendar.YEAR)));
		String inMonth = "" + (cal.get(Calendar.MONTH) + 1);
		String inday = "" + cal.get(Calendar.DAY_OF_MONTH);		
		String outday = "" + (cal.get(Calendar.DAY_OF_MONTH) + 1);
		int week = cal.get(Calendar.DAY_OF_WEEK);
		int people = 1;
		if(cal.get(Calendar.MONTH) + 1 < 10) {
			inMonth ="0"+inMonth;
		}
		if(cal.get(Calendar.DAY_OF_MONTH) < 10) {
			inday = "0" + inday;
		}
		if(cal.get(Calendar.DAY_OF_MONTH)+1 < 10) {
			outday = "0" + outday;
		}
		String outMonth = inMonth;
		String checkin = year + inMonth + inday;
		String checkout = year + outMonth + outday;

		
		// ????????? ?????? ????????? ???
		RoomLatLng seR = new RoomLatLng();
		RoomLatLng neR = new RoomLatLng();
		if(request.getParameter("swLat") != null) {
			double swLat = Double.parseDouble(request.getParameter("swLat"));
			double swLng = Double.parseDouble(request.getParameter("swLng"));
			double neLat = Double.parseDouble(request.getParameter("neLat"));
			double neLng = Double.parseDouble(request.getParameter("neLng"));
			seR = new RoomLatLng();
			neR = new RoomLatLng();
			
			seR.setRoom_lat(swLat);
			seR.setRoom_lng(swLng);
			neR.setRoom_lat(neLat);
			neR.setRoom_lng(neLng);
		}
		
		// ????????? ??????
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("center") != null) {
			String center = request.getParameter("center");
			String[] srr = center.split(",");
			String centerLat = srr[0].substring(1);
			String centerLng = srr[1].substring(0, srr[1].length()-1);
			String level = request.getParameter("level");
			
			model.addAttribute("level",level);
			model.addAttribute("centerLat",centerLat);
			model.addAttribute("centerLng",centerLng);

		}
		//??? ??????
		ArrayList<Room> list = null;
		// ????????? ??????(????????????)
		ArrayList<Room> roomNo = null;
		
		// ?????????????????? ????????? ??????
		if (request.getParameter("checkin") != null && request.getParameter("checkin").length() > 1 && !request.getParameter("checkin").equals("null")) {
			// ???????????? ????????? ????????? ??????
			
			checkin = request.getParameter("checkin");
			checkout = request.getParameter("checkout");
			people = Integer.parseInt(request.getParameter("people"));
			// ????????? ??????????????? ????????? ????????? ??????
			// ??????????????? ?????????????????? ??????
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
			Date chDate = null;
			

			if(checkin.length() > 8) {
				inMonth = checkin.substring(5,7);
				inday = checkin.substring(8);
				outMonth = checkout.substring(5,7);
				outday = checkout.substring(8);
				try {
					chDate = sdf.parse(checkin);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				cal.setTime(chDate);
				week = cal.get(Calendar.DAY_OF_WEEK);
				String [] chin = checkin.split("-");
				checkin = chin[0] +  chin[1] + chin[2];
				
				String [] chou = checkout.split("-");
				checkout = chou[0] +  chou[1] + chou[2];
				

			}else {
				inMonth = checkin.substring(4, 6);
				inday = checkin.substring(6);
				outMonth = checkout.substring(4, 6);
				outday = checkout.substring(6);
				try {
					chDate = sdf.parse(checkin);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				cal.setTime(chDate);
				week = cal.get(Calendar.DAY_OF_WEEK);
				
			}
			// ???????????? ????????? ????????? ????????? ?????? ?????? ????????????
			logger.info(people + "");
			roomNo = roomService.selectChkRNList(checkin, checkout,people);
			
			// ???????????? ?????? select ??? ?????????
			if(request.getParameter("swLat") != null) {
				
				// ????????? ???????????? ?????? ???????????? ?????? ????????? ??????
				list = roomService.selectLatLng(roomNo, currentPage, limit,  seR, neR);

			}else {
				// ????????? ???????????? ?????? ??????
				list = roomService.selectChkList(roomNo, currentPage, limit);

			}		
			
		} else {  // ?????????????????? ???????????? ?????? ?????? ????????? ????????? ??????
			
			if(request.getParameter("swLat") != null) {
				// ????????? ???????????? ?????? ?????? ?????? ????????? ??????
				list = roomService.selectLatLngJustList(currentPage, limit, seR, neR);
			}else {
				// ????????? ???????????? ?????? ?????? ?????? ?????? ??????
				list = roomService.selectList(currentPage, limit);		
			}
		}
		
		int listCount= roomService.getListCountOnlyRoom(roomNo);
		if(request.getParameter("swLat") != null) {
			listCount = roomService.getListCount(seR, neR, roomNo);
		}
		
		int maxPage = (int) (((double) listCount / limit) + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		logger.info("" + endPage);
		//????????? ????????? ?????? ??? ????????? ?????? ????????????
		if(request.getParameter("userid") != null) {
		ArrayList<MyRoom> mlist = myroomService.selectMyRoom(request.getParameter("userid"));
		model.addAttribute("mlist", mlist);
		}
		
		// ???????????? ????????????
		ArrayList<Room_File> rflist = roomService.selectRoomFileList(list);
		model.addAttribute("rflist",rflist);
		
		// ?????? ?????? ??????, ?????? ????????????
		ArrayList<Review> rvlist = reviewService.selectReviewList(list);		
		model.addAttribute("rvlist", rvlist);
		/*
		 * // ?????? ???????????? ???????????? ArrayList<RoomLatLng> roomLL =
		 * roomService.selectRoomLatLng(); model.addAttribute("roomLL", roomLL);
		 */
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		logger.info("aaaaaaa"+checkin);

		if (list != null) {
			model.addAttribute("people", people);
			model.addAttribute("inMonth", inMonth);
			model.addAttribute("inday", inday);
			model.addAttribute("outMonth", outMonth);
			model.addAttribute("outday", outday);
			model.addAttribute("week", week);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("listCount", listCount);
			model.addAttribute("list", list);
			return "room/roomListView";

		} else {
			model.addAttribute("message", "????????? ?????? ??????");
			return "common/error";
		}
	
	}
	// ?????? ??????
	@RequestMapping(value = "roominsert.do", method = RequestMethod.POST)
	public String insertRoom(Room room, RoomLatLng rll, Account acc, Model model, CheckTime ct, MultipartHttpServletRequest mrequest,
			HttpServletRequest request,	@RequestParam("address") String address) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		room.setCheckout_time(ct.getOuthour() + ct.getOutminute());
		room.setCheckin_time(ct.getInhour() + ct.getInminute());
		if(address != null) {
			room.setRoom_address(room.getRoom_roadaddress() +" " + address);
		}		
		int result = roomService.insertRoom(room);
		int roomno = roomService.selectRoomNo(room.getUser_id());
		
		acc.setRoom_no(roomno);
		int account = accountService.insertAccount(acc);
		logger.info(acc.toString());
		logger.info(room.toString());
		List<MultipartFile> fileList = mrequest.getFiles("file");
		ArrayList<Room_File> rflist = new ArrayList<Room_File>();
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/roomFiles");
		int i = 0;
		for (MultipartFile mf : fileList) {
			i += 1;
			Room_File rf = new Room_File();
			String original = mf.getOriginalFilename();
			rf.setOriginal_file(original);
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i;
			rename += "." + original.substring(original.lastIndexOf(".") + 1);

			try {
				mf.transferTo(new File(savePath1 + "\\" + rename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				model.addAttribute("message", "???????????? ?????? ??????");
				return "common/error";
			}

			rf.setOriginal_file(original);
			rf.setRename_file(rename);
			rf.setRoom_no(roomno);
			rflist.add(rf);
		}
		
		
		rll.setRoom_no(roomno);
		logger.info(rll.toString());
		int result3 = roomService.insertRoomLatLnt(rll);
		int result2 = roomService.insertRoomFile(rflist);
		if (result > 0) {
			return "redirect:/moveDetailView.do?room_no="+roomno;
		} else {
			model.addAttribute("message", "??? ?????? ??????");
			return "common/error";
		}

	}
	// ?????? ??????????????? ??????
	@RequestMapping("moveRoomWrite.do")
	public String moveRoomWrite(Model model) {
		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		return "room/roomWriteForm";
	}
	// ????????? ????????? ?????? ??????
	@RequestMapping("moveMyRoom.do")
	public String moveMyRoom(@RequestParam("userid") String userid, Model model) {
		ArrayList<Room> list = roomService.selectUserRoom(userid);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "room/myRoomListView";
		} else {
			model.addAttribute("message", "???????????? ?????? ?????? ??????");
			return "common/error";
		}
	}

	//?????? ????????????  & ?????? ?????????
	@RequestMapping("moveDetailView.do")
	public ModelAndView moveDetail(ModelAndView mv, @RequestParam("room_no") int room_no) {
		Room room = roomService.selectRoom(room_no);
		Review review = reviewService.selectReviewAvg(room_no);
		ArrayList<Review> list = reviewService.selectReply(room_no);
		ArrayList<Room_File> rflist = roomService.selectRFile(room_no);
		logger.info(rflist.toString());
		if(room != null) {
			mv.setViewName("reservation/reservationListView");
			mv.addObject("room", room);
			mv.addObject("list", list);
			mv.addObject("review", review);
			mv.addObject("rflist", rflist);
			logger.info("room:" + room);
			logger.info("rflist:" + rflist);
		}else {
			mv.setViewName("common/error");
			mv.addObject("message", "????????? ?????? ??????");
		}
		return mv;
	}
	
	// ?????? ?????????????????? ??????
	@RequestMapping("moveUpdatView.do")
	public String moveUpdate(Model model, @RequestParam("roomno") int roomno) {
		Room room = roomService.selectRoom(roomno);
		ArrayList<Room_File> rflist = roomService.selectRoomFile(roomno);
		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		model.addAttribute("rflist", rflist);
		
		if(room != null) {
			model.addAttribute("room", room);
			return "room/roomUpdateForm";
		}else {
			model.addAttribute("message","????????? ??????????????? ?????? ??????");
			return "common/error";
		}
	}
	// ?????? ??????
	@RequestMapping("deleteRoom.do")
	public String deleteRoom(@RequestParam("roomno") int roomno, Model model) {
		int resuult4 = roomService.deleteroomLatLng(roomno);
		int result2 = roomService.deleteRoomFileList(roomno);
		int result3 = roomService.deleteReviewList(roomno);
		int result = roomService.deleteRoom(roomno);
		if(result > 0) {
			return "redirect:/roomlist.do";
		}else {
			model.addAttribute("message", "??? ?????? ??????");
			return "common/error";
		}
	}
	// ?????? ??????
	@RequestMapping(value="roomUpdate.do", method=RequestMethod.POST)
	public String roomUpdate(Room room, CheckTime ct, Model model, MultipartHttpServletRequest mrequest, HttpServletRequest request) {
		logger.info(room.toString());
		room.setCheckout_time("" + ct.getOuthour() + ct.getOutminute());
		room.setCheckin_time(""+ct.getInhour() + ct.getInminute());
		if(request.getParameter("address") != null) {
			room.setRoom_address(room.getRoom_roadaddress() +" " + request.getParameter("address"));
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		List<MultipartFile> fileList = mrequest.getFiles("files");
		if(fileList.size() != 0) {
			logger.info(fileList.toString() + " ?????? ?????? ??????");
		ArrayList<Room_File> rflist = new ArrayList<Room_File>();
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/roomFiles");
		int i = 0;
			for (MultipartFile mf : fileList) {
				i += 1;
				Room_File rf = new Room_File();
				String original = mf.getOriginalFilename();
				rf.setOriginal_file(original);
				String rename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i;
				rename += "." + original.substring(original.lastIndexOf(".") + 1);
				try {
					mf.transferTo(new File(savePath1 + "\\" + rename));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					model.addAttribute("message", "???????????? ?????? ??????");
					return "common/error";
				}
	
				rf.setOriginal_file(original);
				rf.setRename_file(rename);
				rf.setRoom_no(room.getRoom_no());
				rflist.add(rf);
			}
			int result2 = roomService.insertRoomFile(rflist);
		}
		int result = roomService.updateRoom(room);
		
		if(result > 0) {
			return "redirect:/moveDetailView.do?room_no="+room.getRoom_no();
		}else {
			model.addAttribute("message", "?????? ??????");
			return "common/error";
		}

	}
	// ??????????????? ?????? ??????
	@RequestMapping("moveRoomBList.do")
	public String moveRoomBList(Model model, HttpServletRequest request, HttpSession session) {
		int limit = 9;
		int currentPage = 1;		
		
		// ????????? ?????? ????????? ???
		RoomLatLng seR = new RoomLatLng();
		RoomLatLng neR = new RoomLatLng();
		if(request.getParameter("swLat") != null) {
			double swLat = Double.parseDouble(request.getParameter("swLat"));
			double swLng = Double.parseDouble(request.getParameter("swLng"));
			double neLat = Double.parseDouble(request.getParameter("neLat"));
			double neLng = Double.parseDouble(request.getParameter("neLng"));
			seR = new RoomLatLng();
			neR = new RoomLatLng();
			
			seR.setRoom_lat(swLat);
			seR.setRoom_lng(swLng);
			neR.setRoom_lat(neLat);
			neR.setRoom_lng(neLng);
		}
		
		// ????????? ??????
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("center") != null) {
			String center = request.getParameter("center");
			String[] srr = center.split(",");
			String centerLat = srr[0].substring(1);
			String centerLng = srr[1].substring(1, srr[1].length()-1);
			
			String level = request.getParameter("level");
			
			model.addAttribute("level",level);
			model.addAttribute("centerLat",centerLat);
			model.addAttribute("centerLng",centerLng);

		}
		//??? ??????
		ArrayList<Room> list = null;
		// ????????? ??????(????????????)
		ArrayList<Room> roomNo = null;
		
		// ?????????????????? ????????? ??????
		if (request.getParameter("checkin") != null && request.getParameter("checkin").length() > 1 && !request.getParameter("checkin").equals("null")) {
			// ???????????? ????????? ????????? ??????
			
			String checkin = request.getParameter("checkin");
			String checkout = request.getParameter("checkout");
			int people = Integer.parseInt(request.getParameter("people"));
			int week = Integer.parseInt(request.getParameter("week"));

			// ???????????? ????????? ????????? ????????? ?????? ?????? ????????????
			roomNo = roomService.selectChkRNList(checkin, checkout, people);
			
			// ???????????? ?????? select ??? ?????????
			if(request.getParameter("swLat") != null) {
				
				// ????????? ???????????? ?????? ???????????? ?????? ????????? ??????
				list = roomService.selectLatLng(roomNo, currentPage, limit, seR, neR);

			}else {
				// ????????? ???????????? ?????? ??????
				list = roomService.selectChkList(roomNo, currentPage, limit);

			}
			
			// ????????? ??????????????? ????????? ????????? ??????
			// ??????????????? ?????????????????? ??????
			logger.info(checkin+ ", " + checkout);
			String inMonth = checkin.substring(4, 6);
			String inday = checkin.substring(6);
			String outMonth = checkout.substring(4, 6);
			String outday = checkout.substring(6);		
			model.addAttribute("people", people);
			model.addAttribute("inMonth", inMonth);
			model.addAttribute("inday", inday);
			model.addAttribute("outMonth", outMonth);
			model.addAttribute("outday", outday);
			model.addAttribute("week", week);
			model.addAttribute("checkin", checkin);
			model.addAttribute("checkout", checkout);

		} else {  // ?????????????????? ???????????? ?????? ?????? ????????? ????????? ??????
			
			if(request.getParameter("swLat") != null) {
				// ????????? ???????????? ?????? ?????? ?????? ????????? ??????
				list = roomService.selectLatLngJustList(currentPage, limit, seR, neR);
			}else {
				// ????????? ???????????? ?????? ?????? ?????? ?????? ??????
				list = roomService.selectList(currentPage, limit);		
			}
		}
		
		int listCount= roomService.getListCountOnlyRoom(roomNo);
		if(request.getParameter("swLat") != null) {
			listCount = roomService.getListCount(seR, neR, roomNo);
		}

		int maxPage = (int) (((double) listCount / limit) + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		
		//????????? ????????? ?????? ??? ????????? ?????? ????????????
		if(request.getParameter("userid") != null) {
		ArrayList<MyRoom> mlist = myroomService.selectMyRoom(request.getParameter("userid"));
		model.addAttribute("mlist", mlist);
		}
		
		// ???????????? ????????????
		ArrayList<Room_File> rflist = roomService.selectRoomFileList(list);
		model.addAttribute("rflist",rflist);
		
		// ?????? ?????? ??????, ?????? ????????????
		ArrayList<Review> rvlist = reviewService.selectReviewList(list);		
		model.addAttribute("rvlist", rvlist);
		/*
		 * // ?????? ???????????? ???????????? ArrayList<RoomLatLng> roomLL =
		 * roomService.selectRoomLatLng(); model.addAttribute("roomLL", roomLL);
		 */
		if (list != null) {
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("listCount", listCount);
			model.addAttribute("list", list);
			return "room/roomBListView";

		} else {
			model.addAttribute("message", "????????? ?????? ??????");
			return "common/error";
		}
	}
	// ????????? ?????????????????? ??????
		@RequestMapping("moveSearchBList.do")
	public String moveSearchBList(Model model, HttpServletRequest request, HttpSession session, Room room) {
			int limit = 9;
			int currentPage = 1;
			room.setBed(Integer.parseInt(request.getParameter("bedCount")));
			room.setBedroom(Integer.parseInt(request.getParameter("bedroomCount")));
			room.setBathroom(Integer.parseInt(request.getParameter("bathroomCount")));
			if (request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			if(request.getParameter("center") != null) {
				String center = request.getParameter("center");
				String[] srr = center.split(",");
				String centerLat = srr[0].substring(1);
				String centerLng = srr[1].substring(1, srr[1].length()-1);
				
				String level = request.getParameter("level");
				
				model.addAttribute("level",level);
				model.addAttribute("centerLat",centerLat);
				model.addAttribute("centerLng",centerLng);
			}
			RoomLatLng seR = new RoomLatLng();
			RoomLatLng neR = new RoomLatLng();
			if (request.getParameter("swLat") != null) {
				double swLat = Double.parseDouble(request.getParameter("swLat"));
				double swLng = Double.parseDouble(request.getParameter("swLng"));
				double neLat = Double.parseDouble(request.getParameter("neLat"));
				double neLng = Double.parseDouble(request.getParameter("neLng"));
				seR = new RoomLatLng();
				neR = new RoomLatLng();

				seR.setRoom_lat(swLat);
				seR.setRoom_lng(swLng);
				neR.setRoom_lat(neLat);
				neR.setRoom_lng(neLng);
			}
			// ??? ????????? ??????
			ArrayList<Room> list = null;
			// ????????? ??????(????????????) ??????
			ArrayList<Room> roomNo = null;		
			String checkin = request.getParameter("checkin");
			String checkout = request.getParameter("checkout");
			int people = Integer.parseInt(request.getParameter("people"));
			int week = Integer.parseInt(request.getParameter("week"));

			String inMonth = checkin.substring(4, 6);
			String inday = checkin.substring(6);
			String outMonth = checkout.substring(4, 6);
			String outday = checkout.substring(6);	
			model.addAttribute("people", people);
			model.addAttribute("inMonth", inMonth);
			model.addAttribute("inday", inday);
			model.addAttribute("outMonth", outMonth);
			model.addAttribute("outday", outday);
			model.addAttribute("week", week);
			model.addAttribute("checkin", checkin);
			model.addAttribute("checkout", checkout);
			// ???????????? ????????? ????????? ????????? ?????? ?????? ????????????
			roomNo = roomService.selectChkRNList(checkin, checkout, people);

			// ???????????? ?????? select ??? ?????????
			if (request.getParameter("swLat") != null) {
				// ????????? ???????????? ?????? ???????????? ?????? ????????? ??????
				list = roomService.selectSearchLatLng(room, roomNo, currentPage, limit, seR, neR);

			} else {
				// ????????? ???????????? ?????? ??????
				list = roomService.selectSearchFilter(room, roomNo, currentPage, limit, people);
			}
			
			int listCount= roomService.selectSearchListCount(room, roomNo);
			if(request.getParameter("swLat") != null) {
				listCount = roomService.selectSearchListCountLatLng(seR, neR, roomNo, room);
			}

			int maxPage = (int) (((double) listCount / limit) + 0.9);
			int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
			int endPage = startPage + limit - 1;
			if (maxPage < endPage) {
				endPage = maxPage;
			}

			// ????????? ????????? ?????? ??? ????????? ?????? ????????????
			if (request.getParameter("userid") != null) {
				ArrayList<MyRoom> mlist = myroomService.selectMyRoom(request.getParameter("userid"));
				model.addAttribute("mlist", mlist);
			}

			// ???????????? ????????????
			ArrayList<Room_File> rflist = roomService.selectRoomFileList(list);
			model.addAttribute("rflist", rflist);

			// ?????? ?????? ??????, ?????? ????????????
			ArrayList<Review> rvlist = reviewService.selectReviewList(list);
			model.addAttribute("rvlist", rvlist);
			
			if (list != null) {				
				model.addAttribute("filterRoom", room);			
				model.addAttribute("maxPage", maxPage);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("listCount", listCount);
				model.addAttribute("list", list);
				return "room/roomSearchBList";

			} else {
				model.addAttribute("message", "????????? ?????? ??????");
				return "common/error";
			}
		}
	// ????????? ??????
	@RequestMapping(value = "SearchFilter.do", method = RequestMethod.POST)
	public String SearchFilter(Room room, Model model, HttpServletRequest request, HttpSession session) {
		int limit = 8;
		int currentPage = 1;
		room.setBed(Integer.parseInt(request.getParameter("bedCount")));
		room.setBedroom(Integer.parseInt(request.getParameter("bedroomCount")));
		room.setBathroom(Integer.parseInt(request.getParameter("bathroomCount")));
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("center") != null) {
			String center = request.getParameter("center");
			String[] srr = center.split(",");
			String centerLat = srr[0].substring(1);
			String centerLng = srr[1].substring(1, srr[1].length()-1);
			
			String level = request.getParameter("level");
			
			model.addAttribute("level",level);
			model.addAttribute("centerLat",centerLat);
			model.addAttribute("centerLng",centerLng);
		}
		RoomLatLng seR = new RoomLatLng();
		RoomLatLng neR = new RoomLatLng();
		if (request.getParameter("swLat") != null) {
			double swLat = Double.parseDouble(request.getParameter("swLat"));
			double swLng = Double.parseDouble(request.getParameter("swLng"));
			double neLat = Double.parseDouble(request.getParameter("neLat"));
			double neLng = Double.parseDouble(request.getParameter("neLng"));
			seR = new RoomLatLng();
			neR = new RoomLatLng();

			seR.setRoom_lat(swLat);
			seR.setRoom_lng(swLng);
			neR.setRoom_lat(neLat);
			neR.setRoom_lng(neLng);
		}
		// ??? ????????? ??????
		ArrayList<Room> list = null;
		// ????????? ??????(????????????) ??????
		ArrayList<Room> roomNo = null;
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		int people = Integer.parseInt(request.getParameter("people"));
		int week = Integer.parseInt(request.getParameter("week"));
		String inMonth = checkin.substring(4, 6);
		String inday = checkin.substring(6);
		String outMonth = checkout.substring(4, 6);
		String outday = checkout.substring(6);	
		model.addAttribute("people", people);
		model.addAttribute("inMonth", inMonth);
		model.addAttribute("inday", inday);
		model.addAttribute("outMonth", outMonth);
		model.addAttribute("outday", outday);
		model.addAttribute("week", week);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);

		// ???????????? ????????? ????????? ????????? ?????? ?????? ????????????
		roomNo = roomService.selectChkRNList(checkin, checkout, people);

		// ???????????? ?????? select ??? ?????????
		if (request.getParameter("swLat") != null) {
			// ????????? ???????????? ?????? ???????????? ?????? ????????? ??????
			logger.info("" + people + ", " + roomNo.toString());
			list = roomService.selectSearchLatLng(room, roomNo, currentPage, limit, seR, neR);

		} else {
			// ????????? ???????????? ?????? ??????
			list = roomService.selectSearchFilter(room, roomNo, currentPage, limit, people);
		}
		
		int listCount= roomService.selectSearchListCount(room, roomNo);
		if(request.getParameter("swLat") != null) {
			listCount = roomService.selectSearchListCountLatLng(seR, neR, roomNo, room);
		}

		int maxPage = (int) (((double) listCount / limit) + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// ????????? ????????? ?????? ??? ????????? ?????? ????????????
		if (request.getParameter("userid") != null) {
			ArrayList<MyRoom> mlist = myroomService.selectMyRoom(request.getParameter("userid"));
			model.addAttribute("mlist", mlist);
		}

		// ???????????? ????????????
		ArrayList<Room_File> rflist = roomService.selectRoomFileList(list);
		model.addAttribute("rflist", rflist);

		// ?????? ?????? ??????, ?????? ????????????
		ArrayList<Review> rvlist = reviewService.selectReviewList(list);
		model.addAttribute("rvlist", rvlist);
		/*
		 * // ?????? ???????????? ???????????? ArrayList<RoomLatLng> roomLL =
		 * roomService.selectRoomLatLng(); model.addAttribute("roomLL", roomLL);
		 */

		if (list != null) {
			model.addAttribute("filterRoom", room);			
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("listCount", listCount);
			model.addAttribute("list", list);
			return "room/roomSearchList";

		} else {
			model.addAttribute("message", "????????? ?????? ??????");
			return "common/error";
		}
	}
	// ??????????????? ??????
	@RequestMapping("moveFilterPage.do")
	public String moveFilterPage(Model model,HttpServletRequest request) {
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		int people = Integer.parseInt(request.getParameter("people"));
		int week = Integer.parseInt(request.getParameter("week"));

		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("people", people);
		model.addAttribute("week", week);
		return "room/roomFilterView";
	}
	// ????????????????????? ??????????????? ??????
	@RequestMapping("moveBFilterPage.do")
	public String moveBFilterPage(Model model, HttpServletRequest request) {
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		int people = Integer.parseInt(request.getParameter("people"));
		int week = Integer.parseInt(request.getParameter("week"));
		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("people", people);
		model.addAttribute("week", week);
		return "room/roomBFilterView";
	}
	// ????????? ???????????? ??????
	@RequestMapping("roomChangePass.do") 
	public String roomChangePass(@RequestParam("user_id") String user_id, Model model) {
		if(roomService.updateRoomChangePass(user_id)> 0) { 
			return "redirect:/moveAdminMemberPage.do"; }
		else {
			model.addAttribute("message", user_id + "?????? ????????? ????????? ??????????????????."); 
			return "common/error"; 
			} 
	}
	// ?????? ?????? ??????
	@RequestMapping(value="deleteFile.do", method=RequestMethod.POST)
	public void deleteFile(Model model, Room_File rfile, HttpServletResponse response) {
		logger.info(rfile.toString());
		int result = roomService.deleteRoomFile(rfile);
		
		response.setContentType("text/html; charset=utf-8");
		
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.append("ok");
				out.flush();
			}else {
				out.append("no");
				out.flush();
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// ?????? top 15? ??????(???????????????)
	@RequestMapping(value="roomTop.do", method=RequestMethod.POST)
	@ResponseBody
	public String roomTop(HttpServletResponse response) {
		ArrayList<Room> list = roomService.selectTop();
		ArrayList<Room_File> rflist = roomService.selectRoomFileList(list);		
		// ?????? ?????? ??????, ?????? ????????????
		ArrayList<Review> rvlist = reviewService.selectReviewList(list);		
		JSONObject sendJSON = new JSONObject();
		
		JSONArray jrr = new JSONArray();
		
		for(Room room : list) {
			JSONObject job = new JSONObject();
			try {
				job.put("room_name", URLEncoder.encode(room.getRoom_name(), "utf-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			job.put("room_no", room.getRoom_no());
			job.put("st_num_people", room.getSt_num_people());
			job.put("checkin_time", room.getCheckin_time());
			job.put("checkout_time", room.getCheckout_time());
			job.put("room_weekday", room.getRoom_weekday());
			job.put("room_weekend", room.getRoom_weekend());
			try {
				job.put("room_address", URLEncoder.encode(room.getRoom_address(), "utf-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				for(Review re : rvlist) {
					if(re.getRoom_no() == room.getRoom_no()) {
						job.put("clean_score",re.getClean_score());
						job.put("value_score", re.getValue_score());
						job.put("service_score", re.getService_score());
						job.put("reply_no", re.getReply_no());
					}
				}
				for(Room_File rf : rflist) {
					if(rf.getRoom_no() == room.getRoom_no()) {
						job.put("rename", rf.getRename_file());
						break;
					}
				}
			jrr.add(job);
		}
		sendJSON.put("list",jrr);
		logger.info(sendJSON.toJSONString());
		return sendJSON.toJSONString(); //jsonView ??? ????????????.
		
	}
	
}












 