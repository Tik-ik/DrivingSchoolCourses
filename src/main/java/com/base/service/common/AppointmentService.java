package com.base.service.common;

/**
 * 课程预约业务逻辑层
 */

import com.base.entity.common.Appointment;
import com.base.bean.PageBean;
import com.base.dao.common.AppointmentDao;
import com.base.entity.home.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class AppointmentService {

    @Autowired
    AppointmentDao appointmentDao;

    public void delete(Long id) {
        appointmentDao.deleteById(id);
    }

    public Appointment save(Appointment appointment) {
        return appointmentDao.save(appointment);
    }

    public Appointment find(Long id) {
        return appointmentDao.find(id);
    }

    public List<Appointment> findAll() {
        return appointmentDao.findAll();
    }

    public PageBean<Appointment> findList(Appointment appointment, PageBean<Appointment> pageBean) {
        Specification<Appointment> appointmentSpecification = new Specification<Appointment>(){
            @Override
            public Predicate toPredicate(Root<Appointment> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.equal(root.get("account"), appointment.getAccount().getId());
                return predicate;
            }
        };
        Sort.by(Sort.Direction.DESC,"createTime");
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize());
        Page<Appointment> findAll = appointmentDao.findAll(appointmentSpecification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }
    public PageBean<Appointment> findList2(Appointment appointment, PageBean<Appointment> pageBean){
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("courses.title", ExampleMatcher.GenericPropertyMatchers.contains());
        withMatcher = withMatcher.withIgnorePaths("isRate","courses.rate","status");
        Example<Appointment> example = Example.of(appointment, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
        Page<Appointment> findAll = appointmentDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    public Boolean insertAll(List<Appointment> appointmentsList) {
        List<Appointment> appointments = appointmentDao.saveAll(appointmentsList);
        int size = appointments.size();
        return size > 0;
    }

    /**
     * 检查预约是否超过maxCount次
     *
     * @param courseId
     * @param maxCount
     * @return
     */
    public List<String> findTotalCount(Long courseId, Integer maxCount) {
        List<Object> totalCount = appointmentDao.findTotalCount(courseId, maxCount);
       List<String> list = new ArrayList<>();
        if(totalCount.size()!=0){
            for(Object o:totalCount){
                Object[] appoint=(Object[])o;
                String date = appoint[1].toString().substring(0,10);
                String time = appoint[2].toString();
                list.add("status-"+date+"="+time);
            }
        }
        return  list;
    }

    /**
     * 检查用户是否已经预约过这个课程了
     *
     * @param accountId
     * @param coursesId
     * @return
     */
    public Appointment findByCoursesIdAndAccountIdAndMakeDateAndMakeTime(Long coursesId, Long accountId, Date makeDate, String makeTime) {
        return appointmentDao.findByCoursesIdAndAccountIdAndMakeDateAndMakeTime(coursesId,accountId,makeDate,makeTime);
    }

    public void setStatus()throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        List<Appointment> appointments = appointmentDao.findAll();
        for(Appointment item : appointments)
        {
            String[] sss = item.getOverdue().split(" ");
            String date = sss[0];
            String times = sss[1];
            String time2 = times.split("-")[1];
            Date end = sdf.parse(date + " " + time2);
            Date now = new Date();

            //判断是否过期
            if(now.compareTo(end) > 0 )
            {
                item.setStatus(1);
                try
                {
                    appointmentDao.save(item);
                }catch (Exception e)
                {

                }
            }
        }
    }
}
