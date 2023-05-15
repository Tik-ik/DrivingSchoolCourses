package com.base.service.common;

/**
 * 课程表业务逻辑层
 */

import com.base.bean.PageBean;
import com.base.dao.common.ScheduleDao;
import com.base.entity.home.ClazzSchedule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScheduleService {

    @Autowired
    ScheduleDao scheduleDao;

    public void delete(Long id) {
        scheduleDao.deleteById(id);
    }

    public ClazzSchedule save(ClazzSchedule clazzSchedule) {
        return scheduleDao.save(clazzSchedule);
    }

    public ClazzSchedule find(Long id) {
        return scheduleDao.find(id);
    }


    public List<ClazzSchedule> findAll() {
        return scheduleDao.findAll();
    }

    public PageBean<ClazzSchedule> findList(ClazzSchedule clazzSchedule, PageBean<ClazzSchedule> pageBean) {
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("courses.title", ExampleMatcher.GenericPropertyMatchers.contains());
        withMatcher = withMatcher.withIgnorePaths("slot","courses.rate");
        Example<ClazzSchedule> example = Example.of(clazzSchedule, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize());
        Page<ClazzSchedule> findAll = scheduleDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 根据课程id查找课程表
     * @param id
     * @return
     */
    public ClazzSchedule findByCoursesId(@Param("id")Long id){
        return scheduleDao.findByCoursesId(id);
    }

    /**
     * 根据课程Id 开始日期和结束日期 排斥 课程安排
     * @param courseId
     * @param startDate
     * @param endDate
     * @return
     */
    public ClazzSchedule getScheduleCount(Long courseId, String startDate, String endDate){
        return  scheduleDao.getScheduleCount(courseId,startDate,endDate);
    }

    /**
     * 删除已过期的课程表
     * @return
     */
    @Transactional
    public void deleteClazzSchedule(){
        scheduleDao.deleteClazzSchedule();
    }

   /* public void deleteAll(List<ClazzSchedule>){
        scheduleDao.deleteInBatch();
    }*/

}
