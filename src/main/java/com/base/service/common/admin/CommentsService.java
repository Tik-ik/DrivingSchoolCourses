package com.base.service.common.admin;

import com.base.bean.PageBean;
import com.base.dao.admin.CommentsDao;
import com.base.entity.admin.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wangzihan
 * @date : 2020/11/11 14:36
 * 用户评论业务处理层
 */
@Service
public class CommentsService {
    
    @Autowired
    private CommentsDao commentsDao;

    /**
     * 根查询该评论下面有没有子评论
     * @param id
     * @return
     */
    public Comments find(Long id){
        return commentsDao.find(id);
    }


    /**
     * 查询一条新闻下面所有的评论
     * @param id
     * @return
     */
    public List<Comments> findAncestorIdAll(Long id){
        return  commentsDao.findAncestorIdAll(id);
    }

    /**
     * 查询祖评论下的所有子评论
     * @param id
     * @return
     */
    public List<Comments> findNewsCommentsAll(Long id){
        return  commentsDao.findNewsCommentsAll(id);
    }



    /**
     * 用户评论添加/编辑操作
     * @param comments
     * @return
     */
    public Comments save(Comments comments){
        return commentsDao.save(comments);
    }

    /**
     * 分页查询用户评论列表
     * @param comments
     * @param pageBean
     * @return
     */
    public PageBean<Comments> findList(Comments comments, PageBean<Comments> pageBean){
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("content", ExampleMatcher.GenericPropertyMatchers.contains());
        Example<Comments> example = Example.of(comments, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
        Page<Comments> findAll = commentsDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 按照用户评论id删除
     * @param id
     */
    public void delete(Long id){
        commentsDao.deleteById(id);
    }


    /**
     * 返回当前新闻下的用户评论总数
     * @return
     */
    public Long newscountTotal(Long id){
        return commentsDao.newscountTotal(id);
    }



    /**
     * 存放迭代找出的所有子代的集合
     */
    private List<Comments> tempReplys = new ArrayList<>();

    /**
     * 查询评论
     * @return  评论消息
     */
    public List<Comments> listComments() {
        //查询出父节点
        List<Comments> comments = commentsDao.fujipinglun(Long.parseLong("-1"));
        for(Comments comment : comments){
            Long id = comment.getId();
            String parentName1 = comment.getAccount().getUsername();
            List<Comments> childComments = commentsDao.yijihuifu(id);
            //查询出子评论
            combineChildren(childComments,parentName1);
            comment.setReplyComments(tempReplys);
            tempReplys = new ArrayList<>();
        }
        return comments;
    }


    /**
     * 循环迭代找出子集回复
     * @param childComments   所有子评论
     * @param parentName1  父评论的姓名
     */
    private void combineChildren(List<Comments> childComments, String parentName1) {
        //判断是否有一级子回复
        if(childComments.size() > 0){
            //循环找出子评论的id
            for(Comments childComment : childComments){
                String parentNickname = childComment.getAccount().getUsername();
                childComment.setParentName(parentName1);
                tempReplys.add(childComment);
                Long childId = childComment.getId();
                //查询二级以及所有子集回复
                recursively(childId, parentNickname);
            }
        }
    }

    /**
     * 循环迭代找出子集回复
     * @param childId  子评论的id
     * @param parentName2  子评论的姓名
     */
    private void recursively(Long childId, String parentName2) {
        //根据子一级评论的id找到子二级评论
        List<Comments> replayComments = commentsDao.erjihuifu(childId);

        if(replayComments.size() > 0){
            for(Comments replayComment : replayComments){
                String parentName = replayComment.getAccount().getUsername();
                replayComment.setParentName(parentName2);
                Long replayId = replayComment.getId();
                tempReplys.add(replayComment);
                //循环迭代找出子集回复
                recursively(replayId,parentName);
            }
        }
    }


}
