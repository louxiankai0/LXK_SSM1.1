package com.dao;

import com.po.Buser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
@Mapper
public interface UserDao {
	public int register(Buser buser);
	public List<Buser> login(Buser buser);
}
