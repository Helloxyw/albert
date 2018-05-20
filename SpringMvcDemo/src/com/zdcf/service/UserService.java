package com.zdcf.service;

import java.util.List;

import com.zdcf.dto.ThemeDTO;
import com.zdcf.model.Airticle;
import com.zdcf.model.Message;
import com.zdcf.model.Theme;
import com.zdcf.model.User;

public interface UserService {

	public Integer getUidByName(String username);

	public String getPwdByName(String username);

	public String getNameById(Integer id);

	public User getUserByName(String username);

	public int register(User user);

	public User getUserById(Integer id);

	int updateAvatar(User user);
	
}
