package com.dao;

import com.po.Buser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminUserDao")
@Mapper
public interface AdminUserDao {
	public List<Buser> userInfo();
	public int deleteuserManager(Integer id);
}
