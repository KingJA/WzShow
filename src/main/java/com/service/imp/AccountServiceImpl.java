package com.service.imp;

import com.bean.Account;
import com.dao.DaoAccount;
import com.service.AccountService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:48
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Service
public class AccountServiceImpl implements AccountService {
    private static Logger logger = Logger.getLogger(AccountServiceImpl.class);
    @Autowired
    DaoAccount daoAccount;

    public Account login(String name, String password) {
        Map<String, Object> map = new HashMap<String, Object>();
        logger.debug("name:"+name+" password:"+password);
        map.put("name",name);
        map.put("password",password);
        return daoAccount.selectAccountByMap(map);
    }

    public void register(Account account) {
        logger.debug("AccountServiceImpl");
        if (daoAccount.selectAccount(account) > 0) {
            logger.debug("已经注册过");
        } else {
            daoAccount.insertAccount(account);
        }
    }
}
