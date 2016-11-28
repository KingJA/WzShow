package com.service.imp;

import com.bean.MyAnswer;
import com.bean.Question;
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
        List<MyAnswer> answers = personalDao.selectMyAnswerByAccountId(accountId,page.getStartRow(), pageSize);
        page.setPageDatas(answers);
        return page;
    }
}
