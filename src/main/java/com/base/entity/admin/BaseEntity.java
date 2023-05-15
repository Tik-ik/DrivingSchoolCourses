package com.base.entity.admin;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
@Data

/**
 * 基础实体公共属性
 * @author Administrator
 *
 */
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class BaseEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name="id",nullable=false,length=11)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	private Long id;//唯一id
	
	@Column(name="create_time",nullable=false)
	@CreatedDate
	private Date createTime;//创建时间
	
	@Column(name="update_time",nullable=false)
	@LastModifiedDate
	private Date updateTime;//更新时间
	
}
