package com.controller;

import com.bean.News;
import com.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Administrator on 2016/11/8.
 */
@Controller
@RequestMapping(value = "/news")
public class NewsController {
    @Autowired
    private NewsService newsService;
    @RequestMapping(value = "/getNews", method = RequestMethod.GET)
    public ModelAndView getNews() {
        ModelAndView modelAndView = new ModelAndView("newList");
        List<News> newsList = newsService.selectNews();
        modelAndView.addObject("newsList",newsList);
        return modelAndView;
    }

    @RequestMapping(value = "/addNews", method = RequestMethod.GET)
    public String addNews() {
        System.out.println("addNews");
        return "addNews";
    }

    @RequestMapping(value = "/saveNews", method = RequestMethod.POST)
    public String saveNews(News news) {
        System.out.println(news.toString());
        newsService.addNews(news);
        return "redirect:/news/getNews";
    }

    @RequestMapping(value = "/editNews/{newsId}", method = RequestMethod.GET)
    public ModelAndView editNews(@PathVariable long newsId) {
        ModelAndView modelAndView = new ModelAndView("editNews");
        News news = newsService.selectNewsById(newsId);
        modelAndView.addObject("news",news);
        System.out.println(news.toString());
        return modelAndView;
    }

    @RequestMapping(value = "/updateNews", method = RequestMethod.POST)
    public String updateNews(News news) {
        System.out.println(news.toString());
        newsService.editNews(news);
        return "redirect:/news/getNews";
    }
}
