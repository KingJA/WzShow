package com.service.imp;

import com.bean.Account;
import com.dao.DaoAccount;
import com.service.AccountService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:48
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Service
public class AccountServiceImpl implements AccountService {
    private static Logger logger = Logger.getLogger(AccountServiceImpl.class);
    @Resource
    DaoAccount daoAccount;

    public Account login(String name, String password) {
        return null;
    }

    public void register(Account account) {
        if (daoAccount.selectAccount(account) > 0) {
            logger.debug("已经注册过");
        } else {
            daoAccount.insertAccount(account);
        }
    }
}
