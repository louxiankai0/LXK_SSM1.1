package com.service.admin.impl;

import com.dao.AdminGoodsDao;
import com.po.Goods;
import com.service.admin.AdminGoodsService;
import com.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("adminGoodsService")
@Transactional
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsDao adminGoodsDao;
	/**
	 * 添加或更新
	 */
	@Override
	public String addOrUpdateGoods(Goods goods, HttpServletRequest request, String updateAct) {
		/*上传文件保存位置"/logos"该位置指
		workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps
		发布后使用*/
		//防止文件重名
		String newFileName = "";
		String fileName = goods.getLogoImage().getOriginalFilename(); 
		//选择了文件
		if(fileName.length() > 0){
			String realpath = request.getSession().getServletContext().getRealPath("logos");
			//实现文件上传
			String fileType = fileName.substring(fileName.lastIndexOf('.'));
			//防止文件重名
			newFileName = MyUtil.getStringID() + fileType;
			goods.setGpicture(newFileName);
			File targetFile = new File(realpath, newFileName);
			//判断targetFile是否存在
			if(!targetFile.exists()){  
	            targetFile.mkdirs();  //创建此抽象路径名指定的目录，包括所有必需但不存在的父目录
	        } 
			//上传
	        try {   
	        	goods.getLogoImage().transferTo(targetFile);//MultipartFile 的 transferTo 将文件上传
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		}
		//修改
		if("update".equals(updateAct)){//updateAct不能和act重名，因为使用了转发
			//修改到数据库
	       if(adminGoodsDao.updateGoodsById(goods) > 0){
	        	return "forward:/adminGoods/selectGoods?act=updateSelect";
	        }else{
	        	return "/adminGoods/updateAgoods";
	       }
		}else{
			//保存到数据库
			if(adminGoodsDao.addGoods(goods) > 0){
				//转发到查询的controller
				return "forward:/adminGoods/selectGoods";
			}else{
				return "card/addCard";
			}
		}
	}
	/**
	 * 查询物品
	 */
	@Override
	public String selectGoods(Model model, Integer pageCur, String act) {
		//用List接收数据库查出的物品数据
		List<Goods> allGoods = adminGoodsDao.selectGoods();
		//用一个temp去接收条数
		int temp = allGoods.size();
		model.addAttribute("totalCount", temp);
		//定义一个总页数
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小值
			//ceil进行上舍入，返回值大于或等于给定的参数
			totalPage = (int) Math.ceil((double) temp / 5);
		}
		//第几页
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
		allGoods = adminGoodsDao.selectAllGoodsByPage(map);
		model.addAttribute("allGoods", allGoods);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//删除查询
		if("deleteSelect".equals(act)){
			return "admin/selectGoods";
		}
		//修改查询
		else if("updateSelect".equals(act)){
			return "admin/selectGoods";
		}else{
			return "admin/selectGoods";
		}
	}
	/**
	 * 查询一个物品
	 */
	@Override
	public String selectAGoods(Model model, Integer id, String act) {
		Goods agoods = adminGoodsDao.selectGoodsById(id);
		model.addAttribute("goods", agoods);
		//修改页面
		if("updateAgoods".equals(act)){
			return "admin/updateAgoods";
		}
		//详情页面
		return "admin/goodsDetail";
	}
	/**
	 * 删除多个物品
	 */
	@Override
	public String deleteGoods(Integer[] ids, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < ids.length; i++) {
			//物品有关联
			if(adminGoodsDao.selectCartGoods(ids[i]).size() > 0 ||
					adminGoodsDao.selectFocusGoods(ids[i]).size() > 0 || 
					adminGoodsDao.selectOrderdetailGoods(ids[i]).size() > 0) {
				model.addAttribute("msg", "物品有关联，不允许删除");
				return "forward:/adminGoods/selectGoods?act=deleteSelect";
			}
			list.add(ids[i]);
		}
		adminGoodsDao.deleteGoods(list);
		model.addAttribute("msg", "成功删除物品");
		return "forward:/adminGoods/selectGoods?act=deleteSelect";
	}

}
