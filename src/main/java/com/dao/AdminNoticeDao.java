package com.dao;

import com.po.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminNoticeDao")
@Mapper
public interface AdminNoticeDao {
	public int addNotice(Notice notice);
	public List<Notice> deleteNoticeSelect();
	public int deleteNotice(Integer id);
	public Notice selectANotice(Integer id);
}
