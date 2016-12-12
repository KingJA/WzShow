package com.controller.web;

import com.bean.Question;
import com.service.SearchService;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {
    private static Logger logger = Logger.getLogger(SearchController.class);
    @Autowired
    SearchService searchService;

    /**
     * 搜索页面(分页)
     * @param keyword
     * @return
     */
    @RequestMapping(value = "/question", method = RequestMethod.GET)
    public ModelAndView searchQuestion(@RequestParam("keyword") String keyword) {
        ModelAndView modelAndView = new ModelAndView("search");
        Page<Question> pageInfo = searchService.getSelectedQuestionsByPage(keyword, 1, Page.DEFAULT_PAGE_SIZE);
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }
}
