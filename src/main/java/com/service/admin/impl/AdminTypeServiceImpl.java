package com.service.admin.impl;

import com.dao.AdminTypeDao;
import com.po.GoodsType;
import com.service.admin.AdminTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("adminTypeService")
@Transactional
public class AdminTypeServiceImpl implements AdminTypeService {
	@Autowired
	private AdminTypeDao adminTypeDao;


	@Override
	public String selectAType(Model model, Integer id, String act) {
		GoodsType agoodstype = adminTypeDao.selectGoodsTypeById(id);
		model.addAttribute("goodstype", agoodstype);
        //修改页面
		if("updateAtype".equals(act)){
			return "admin/updateAtype";
		}
		//详情页面
		return "admin/goodsDetail";
	}


	@Override
	public String deleteAType(Integer id, Model model) {
		//类型有关联
		if(adminTypeDao.selectGoodsByType(id).size() > 0 ) {
			model.addAttribute("msg", "类型有关联，不允许删除");
			return "forward:/adminType/selectType?act=deleteSelect";
		}
		adminTypeDao.deleteAType(id);
		model.addAttribute("msg", "成功删除类型");
		return "forward:/adminType/selectType?act=deleteSelect";
	}

	@Override
	public String addOrUpdateType(GoodsType goodstype, HttpServletRequest request, String updateAct) {
		//修改
		if("update".equals(updateAct)){//updateAct不能和act重名，因为使用了转发
			//修改到数据库
			if(adminTypeDao.updateGoodsTypeById(goodstype) > 0){
				return "forward:/adminType/selectType?act=updateSelect";
			}else{
				return "/adminType/updateAtype";
			}
		}else{
			//保存到数据库
			if(adminTypeDao.addType(goodstype) > 0){
				//转发到查询的controller
				return "forward:/adminType/selectType";
			}else{
				return "card/addCard";
			}
		}
	}

	@Override
	public String selectType(Model model, Integer pageCur, String act) {
		List<GoodsType> allTypes = adminTypeDao.selectGoodsType();
		int temp = allTypes.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小值
			totalPage = (int) Math.ceil((double) temp / 5);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 5 > temp) {
			pageCur = pageCur - 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", (pageCur - 1) * 5);//起始位置
		map.put("perPageSize", 5);//每页5个
		allTypes = adminTypeDao.selectAllGoodsTypeByPage(map);
		model.addAttribute("allTypes", allTypes);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//删除查询
		if("deleteSelect".equals(act)){
			return "admin/selectType";
		}
		//修改查询
		else if("updateSelect".equals(act)){
			return "admin/selectType";
		}else{
			return "admin/selectType";
		}
	}

	@Override
	public String deleteType(Integer[] ids, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < ids.length; i++) {
			//商品有关联
			if(adminTypeDao.selectGoodsByType(ids[i]).size() > 0 ) {
				model.addAttribute("msg", "类型有关联，不允许删除");
				return "forward:/adminType/selectType?act=deleteSelect";
			}
			list.add(ids[i]);
		}
		adminTypeDao.deleteType(list);
		model.addAttribute("msg", "成功删除类型");
		return "forward:/adminType/selectType?act=deleteSelect";
	}
}
