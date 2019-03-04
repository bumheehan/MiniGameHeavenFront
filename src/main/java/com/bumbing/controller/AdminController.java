package com.bumbing.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bumbing.domain.CommentVO;
import com.bumbing.domain.GameVO;
import com.bumbing.domain.MemberVO;
import com.bumbing.domain.RowsVO;
import com.bumbing.domain.RowsVO2;
import com.bumbing.domain.VisitorVO;
import com.bumbing.service.AdminService;
import com.bumbing.service.GameCommentService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private GameCommentService commentService;
		
	@GetMapping(value="/admin/admincomment")
	public void adminMComment() {
		
	}
	
	@RequestMapping(value="/commentchart")
	@ResponseBody
	@SuppressWarnings("unchecked")
	public JSONObject getCommentData() {
		List<CommentVO>list = adminService.getCList();
		log.info(list);
		List<JSONObject> jsonList = new ArrayList<JSONObject>();
		List<JSONObject> innerRow = new ArrayList<JSONObject>();
		List<JSONArray> jsonArrayList = new ArrayList<JSONArray>();
		String kickout = "";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy,MM,dd,HH");

		for(int i=0; i<=7;i++) {
			jsonList.add(new JSONObject());
		}
		for(int i=0; i<=list.size();i++) {
			try{
			innerRow.add(new JSONObject());
			
			jsonArrayList.add(new JSONArray());
			
			jsonArrayList.get(i).add(new RowsVO(list.get(i).getGameName()));
			jsonArrayList.get(i).add(new RowsVO(list.get(i).getEmail()));
			jsonArrayList.get(i).add(new RowsVO(list.get(i).getName()));
			jsonArrayList.get(i).add(new RowsVO(list.get(i).getComment()));
			jsonArrayList.get(i).add(new RowsVO2(list.get(i).getReport()));
			jsonArrayList.get(i).add(new RowsVO("Date("+transFormat.format(list.get(i).getRegDate())+")"));	
			jsonArrayList.get(i).add(new RowsVO("<a href='cRemove?cno="+list.get(i).getNo()+"'><i class=\"fas fa-times\"></i><a/>"));
			innerRow.get(i).put("c",jsonArrayList.get(i));
			}catch(Exception e) {
				log.info(e);
			}
		}
	
		JSONObject jsonObject = new JSONObject();
		
		jsonList.get(0).put("label","<i class=\"fas fa-gamepad fa-2x\"> GAME</i>");
		jsonList.get(0).put("type","string");
		jsonList.get(1).put("label","<i class=\"fas fa-envelope fa-2x\"> EMAIL</i>");
		jsonList.get(1).put("type","string");
		jsonList.get(2).put("label","<i class=\"fas fa-user fa-2x\"> NICK</i>");
		jsonList.get(2).put("type","string");
		jsonList.get(3).put("label","<i class=\"fas fa-comment fa-2x\"> COMMENT</i>");
		jsonList.get(3).put("type","string");
		jsonList.get(4).put("label","<i class=\"fas fa-bullhorn fa-2x\"> REPORT</i>");
		jsonList.get(4).put("type","number");
		jsonList.get(5).put("label","<i class=\"fas fa-calendar-alt fa-2x\"> DATE</i>");
		jsonList.get(5).put("type","date");
		jsonList.get(6).put("label","<i class=\"fas fa-ban fa-2x\"> KICK</i>");
		jsonList.get(6).put("type","string");
		
		JSONArray jsonArray = new JSONArray();
		JSONArray jsonArray2 = new JSONArray();
		
		//<input type=\"button\" id=1 />
		
		for(int i=0;i< jsonList.size()-1; i++) {
			jsonArray.add(jsonList.get(i));
		}
		for(int i=0;i< jsonArrayList.size()-1; i++) {
			
			jsonArray2.add(innerRow.get(i));

		}
		jsonObject.put("cols",jsonArray);
		jsonObject.put("rows",jsonArray2);
		log.info(jsonObject);
		
		return jsonObject;
	}
	
	
	@GetMapping("/admin/cRemove")
	public String cRemove(CommentVO cvo) {//cno no 로 바꾸기

		commentService.del(cvo);
		return "redirect:/admin/admincomment";
	}
	
	@GetMapping(value="/admin/admingameboard")
	public void adminGameboard() {
		
	}
	
	@RequestMapping(value="/gamechart")
	@ResponseBody
	@SuppressWarnings("unchecked")
	public JSONObject getGamedata() {
		log.info("gamechart");
		List<GameVO>glist = adminService.getGList();
		log.info("glist+++++++++++++++"+glist);
		List<JSONObject> jsonList2 = new ArrayList<JSONObject>();
		List<JSONObject> innerRow2 = new ArrayList<JSONObject>();
		List<JSONArray> jsonArrayList2 = new ArrayList<JSONArray>();
		String kickout = "";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy,MM,dd,HH");
		log.info(glist);
		for(int i=0; i<=6;i++) {
			jsonList2.add(new JSONObject());
		}
		for(int i=0; i<=glist.size();i++) {
			try{
			innerRow2.add(new JSONObject());
			
			jsonArrayList2.add(new JSONArray());
			
			jsonArrayList2.get(i).add(new RowsVO(glist.get(i).getGameName()));
			jsonArrayList2.get(i).add(new RowsVO(glist.get(i).getGenre()));
			jsonArrayList2.get(i).add(new RowsVO2((long)glist.get(i).getWidth()));
			jsonArrayList2.get(i).add(new RowsVO2((long)glist.get(i).getHeight()));
			jsonArrayList2.get(i).add(new RowsVO("Date("+transFormat.format(glist.get(i).getRDate())+")"));	
			jsonArrayList2.get(i).add(new RowsVO("<a href='gRemove?game="+glist.get(i).getGame()+"'><i class=\"fas fa-times\"></i><a/>"));
			innerRow2.get(i).put("c",jsonArrayList2.get(i));
			log.info(jsonArrayList2);
			}catch(Exception e) {
				log.info("?");
			}
		}
	
		JSONObject jsonObject2 = new JSONObject();
		
		jsonList2.get(0).put("label","<i class=\"fas fa-gamepad fa-2x\"> GAME</i>");
		jsonList2.get(0).put("type","string");
		jsonList2.get(1).put("label","GENRE");
		jsonList2.get(1).put("type","string");
		jsonList2.get(2).put("label","<i class=\"fas fa-arrows-alt-h fa-2x\"> WIDTH</i>");
		jsonList2.get(2).put("type","string");
		jsonList2.get(3).put("label","<i class=\"fas fa-arrows-alt-v fa-2x\"> HEIGHT</i>");
		jsonList2.get(3).put("type","string");
		jsonList2.get(4).put("label","<i class=\"fas fa-calendar-alt fa-2x\"> DATE</i>");
		jsonList2.get(4).put("type","date");
		jsonList2.get(5).put("label","<i class=\"fas fa-trash-alt fa-2x\"> DEL</i>");
		jsonList2.get(5).put("type","string");
		
		JSONArray jsonArray3 = new JSONArray();
		JSONArray jsonArray4 = new JSONArray();
		
		//<input type=\"button\" id=1 />
		for(int i=0;i< jsonList2.size()-1; i++) {
			jsonArray3.add(jsonList2.get(i));
		}
		for(int i=0;i< jsonArrayList2.size()-1; i++) {
			
			jsonArray4.add(innerRow2.get(i));

		}
		jsonObject2.put("cols",jsonArray3);
		jsonObject2.put("rows",jsonArray4);
		log.info(jsonObject2);
		
		return jsonObject2;
	}
	
	@GetMapping("/admin/gRemove")
	public String gRemove(@RequestParam("game")String game) {
		log.info(game);
		adminService.gRemove(game);
		return "redirect:/admin/admingameboard";
	}
	
	@GetMapping("/visitor_line")
	@ResponseBody/////데이터 값만 보내주게 만들어줌
	public JSONObject getVisitorData4Line() {

		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Calendar calendar = Calendar.getInstance();

		calendar.setTime(new Date());
		calendar.add(Calendar.DATE,1);
	    Date endDate = calendar.getTime();
	    calendar.add(Calendar.MONTH, -36);
        Date startDate = calendar.getTime();
        String start = dateFormat.format(startDate);
        String end = dateFormat.format(endDate);
        String dateString;
        log.info(start+"dddddddddddddddddddddddddd");
		List<VisitorVO> list = adminService.getMonthlyVisitors(start,end);
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
		JSONObject ajaxObjCols2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
		JSONArray ajaxArryCols = new JSONArray(); 
		JSONArray ajaxArryRows = new JSONArray();
		VisitorVO visitorVO =null;
		
		ajaxObjCols1.put("type", "date");
		ajaxObjCols1.put("id", "");
		ajaxObjCols1.put("label", "date");
		ajaxObjCols1.put("pattern", "");
		ajaxObjCols2.put("id", "");
		ajaxObjCols2.put("label", "Visitor");
		ajaxObjCols2.put("pattern", "");
		ajaxObjCols2.put("type", "number");
		ajaxArryCols.add(ajaxObjCols1);
		ajaxArryCols.add(ajaxObjCols2);
		
		
		
		for (int i=0; i<list.size(); i++){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
			visitorVO=list.get(i);
			dateString = "Date("+visitorVO.getY()+","+(visitorVO.getM()-1)+","+visitorVO.getD()+")";
		    JSONObject legend = new JSONObject();
		    JSONObject value = new JSONObject();
		    JSONArray cValueArry = new JSONArray();
		    JSONObject cValueObj = new JSONObject();
		    
		    legend.put("v",dateString );
		    legend.put("f", null);
		    
		    value.put("v",visitorVO.getC() );
		    value.put("f", null);
		    
		    cValueArry.add(legend);
		    cValueArry.add(value);
		    
		    cValueObj.put("c", cValueArry);
		    ajaxArryRows.add(cValueObj);
		}
		

		data.put("cols", ajaxArryCols);
		data.put("rows", ajaxArryRows);

		return data;

	}
	/*
	@GetMapping("admin/adminmain")
	public void main() {
		
	}
	
	@GetMapping("admin/member")
	public void member() {
		
	}
	
	@RequestMapping(value="/memberchart")
	@ResponseBody
	@SuppressWarnings("unchecked")
	public JSONObject getMember() {
		log.info("memberchart");
		List<MemberVO>glist = adminService.getMList();
		List<JSONObject> jsonList2 = new ArrayList<JSONObject>();
		List<JSONObject> innerRow2 = new ArrayList<JSONObject>();
		List<JSONArray> jsonArrayList2 = new ArrayList<JSONArray>();
		String kickout = "";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy,MM,dd,HH");
		
		for(int i=0; i<=6;i++) {
			jsonList2.add(new JSONObject());
		}
		for(int i=0; i<=glist.size();i++) {
			try{
			innerRow2.add(new JSONObject());
			
			jsonArrayList2.add(new JSONArray());
			
			jsonArrayList2.get(i).add(new RowsVO(glist.get(i).getEmail()));
			jsonArrayList2.get(i).add(new RowsVO(glist.get(i).getUserName()));
//			if(glist.get(i).getProfile().equals(null)) {
//				jsonArrayList2.get(i).add(new RowsVO());
//			}else {
//				jsonArrayList2.get(i).add(new RowsVO(glist.get(i).getProfile()));
//			}
//			
//			if(glist.get(i).getDDate().equals(null)) {
//				jsonArrayList2.get(i).add(new RowsVO());
//			}else {
//				jsonArrayList2.get(i).add(new RowsVO("Date("+transFormat.format(glist.get(i).getDDate())+")"));
//			}
			String date = null;
			if(glist.get(i).getDDate()!=null)
				date = "Date("+transFormat.format(glist.get(i).getDDate())+")";
				jsonArrayList2.get(i).add(new RowsVO(glist.get(i).getEmail()));
			jsonArrayList2.get(i).add(new RowsVO("Date("+transFormat.format(glist.get(i).getCDate())+")"));
			jsonArrayList2.get(i).add(new RowsVO(date));	
			jsonArrayList2.get(i).add(new RowsVO("<a href='mRemove?email="+glist.get(i).getEmail()+"'><i class=\"fas fa-times\"></i><a/>"));
			innerRow2.get(i).put("c",jsonArrayList2.get(i));
			}catch(Exception e) {
			}
		}
	
		JSONObject jsonObject2 = new JSONObject();
		
		jsonList2.get(0).put("label","<i class=\"fas fa-gamepad fa-2x\"> EMAIL</i>");
		jsonList2.get(0).put("type","string");
		jsonList2.get(1).put("label","NICKNAME");
		jsonList2.get(1).put("type","string");
		jsonList2.get(2).put("label","NICKNAME");
		jsonList2.get(2).put("type","string");
		jsonList2.get(3).put("label","<i class=\"fas fa-arrows-alt-h fa-2x\"> CDATE</i>");
		jsonList2.get(3).put("type","date");
		jsonList2.get(4).put("label","<i class=\"fas fa-arrows-alt-v fa-2x\"> DDATE</i>");
		jsonList2.get(4).put("type","date");
		jsonList2.get(5).put("label","<i class=\"fas fa-trash-alt fa-2x\"> DEL</i>");
		jsonList2.get(5).put("type","string");
		
		JSONArray jsonArray3 = new JSONArray();
		JSONArray jsonArray4 = new JSONArray();
		
		//<input type=\"button\" id=1 />
		for(int i=0;i< jsonList2.size()-1; i++) {
			jsonArray3.add(jsonList2.get(i));
		}
		for(int i=0;i< jsonArrayList2.size()-1; i++) {
			
			jsonArray4.add(innerRow2.get(i));

		}
		jsonObject2.put("cols",jsonArray3);
		jsonObject2.put("rows",jsonArray4);
		log.info(jsonObject2);
		
		return jsonObject2;
	}
	*/
}
