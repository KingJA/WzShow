package com.controller.web;

import com.bean.*;
import com.dao.QuestionDao;
import com.service.QuestionService;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller
@RequestMapping(value = "/question")
public class QuestionController {
    private static Logger logger = Logger.getLogger(NewsController.class);
    @Autowired
    QuestionDao questionDao;
    @Autowired
    QuestionService questionService;

    @RequestMapping(value = "publish", method = RequestMethod.GET)
    public ModelAndView publish() {
        logger.debug("publish");
        ModelAndView modelAndView = new ModelAndView("publish");
        List<Tag> tags = questionDao.selectAllTag();
        logger.debug(tags.size());
        modelAndView.addObject("tags", tags);
        return modelAndView;
    }

    @RequestMapping(value = "doPublish", method = RequestMethod.POST)
    public ModelAndView doPublish(Question question, @RequestParam("files") MultipartFile[] files, HttpServletRequest request) {
        logger.debug("doPublish");
        ModelAndView modelAndView = new ModelAndView("redirect:/question/questionPage?page=1");
        questionService.saveQuestion(question, files, request);
        return modelAndView;
    }

    @RequestMapping(value = "/questionPage", method = RequestMethod.GET)
    public ModelAndView questionPage(@RequestParam("page") String page) {
        Integer currentPage = Integer.valueOf(page);
        Page<Question> pageInfo = questionService.getQuestionsByPage(currentPage, Page.DEFAULT_PAGE_SIZE);
        logger.debug("pageInfo===============" + pageInfo.toString());
        logger.debug("getTotelPages" + pageInfo.getTotelPages());
        logger.debug("getTotelItems" + pageInfo.getTotelItems());
        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    @RequestMapping(value = "/detail/{questionId}", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable long questionId, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("questionDetail");
        Account currentAccount = (Account) session.getAttribute("account");
        int ifCollect = questionDao.selectIfCollect(currentAccount.getAccountId(), questionId);
        logger.debug("questionDetail");
        Question question = questionDao.selectQuestionById(questionId);
        Account questionCccount = questionDao.selectAccountByQuestionId(questionId);
        List<AnswerResult> answerResults = questionDao.selectAnsewersByQuestionId(questionId);
        modelAndView.addObject("collect",new SingleValue(ifCollect>0?0:1,ifCollect>0?"取消收藏":"收藏"));
        modelAndView.addObject("question", question);
        modelAndView.addObject("account", questionCccount);
        modelAndView.addObject("answerResults", answerResults);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/detail/praise", method = RequestMethod.POST)
    public AppResult praise(@RequestParam("accountId") long accountId,@RequestParam("answerId") long answerId) {
        AppResult<SingleValue> appResult = new AppResult();
        logger.debug("praise");
        if (questionDao.selectPraiseRecord(accountId, answerId) > 0) {
            appResult.setResultCode(4).setResultText("您已经点过赞了").setResultData(new SingleValue(0));
        }else{
            int praiseCount = questionDao.selectPraiseCountByAnswerId(answerId);
            questionDao.addPraise(answerId);
            questionDao.insertPraiseRecord(accountId,answerId);
            appResult.setResultCode(0).setResultText("点赞成功").setResultData(new SingleValue(praiseCount + 1 ));
        }

        return appResult;
    }
    @ResponseBody
    @RequestMapping(value = "/detail/collect", method = RequestMethod.POST)
    public SingleValue collect(@RequestParam("accountId") long accountId,@RequestParam("questionId") long questionId,@RequestParam("collectCode") int collectCode) {
         SingleValue singleValue=null;
        logger.debug("collect");
        if (collectCode == 1) {//添加收藏
            questionDao.addCollect(accountId,questionId);
            singleValue=new SingleValue(0,"取消收藏");
        }else{//取消收藏
            questionDao.cancelCollect(accountId,questionId);
            singleValue=new SingleValue(1,"收藏");
        }
        return singleValue;
    }


}
