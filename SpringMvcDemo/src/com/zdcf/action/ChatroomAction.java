package com.zdcf.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.GsonBuilder;
import com.zdcf.model.User;
import com.zdcf.po.Message;
import com.zdcf.service.UserService;
import com.zdcf.tool.UserSessionUtil;
import com.zdcf.websocket.MyWebSocketHandler;

@Controller
@RequestMapping("/chatroom")
public class ChatroomAction {

	@Autowired
	MyWebSocketHandler handler;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/toChatroom")
	public String chatroom(){
		User user =UserSessionUtil.currentUser();
		if(null==user){
			return "index/login";
		}
		return "/chatroom/chatroom";
	}
			
	
	@RequestMapping("/onlineusers")
	@ResponseBody
	public List<User> onlineusers(HttpSession session){
		Map<Integer, WebSocketSession> map=MyWebSocketHandler.userSocketSessionMap;
		Set<Integer> set=map.keySet();
		Iterator<Integer> it = set.iterator();
		List<User> list=new ArrayList<User>();
		while(it.hasNext()){
			Integer entry = it.next();
			User u=userService.getUserById(entry);
			String user=UserSessionUtil.currentUser().getUsername();
			if(!user.equals(u.getUsername())){
				list.add(u);
			}
		}
		return list;
	}
	
	// 发布系统广播（群发）
	@ResponseBody
	@RequestMapping(value = "broadcast", method = RequestMethod.POST)
	public void broadcast(@RequestParam("text") String text) throws IOException {
		User user =UserSessionUtil.currentUser();
		Message msg = new Message();
		msg.setDate(new Date());
		msg.setFrom(-1);//-1表示系统广播
		msg.setFromName(user.getUsername());
		msg.setTo(0);
		msg.setText(text);
		handler.broadcast(new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
	}
		
	@RequestMapping("getuid")
	@ResponseBody
	public User getuid(@RequestParam("username")String username){
		User user=userService.getUserByName(username);
		return user;
	}
	
}
