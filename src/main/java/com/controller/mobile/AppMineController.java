package com.controller.mobile;

import com.appbean.AppQuestion;
import com.bean.Account;
import com.bean.AppResult;
import com.dao.AccountDao;
import com.dao.PersonalDao;
import com.dao.QuestionDao;
import com.dao.ShopDao;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/mobile/mine")
public class AppMineController {
    @Autowired
    private ShopDao shopDao;
    @Autowired
    private AccountDao accountDao;
    @Autowired
    private QuestionDao questionDao;
    @Autowired
    private PersonalDao personalDao;

    private static Logger logger = Logger.getLogger(AppMineController.class);

    @ResponseBody
    @RequestMapping(value = "/getMyQuestions", method = RequestMethod.POST)
    public AppResult getMyQuestions(@RequestParam("token") String token, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            List<AppQuestion> myQuestions = questionDao.getMyQuestions(accountId, pageIndex * pageSize, pageSize);
            return new AppResult(0, "Token error", myQuestions);
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getOtherQuestions", method = RequestMethod.POST)
    public AppResult getOtherQuestions(@RequestParam("token") String token, @RequestParam("otherAccountId") long otherAccountId, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult(0, "Token error", questionDao.getOtherQuestions(accountId, otherAccountId, pageIndex * pageSize, pageSize));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getOtherAnswers", method = RequestMethod.POST)
    public AppResult getOtherAnswers(@RequestParam("token") String token, @RequestParam("otherAccountId") long otherAccountId, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult(0, "Token error", questionDao.getOtherAnswers(accountId, otherAccountId, pageIndex * pageSize, pageSize));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getMyAnswers", method = RequestMethod.POST)
    public AppResult getMyAnswers(@RequestParam("token") String token, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult(0, "Token error", questionDao.getMyAnswers(accountId, pageIndex * pageSize, pageSize));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getMyAttentions", method = RequestMethod.POST)
    public AppResult getMyAttentions(@RequestParam("token") String token, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult(0, "Token error", personalDao.getMyAttentions(accountId, pageIndex * pageSize, pageSize));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getMyFans", method = RequestMethod.POST)
    public AppResult getMyFans(@RequestParam("token") String token, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult(0, "Token error", personalDao.getMyFans(accountId, pageIndex * pageSize, pageSize));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getMyCollections", method = RequestMethod.POST)
    public AppResult getMyCollects(@RequestParam("token") String token, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult(0, "Token error", personalDao.getMyCollects(accountId, pageIndex * pageSize, pageSize));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }
    @ResponseBody
    @RequestMapping(value = "/getOtherUserInfo", method = RequestMethod.POST)
    public AppResult getMyCollects(@RequestParam("token") String token, @RequestParam("otherAccountId") long otherAccountId) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult(0, "Token error", personalDao.getOtherUserInfo(accountId, otherAccountId ));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }
    @ResponseBody
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.POST)
    public AppResult getUserInfo(@RequestParam("token") String token) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult(0, "Token error", personalDao.getUserInfo(accountId));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }


    public long checkTokenAvail(String token) {
        long accountId = -1;
        Account account = accountDao.selectIdByToken(token);
        if (account != null) {
            accountId = account.getAccountId();
        }
        return accountId;
    }
}
