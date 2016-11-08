package com.controller;

import com.bean.News;
import com.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2016/11/8.
 */
@Controller
@RequestMapping(value = "/news")
public class NewsController {
    @Autowired
    private NewsService newsService;
    @RequestMapping(value = "/getNews", method = RequestMethod.GET)
    public String getNews() {
        return "getNews";
    }

    @RequestMapping(value = "/addNews", method = RequestMethod.GET)
    public String addNews(News news) {
        System.out.println("addNews");
        newsService.addNews(news);
        return "addNews";
    }

    @RequestMapping(value = "/saveNews", method = RequestMethod.GET)
    public String saveNews(News news) {
        System.out.println("saveNews");
        newsService.addNews(news);
        return "redirect:/news/getNews";
    }

    @RequestMapping(value = "/editNews", method = RequestMethod.GET)
    public String editNews() {
        return "editNews";
    }
}
