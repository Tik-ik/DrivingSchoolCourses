package com.base.service.common;

import com.base.bean.PageBean;
import com.base.dao.common.AccountDao;
import com.base.entity.home.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.stereotype.Service;

/**
 * 前台用户管理service
 * @author Administrator
 *
 */
@Service
public class AccountService {

	@Autowired
	private AccountDao accountDao;
	
	/**
	 * 根据前台用户id查询
	 * @param id
	 * @return
	 */
	public Account find(Long id){
		return accountDao.find(id);
	}
	
	/**
	 * 按照前台用户名查找前台用户
	 * @param accountName
	 * @return
	 */
	public Account findByAccountName(String accountName){
		return accountDao.findByUsername(accountName);
	}
	
	/**
	 * 前台用户添加/编辑操作
	 * @param account
	 * @return
	 */
	public Account save(Account account){
		return accountDao.save(account);
	}
	
	/**
	 * 分页查询前台用户列表
	 * @param account
	 * @param pageBean
	 * @return
	 */
	public PageBean<Account> findList(Account account, PageBean<Account> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("username", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status","sex");
		Example<Account> example = Example.of(account, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<Account> findAll = accountDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}

	
	/**
	 * 按照前台用户id删除
	 * @param id
	 */
	public void delete(Long id){
		accountDao.deleteById(id);
	}
	
	/**
	 * 返回前台用户总数
	 * @return
	 */
	public long total(){
		return accountDao.count();
	}

	/**
	 * 根据前台用户的手机号
	 * @param
	 * @return
	 */
	public Account findMobile(String mobile){
		return accountDao.findByMobile(mobile);
	}
}
