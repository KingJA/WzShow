package com.controller.web;

import com.bean.*;
import com.dao.AccountDao;
import com.dao.PersonalDao;
import com.service.PersonalService;
import com.util.HtmlBuilder;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

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
    AccountDao accountDao;

    @Autowired
    PersonalService personalService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView personal() {
        ModelAndView modelAndView = new ModelAndView("personal");

        return modelAndView;
    }

    @RequestMapping(value = "/{accountId}", method = RequestMethod.GET)
    public ModelAndView personal(@PathVariable long accountId, HttpSession session) {
        Account sessionAccount = (Account) session.getAttribute("account");
        ModelAndView modelAndView = new ModelAndView("personal");
        if (sessionAccount.getAccountId() == accountId) {
            modelAndView.addObject("who", "我");
        }else{
            modelAndView.addObject("who", "TA");
        }

        Account account = accountDao.selectAccountById(accountId);
        modelAndView.addObject("account", account);
        return modelAndView;
    }
    @RequestMapping(value = "/mygift", method = RequestMethod.POST)
    public ModelAndView personal(@RequestParam("accountId") long accountId,@RequestParam("currentPage") int currentPage) {
        logger.error("==========================accountId======================="+accountId);
        logger.error("==========================currentPage======================="+currentPage);
        ModelAndView modelAndView = new ModelAndView("personal/myGift");
        Page<MyGift> myGiftByPage = personalService.getMyGiftByPage(accountId, currentPage, 8);
        modelAndView.addObject("gitfPage",myGiftByPage);
        modelAndView.addObject("accountId",accountId);
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
        Page<Question> page = personalService.getMyAskByPage(accountId, currentPage, Page.DEFAULT_PAGE_SIZE);
        StringBuilder sb = new StringBuilder();
        if (!(page.getPageDatas().size() > 0)) {
            sb = new StringBuilder("<h3>暂无内容</h3>");
        }
        for (Question question : page.getPageDatas()) {
            //TODO 增加点赞
            sb.append("<div class='selectItem row'>" +
                    "<div class='col-md-1'> <a  class='btn btn-success btn-xs'><span class='glyphicon glyphicon-star'></span> 5</a></div>" +
                    "<div class='col-md-9'><a target='_blank' class='singleText' href='/question/detail/" + question.getQuestionId() + "'>" + question.getTitle() + "</a></div>" +
                    "<div class='col-md-2'><span class=''>" + question.getCreateYearDay() + "</span></div>" +
                    "</div>");
        }
        sb.append(HtmlBuilder.getPageHtml(page, "myAsk", Page.DEFAULT_VISIBLE_PAGE_SIZE));
        SingleValue singleValue = new SingleValue(sb.toString());
        return singleValue;
    }

    /**
     * 我的收藏
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "myCollect", method = RequestMethod.POST)
    public SingleValue myCollect(@RequestParam("accountId") long accountId, @RequestParam("currentPage") int currentPage) {
        Page<MyCollect> page = personalService.getMyCollectByPage(accountId, currentPage, Page.DEFAULT_PAGE_SIZE);
        StringBuilder sb = new StringBuilder();
        if (!(page.getPageDatas().size() > 0)) {
            sb = new StringBuilder("<h3>暂无内容</h3>");
        }
        for (MyCollect collect : page.getPageDatas()) {
            sb.append("<div class='selectItem row'>" +
                    "<div class='col-md-1'> <a  class='btn btn-success btn-xs'><span class='glyphicon glyphicon-star'></span> 5</a></div>" +
                    "<div class='col-md-9'><a target='_blank' class='singleText' href='/question/detail/" + collect.getQuestionId() + "'>" + collect.getTitle() + "</a></div>" +
                    "<div class='col-md-2'><span class=''>" + collect.getCreateYearDay() + "</span></div>" +
                    "</div>");
        }
        sb.append(HtmlBuilder.getPageHtml(page, "myCollect", Page.DEFAULT_VISIBLE_PAGE_SIZE));
        SingleValue singleValue = new SingleValue(sb.toString());
        return singleValue;
    }

    /**
     * 我的关注
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "myAttention", method = RequestMethod.POST)
    public SingleValue myAttention(@RequestParam("accountId") long accountId, @RequestParam("currentPage") int currentPage) {
        Page<MyAttention> page = personalService.getMyAttentionByPage(accountId, currentPage, Page.DEFAULT_PAGE_SIZE);
        StringBuilder sb = new StringBuilder();
        List<MyAttention> pageDatas = page.getPageDatas();
        if (!(pageDatas.size() > 0)) {
            sb = new StringBuilder("<h3>暂无内容</h3>");
        }

        for (int i = 0; i < pageDatas.size(); i++) {

            if (i % 3 == 0) {//另起一行
                sb.append("<div class='row'>");
                sb.append("<div class='col-md-4 selectItem'><img src='" + pageDatas.get(i).getAvatar() + "' width='96px' height='96px' class='img-circle'><a target='_blank' href='/personal/" + pageDatas.get(i).getOtherAccountId() + "'>" + pageDatas.get(i).getName() + "</a></div>");
            } else if ((i + 1) % 3 == 0) {
                sb.append("<div class='col-md-4 selectItem'><img src='" + pageDatas.get(i).getAvatar() + "' width='96px' height='96px' class='img-circle'><a target='_blank' href='/personal/" + pageDatas.get(i).getOtherAccountId() + "'>" + pageDatas.get(i).getName() + "</a></div>");
                sb.append("</div >");
            } else {
                sb.append("<div class='col-md-4 selectItem'><img src='" + pageDatas.get(i).getAvatar() + "' width='96px' height='96px' class='img-circle'><a target='_blank' href='/personal/" + pageDatas.get(i).getOtherAccountId() + "'>" + pageDatas.get(i).getName() + "</a></div>");
            }
        }
        sb.append("</div>");

        sb.append(HtmlBuilder.getPageHtml(page, "myAttention", Page.DEFAULT_VISIBLE_PAGE_SIZE));
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
        Page<MyAnswer> page = personalService.getMyAnswerByPage(accountId, currentPage, Page.DEFAULT_PAGE_SIZE);
        StringBuilder sb = new StringBuilder();
        if (!(page.getPageDatas().size() > 0)) {
            sb = new StringBuilder("<h3>暂无内容</h3>");
        }
        for (MyAnswer answer : page.getPageDatas()) {
            sb.append("<div class='selectItem '>" +
                    "<div class='row'>" +
                    "<div class='col-md-1'>" + "问题" + "</div>" +
                    "<div class='col-md-11'><a target='_blank' class='text-overflow' href='/question/detail/" + answer.getQuestionId() + "'>" + answer.getTitle() + "</a></div>" +
                    "</div>" +
                    "<div class='row'>" +
                    "<div class='col-md-1'>" + "回答" + "</div>" +
                    "<div class='col-md-8'><a target='_blank' class='text-overflow' href='/question/detail/" + answer.getContent() + "'>" + answer.getContent() + "</a></div>" +
                    "<div class='col-md-1'> <a  class='btn btn-success btn-xs'><span class='glyphicon glyphicon-thumbs-up'></span> 5</a></div>" +
                    "<div class='col-md-2'><span class=''>" + answer.getCreateYearDay() + "</span></div>" +
                    "</div>" +
                    "</div>");
        }
        sb.append(HtmlBuilder.getPageHtml(page, "myAnswer", Page.DEFAULT_VISIBLE_PAGE_SIZE));
        SingleValue singleValue = new SingleValue(sb.toString());
        return singleValue;
    }


}
