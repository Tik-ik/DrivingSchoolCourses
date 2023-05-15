package com.base.dao.common;

import com.base.entity.home.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * 前台用户数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface AccountDao extends JpaRepository<Account, Long>{

	/**
	 * 按照用户名查找用户信息
	 * @param username
	 * @return
	 */
	public Account findByUsername(String username);

	/**
	 * 根据用户id查询
	 * @param id
	 * @return
	 */
	@Query("select u from Account u where id = :id")
	public Account find(@Param("id") Long id);

	/**
	 * 根据用户的手机号
	 * @param mobile
	 * @return
	 */
	Account findByMobile(@Param("mobile") String mobile);
}
