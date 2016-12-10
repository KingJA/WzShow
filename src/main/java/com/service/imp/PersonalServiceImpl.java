package com.service.imp;

import com.bean.*;
import com.controller.web.NewsController;
import com.dao.PersonalDao;
import com.service.PersonalService;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/28 9:54
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Service
public class PersonalServiceImpl implements PersonalService {
    private static Logger logger = Logger.getLogger(NewsController.class);
    @Autowired
    PersonalDao personalDao;
    public Page<Question> getMyAskByPage(long accountId,int currentPage, int pageSize) {
        int questionCount = personalDao.selectMyAskCountAccountId(accountId);
        Page<Question> page = new Page<Question>();
        page.setTotelItems(questionCount);
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<Question> questions = personalDao.selectMyAskByAccountId(accountId,page.getStartRow(), pageSize);
        page.setPageDatas(questions);
        return page;
    }

    public Page<MyAnswer> getMyAnswerByPage(long accountId, int currentPage, int pageSize) {
        int answerCount = personalDao.selectMyAnswerCountAccountId(accountId);
        Page<MyAnswer> page = new Page<MyAnswer>();
        page.setTotelItems(answerCount);
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<MyAnswer> answers = personalDao.selectMyAnswerByAccountId(accountId,page.getStartRow(), pageSize);
        page.setPageDatas(answers);
        return page;
    }

    public Page<MyCollect> getMyCollectByPage(long accountId, int currentPage, int pageSize) {
        int collectCount = personalDao.selectMyCollectCountAccountId(accountId);
        Page<MyCollect> page = new Page<MyCollect>();
        page.setTotelItems(collectCount);
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<MyCollect> collects = personalDao.selectMyCollectByAccountId(accountId,page.getStartRow(), pageSize);
        page.setPageDatas(collects);
        return page;
    }

    public Page<MyAttention> getMyAttentionByPage(long accountId, int currentPage, int pageSize) {
        int attentionCount = personalDao.selectMyAttentionCountById(accountId);
        Page<MyAttention> page = new Page<MyAttention>();
        page.setTotelItems(attentionCount);
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<MyAttention> attentions = personalDao.selectMyAttentionByAccountId(accountId,page.getStartRow(), pageSize);
        page.setPageDatas(attentions);
        return page;
    }

    public Page<MyGift> getMyGiftByPage(long accountId, int currentPage, int pageSize) {
        int myGiftCount = personalDao.selectMyGiftCount(accountId);
        Page<MyGift> page = new Page<MyGift>();
        page.setTotelItems(myGiftCount);
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<MyGift> myGifts = personalDao.selectMyGift(accountId,page.getStartRow(), pageSize);
        page.setPageDatas(myGifts);
        return page;
    }

    public Page<MyFootprint> getMyFootprintByPage(long accountId, int currentPage, int pageSize) {
        Page<MyFootprint> page = new Page<MyFootprint>();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<MyFootprint> myFootprints = personalDao.selectMyFootprint(accountId,page.getStartRow(), pageSize);
        page.setPageDatas(myFootprints);
        page.setTotelItems(myFootprints.size());
        return page;
    }
}
