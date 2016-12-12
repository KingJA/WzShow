package com.controller.web;

import com.bean.*;
import com.dao.QuestionDao;
import com.service.OperationService;
import com.service.QuestionService;
import com.util.Page;
import com.util.UploadUtil;
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
    private static Logger logger = Logger.getLogger(QuestionController.class);
    @Autowired
    QuestionDao questionDao;
    @Autowired
    QuestionService questionService;
    @Autowired
    OperationService operationService;

    /**
     * 发布问题页面
     * @return
     */
    @RequestMapping(value = "/publish", method = RequestMethod.GET)
    public ModelAndView publish() {
        ModelAndView modelAndView = new ModelAndView("publish");
        List<Tag> tags = questionDao.selectAllTag();
        logger.debug(tags.size());
        modelAndView.addObject("tags", tags);
        return modelAndView;
    }

    /**
     * 处理发布问题
     * @param question
     * @param files
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/doPublish", method = RequestMethod.POST)
    public ModelAndView doPublish(Question question, @RequestParam("files") MultipartFile[] files, HttpServletRequest request, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/question/questionPage?page=1");
        Long accountId = (Long) (session.getAttribute("accountId"));
        long questionId = questionService.saveQuestion(question, files, request);
        operationService.doPublish(accountId, questionId, question.getTitle());
        return modelAndView;
    }

    /**
     * 问题列表
     * @param page
     * @return
     */
    @RequestMapping(value = "/questionPage", method = RequestMethod.GET)
    public ModelAndView questionPage(@RequestParam("page") String page) {
        Integer currentPage = Integer.valueOf(page);
        Page<Question> pageInfo = questionService.getQuestionsByPage(currentPage, Page.DEFAULT_PAGE_SIZE);
        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    /**
     * 问题详情
     * @param questionId
     * @param session
     * @return
     */
    @RequestMapping(value = "/detail/{questionId}", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable long questionId, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("questionDetail");
        Account currentAccount = (Account) session.getAttribute("account");
        int ifCollect = questionDao.selectIfCollect(currentAccount.getAccountId(), questionId);
        Question question = questionDao.selectQuestionById(questionId);
        Account questionCccount = questionDao.selectAccountByQuestionId(questionId);
        List<AnswerResult> answerResults = questionDao.selectAnsewersByQuestionId(questionId);
        modelAndView.addObject("collect", new SingleValue(ifCollect > 0 ? 1 : 0, ifCollect > 0 ? "已收藏" : "收藏"));
        modelAndView.addObject("question", question);
        modelAndView.addObject("account", questionCccount);
        modelAndView.addObject("answerResults", answerResults);
        return modelAndView;
    }

    /**
     * 点赞
     * @param accountId
     * @param answerId
     * @param questionId
     * @param title
     * @param accountBId
     * @param name
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/detail/praise", method = RequestMethod.POST)
    public AppResult praise(@RequestParam("accountId") long accountId, @RequestParam("answerId") long answerId,
                            @RequestParam("questionId") long questionId, @RequestParam("title") String title,
                            @RequestParam("accountBId") long accountBId, @RequestParam("name") String name) {
        AppResult<SingleValue> appResult = new AppResult();
        if (questionDao.selectPraiseRecord(accountId, answerId) > 0) {
            appResult.setResultCode(4).setResultText("您已经点过赞了").setResultData(new SingleValue(0));
        } else {
            int praiseCount = questionDao.selectPraiseCountByAnswerId(answerId);
            questionDao.addPraise(answerId);
            questionDao.insertPraiseRecord(accountId, answerId);
            operationService.doPraise(accountId, questionId, title, accountBId, name);
            appResult.setResultCode(0).setResultText("点赞成功").setResultData(new SingleValue(praiseCount + 1));
        }

        return appResult;
    }

    /**
     * 收藏问题
     * @param accountId
     * @param accountBId
     * @param name
     * @param questionId
     * @param title
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/detail/collect", method = RequestMethod.POST)
    public SingleValue collect(@RequestParam("accountId") long accountId, @RequestParam("accountBId") long accountBId,
                               @RequestParam("name") String name, @RequestParam("questionId") long questionId, @RequestParam("title") String title) {
        SingleValue singleValue = new SingleValue();
        questionDao.addCollect(accountId, questionId);
        operationService.beQuestionCollected(accountId, questionId, title, accountBId, name);
        return singleValue;
    }

    /**
     * 回答问题
     * @param content
     * @param questionId
     * @param title
     * @param files
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/detail/answer", method = RequestMethod.POST)
    public ModelAndView answer(@RequestParam("content") String content, @RequestParam("questionId") long questionId, @RequestParam("title") String title, @RequestParam("files") MultipartFile[] files,
                               HttpServletRequest request, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/question/detail/" + questionId);
        Account account = (Account) session.getAttribute("account");
        long accountId = account.getAccountId();
        String imgUrls = UploadUtil.uploadMultiImages(files, request);
        questionDao.answerQuestion(accountId, questionId, content, imgUrls);
        operationService.doAnswer(accountId, questionId, title);
        return modelAndView;
    }


}
