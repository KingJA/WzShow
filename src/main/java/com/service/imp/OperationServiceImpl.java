package com.service.imp;

import com.dao.OperationDao;
import com.service.OperationService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description：TODO
 * Create Time：2016/11/28 9:54
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Service
public class OperationServiceImpl implements OperationService {
    @Autowired
    private OperationDao operationDao;
    private static Logger logger = Logger.getLogger(OperationServiceImpl.class);

    public void doPublish(long accountId, long questionId, String title) {
        operationDao.addIncome(accountId, 10, 10);
        operationDao.recordDoPublish(accountId, questionId, title, 10, 10);
    }

    public void doAnswer(long accountId, long questionId, String title) {
        operationDao.addIncome(accountId, 5, 5);
        operationDao.recordDoAnswer(accountId, questionId, title, 5, 5);
    }

    public void doPraise(long accountId, long questionId, String title, long accountBId, String name) {
        operationDao.addIncome(accountId, 2, 2);
        operationDao.addIncome(accountBId, 2, 2);
        operationDao.recordDoPraise(accountId, questionId, title, accountBId, name, 2, 2);
        operationDao.recordBePraised(accountBId, questionId, title, accountId, name, 2, 2);
    }

    public void doAccepteAnswer(long accountId, long questionId, String title, long accountBId, String name) {
        operationDao.addIncome(accountId, 5, 5);
        operationDao.addIncome(accountBId, 20, 20);
        operationDao.recordDoAccepteAnswer(accountId, questionId, title, accountBId, name, 5, 5);
        operationDao.recordBeAccepteAnswer(accountBId, questionId, title, accountId, name, 20, 20);
    }

    public void beQuestionCollected(long accountId, long questionId, String title, long accountBId, String name) {
        operationDao.addIncome(accountBId, 5, 5);
        operationDao.recordBeQuestionCollected(accountId, questionId, title, accountBId, name, 5, 5);
    }

    public void beAttentioned(long accountId, long accountBId, String name) {
        operationDao.addIncome(accountId, 10, 10);
        operationDao.recordBeAttentioned(accountId, accountBId, name,10,10);
    }

    public void doReward(long accountId, long questionId, String title, long accountBId, String name) {
        operationDao.addIncome(accountId, 10, 10);
        operationDao.recordDoReward(accountId,  questionId,  title,  accountBId,  name,10,10);
    }

    public void doRegister(long accountId) {
        operationDao.addIncome(accountId, 0, 200);
        operationDao.recordDoRegister(accountId,10,10);
    }
}
