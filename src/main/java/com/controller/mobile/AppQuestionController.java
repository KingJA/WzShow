package com.controller.mobile;

import com.appbean.AppAnswer;
import com.appbean.AppQuestion;
import com.appbean.AppQuestionDetail;
import com.appbean.SingleInt;
import com.bean.Account;
import com.bean.AppResult;
import com.dao.AccountDao;
import com.dao.QuestionDao;
import com.service.QuestionService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

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
    QuestionDao questionDao;
    @Autowired
    AccountDao accountDao;
    @Autowired
    QuestionService questionService;

    @ResponseBody
    @RequestMapping(value = "/getQuestions", method = RequestMethod.POST)
    public AppResult getQuestions(@RequestParam("token") String token, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize, @RequestParam("solved") int solved) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult<List<AppQuestion>>(0, "获取问题列表成功", questionDao.getQuestionsBySolved(accountId, pageIndex, pageSize, solved));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getHotQuestions", method = RequestMethod.POST)
    public AppResult getHotQuestions(@RequestParam("token") String token, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            return new AppResult<List<AppQuestion>>(0, "获取热门列表成功", questionDao.getHotQuestions(accountId, pageIndex, pageSize));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getAnswers", method = RequestMethod.POST)
    public AppResult getAnswers(@RequestParam("token") String token, @RequestParam("questionId") long questionId, @RequestParam("pageIndex") int pageIndex, @RequestParam("pageSize") int pageSize) {
        long accountId = checkTokenAvail(token);
        logger.error(accountId);
        if (accountId != -1) {
            return new AppResult<List<AppAnswer>>(0, "获取回答列表成功", questionDao.getAnswers(accountId, questionId, pageIndex, pageSize));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }


    @ResponseBody
    @RequestMapping(value = "/getQuestionDetail", method = RequestMethod.POST)
    public AppResult getQuestionDetail(@RequestParam("token") String token, @RequestParam("questionId") long questionId) {
        long accountId = checkTokenAvail(token);
        logger.error(accountId);
        if (accountId != -1) {
            return new AppResult<AppQuestionDetail>(0, "获取回答列表成功", new AppQuestionDetail(questionDao.getQuestionInfo(accountId,questionId),questionDao.getAnswers(accountId,questionId,0,20)));
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    public AppResult doPublish(@RequestParam("files") MultipartFile[] files, @RequestParam("token") String token, @RequestParam("title") String title, @RequestParam("content") String content, HttpSession session) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            long questionId = questionService.publish(accountId, title, content, 1, files, session);
            if (questionId > 0) {
                return new AppResult(0, "发布问题成功", null);
            } else {
                return new AppResult(0, "发布问题失败", null);
            }
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/answer", method = RequestMethod.POST)
    public AppResult doAnswer(@RequestParam("files") MultipartFile[] files, @RequestParam("token") String token, @RequestParam("questionId") String questionId, @RequestParam("content") String content, HttpSession session) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            long answerLine = questionService.answer(accountId, Long.valueOf(questionId), content, files, session);
            if (answerLine > 0) {
                return new AppResult(0, "回答问题成功", null);
            } else {
                return new AppResult(0, "回答问题失败", null);
            }
        } else {
            return new AppResult(4, "Token error", null);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/collect", method = RequestMethod.POST)
    public AppResult doCollect(@RequestParam("token") String token, @RequestParam("questionId") long questionId, @RequestParam("ifCollect") int ifCollect) {
        long accountId = checkTokenAvail(token);
        if (accountId == -1) {
            return new AppResult(4, "Token error", null);
        }
        if (ifCollect == 1) {//已收藏=》取消收藏
            if (questionDao.cancelCollect(accountId, questionId) > 0) {
                return new AppResult<SingleInt>(0, "取消收藏成功", new SingleInt(0));
            } else {
                return new AppResult<SingleInt>(4, "取消收藏失败", null);
            }

        } else {//未收藏=》收藏
            if (questionDao.collect(accountId, questionId) > 0) {
                return new AppResult<SingleInt>(0, "收藏成功", new SingleInt(1));
            } else {
                return new AppResult<SingleInt>(0, "收藏失败", null);
            }
        }
    }

    @ResponseBody
    @RequestMapping(value = "/attention", method = RequestMethod.POST)
    public AppResult attention(@RequestParam("token") String token, @RequestParam("otherAccountId") long questionId,
                               @RequestParam("ifAttention") int ifCollect) {
        long accountId = checkTokenAvail(token);
        if (accountId == -1) {
            return new AppResult(4, "Token error", null);
        }
        if (ifCollect == 1) {//已关注=》取消关注
            if (questionDao.cancleAttention(accountId, questionId) > 0) {
                return new AppResult<SingleInt>(0, "取消关注成功", new SingleInt(0));
            } else {
                return new AppResult<SingleInt>(4, "取消关注失败", null);
            }

        } else {//未关注=》关注
            if (questionDao.attention(accountId, questionId) > 0) {
                return new AppResult<SingleInt>(0, "关注成功", new SingleInt(1));
            } else {
                return new AppResult<SingleInt>(0, "关注失败", null);
            }
        }
    }

    @ResponseBody
    @RequestMapping(value = "/praise", method = RequestMethod.POST)
    public AppResult doPraise(@RequestParam("token") String token, @RequestParam("answerId") long answerId) {
        long accountId = checkTokenAvail(token);
        if (accountId == -1) {
            return new AppResult(4, "Token error", null);
        } else {
            if (questionDao.praise(accountId, answerId) > 0) {
                return new AppResult<Object>(0, "点赞成功", null);
            } else {
                return new AppResult<Object>(4, "点赞失败", null);
            }
        }
    }

    @ResponseBody
    @RequestMapping(value = "/setBestAnswer", method = RequestMethod.POST)
    public AppResult setBestQuestion(@RequestParam("token") String token, @RequestParam("questionId") long questionId,
                                     @RequestParam("answerId") long answerId,
                                     @RequestParam("answerAccountId") long answerAccountId) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            if (questionDao.setBestAnswer(answerId) > 0 && questionDao.setQuestionSolved(questionId )> 0) {
                return new AppResult<Object>(0, "设为最佳答案成功", null);
            }else{
                return new AppResult<Object>(4, "设为最佳答案粗错了哦", null);
            }

        } else {
            return new AppResult<Object>(4, "Token error", null);
        }
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
