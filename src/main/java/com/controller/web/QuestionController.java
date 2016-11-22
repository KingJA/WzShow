package com.controller.web;

import com.bean.Question;
import com.bean.Tag;
import com.dao.QuestionDao;
import com.service.QuestionService;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView questionPage(@RequestParam( "page" ) String page) {
        Integer currentPage = Integer.valueOf(page);
        Page<Question> pageInfo = questionService.getQuestionsByPage(currentPage, Page.DEFAULT_PAGE_SIZE);
        logger.debug("pageInfo==============="+pageInfo.toString());
        logger.debug("getTotelPages"+pageInfo.getTotelPages());
        logger.debug("getTotelItems"+pageInfo.getTotelItems());
        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("pageInfo",pageInfo);
        return modelAndView;
    }
    @RequestMapping(value = "/detail/{questionId}", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable String questionId) {
        logger.debug("questionDetail");
        ModelAndView modelAndView = new ModelAndView("questionDetail");
        return modelAndView;
    }


}
