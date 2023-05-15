package com.base.schedule.admin;

import com.base.service.common.admin.DatabaseBakService;
import com.base.service.common.AppointmentService;
import com.base.service.common.ScheduleService;
import com.base.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.io.File;

/**
 * 备份数据库定时器
 *
 * @author Administrator
 */
@Configuration
@EnableScheduling
public class BackUpSchedule {

    @Autowired
    private DatabaseBakService databaseBakService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private AppointmentService appointmentService;
    
    private Logger log = LoggerFactory.getLogger(BackUpSchedule.class);

    //@Scheduled(initialDelay=10000,fixedRate=5000)
    @Scheduled(cron = "0 0 1 * * ?")//每天凌晨一点0分0秒执行备份任务
    public void backUpDatabase() {
        log.info("开始执行定时备份数据库任务！");
        databaseBakService.backup();
    }

     @Scheduled(cron = "0 10 10 * * ?")
   // @Scheduled(fixedRate = 100000)
    public void testClazzSchedule() {
        log.info("删除过期的课程！");
        scheduleService.deleteClazzSchedule();
    }

    @Scheduled(cron = "0 0 1 * * ?")
    public void testCourseOrderSetStatus() throws Exception {
        log.info("更改状态");
        appointmentService.setStatus();
    }


}
