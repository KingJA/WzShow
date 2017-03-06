package com.controller.mobile;

import com.bean.Account;
import com.bean.AppResult;
import com.dao.AccountDao;
import com.service.AccountService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/mobile/question")
public class AppQuestionController {
    private static Logger logger = Logger.getLogger(AppQuestionController.class);
    @Autowired
    AccountService accountService;
    @Autowired
    AccountDao accountDao;

    /**
     * 登录
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getQuestions", method = RequestMethod.POST)
    public AppResult getQuestions(@RequestParam("token") String token, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {

        logger.error("token: "+token);
        logger.error("pageIndex: "+pageIndex);
        logger.error("pageSize: "+pageSize);
        return new AppResult();
    }


    /**
     * 检验token
     *
     * @param token
     * @return
     */

    public long checkTokenAvail(String token) {
        long accountId = -1;
        Account account = accountDao.selectIdByToken(token);
        if (account != null) {
            accountId = account.getAccountId();
        }
        return accountId;
    }

}
