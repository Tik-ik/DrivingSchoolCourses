package com.base.service.common;

import com.base.dao.common.RateDao;
import com.base.entity.common.Rate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RateService {

    @Autowired
    RateDao rateDao;


    public Rate save(Rate rate)
    {
        return  rateDao.save(rate);
    }

    public List<Object> groupByCourse()
    {
        return  rateDao.groupByCourse();
    }

    //满意客户
    public Integer getCount()
    {
        return rateDao.getCount();
    }

    public Integer getCountAll() {
        return rateDao.getCountAll();
    }
}
