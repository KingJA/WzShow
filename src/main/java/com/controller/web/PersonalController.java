package com.controller.web;

import com.bean.MyAnswer;
import com.bean.Question;
import com.bean.SingleValue;
import com.dao.PersonalDao;
import com.service.PersonalService;
import com.util.HtmlBuilder;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/personal")
public class PersonalController {
    private static Logger logger = Logger.getLogger(NewsController.class);
    @Autowired
    PersonalDao personalDao;

    @Autowired
    PersonalService personalService;


    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView personal() {
        ModelAndView modelAndView = new ModelAndView("personal");
        return modelAndView;
    }

    /**
     * 我的问题
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "myAsk", method = RequestMethod.POST)
    public SingleValue myAsk(@RequestParam("accountId") long accountId, @RequestParam("currentPage") int currentPage) {
        Page<Question> page = personalService.getMyAskByPage(accountId, currentPage, 2);
        StringBuilder sb = new StringBuilder();
        for (Question question : page.getPageDatas()) {
            //TODO 增加点赞
            sb.append("<div class='selectItem row'>" +
                    "<div class='col-md-1'> <a  class='btn btn-success btn-xs'><span class='glyphicon glyphicon-star'></span> 5</a></div>" +
                    "<div class='col-md-9'><a target='_blank' class='text-overflow' href='/question/detail/" + question.getQuestionId() + "'>" + question.getTitle() + "</a></div>" +
                    "<div class='col-md-2'><span class=''>" + question.getCreateYearDay() + "</span></div>" +
                    "</div>");
        }
        sb.append(HtmlBuilder.getPageHtml(page, "myAsk"));
        SingleValue singleValue = new SingleValue(sb.toString());
        return singleValue;
    }

    /**
     * 我的回答
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "myAnswer", method = RequestMethod.POST)
    public SingleValue myAnswer(@RequestParam("accountId") long accountId, @RequestParam("currentPage") int currentPage) {
        Page<MyAnswer> page = personalService.getMyAnswerByPage(accountId, currentPage, 2);
        StringBuilder sb = new StringBuilder();
        for (MyAnswer answer : page.getPageDatas()) {
            sb.append("<div class='selectItem '>" +
                    "<div class='row'>" +
                    "<div class='col-md-1'>"+"问题"+"</div>" +
                    "<div class='col-md-11'><a target='_blank' class='text-overflow' href='/question/detail/" + answer.getQuestionId() + "'>" + answer.getTitle() + "</a></div>" +
                    "</div>" +
                    "<div class='row'>" +
                    "<div class='col-md-1'>"+"回答"+"</div>" +
                    "<div class='col-md-8'><a target='_blank' class='text-overflow' href='/question/detail/" + answer.getContent() + "'>" + answer.getContent() + "</a></div>" +
                    "<div class='col-md-1'> <a  class='btn btn-success btn-xs'><span class='glyphicon glyphicon-thumbs-up'></span> 5</a></div>" +
                    "<div class='col-md-2'><span class=''>" + answer.getCreateYearDay() + "</span></div>" +
                    "</div>" +
                    "</div>");
        }
        sb.append(HtmlBuilder.getPageHtml(page, "myAnswer"));
        SingleValue singleValue = new SingleValue(sb.toString());
        return singleValue;
    }


}
