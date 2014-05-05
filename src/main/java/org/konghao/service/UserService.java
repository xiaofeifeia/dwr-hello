package org.konghao.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserService {
	private static Map<Integer,User> users = new HashMap<Integer,User>();
	static {
		users.put(1, new User(1,"a",new Group(1,"agroup")));
		users.put(2, new User(2,"b",new Group(1,"bgroup")));
	}
	public UserService() {
		
	}
	public User load(int id) {
		return users.get(id);
	}
	
	public void add(User user) {
		users.put(user.getId(), user);
	}
	
	public void deleteUser(int id) {
		if(!users.containsKey(id)) throw new UserException("some error!");
		users.remove(id);
	}
	
	public List<User> list() {
		Set<Integer> keys = users.keySet();
		List<User> us = new ArrayList<User>();
		for(Integer key:keys) {
			us.add(users.get(key));
		}
		return us;
	}
}
