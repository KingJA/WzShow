package com.controller;

import com.bean.News;
import com.service.NewsService;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2016/11/8.
 */
@Controller
@RequestMapping(value = "/news")
public class NewsController {
    private static Logger logger = Logger.getLogger(NewsController.class);
    private int pageSize = 2;
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/getNews", method = RequestMethod.GET)
    public ModelAndView getNews() {
        ModelAndView modelAndView = new ModelAndView("newsList");
        List<News> newsList = newsService.selectNews();
        modelAndView.addObject("newsList", newsList);
        return modelAndView;
    }
    @RequestMapping(value = "/getNewsByPage", method = RequestMethod.GET)
    public ModelAndView getNewsByPage(@RequestParam( "page" ) String page) {
        Integer currentPage = Integer.valueOf(page);
        ModelAndView modelAndView = new ModelAndView("newsPageList");
        List<News> totleNewsList = newsService.selectNews();
        int totelPages;
        if (totleNewsList.size() % pageSize == 0) {
            totelPages=totleNewsList.size()/ pageSize;
        }else{
            totelPages=totleNewsList.size()/ pageSize+1;
        }
        List<News> newsList = newsService.selectNewsByPage((currentPage-1)*pageSize);

        modelAndView.addObject("totelNews", totleNewsList.size());
        modelAndView.addObject("newsList", newsList);
        modelAndView.addObject("currentPage", currentPage);
        modelAndView.addObject("totelPages", totelPages);
        return modelAndView;
    }

    @RequestMapping(value = "/addNews", method = RequestMethod.GET)
    public String addNews() {
        System.out.println("addNews");
        return "addNews";
    }

    @RequestMapping(value = "/saveNews", method = RequestMethod.POST)
    public String saveNews(News news,@RequestParam("newsTopImg") MultipartFile file,@RequestParam("newsContentImgs") MultipartFile[] files,HttpServletRequest request) {
        logger.debug("saveNews");
        if (files != null && files.length > 0) {
            StringBuilder sb = new StringBuilder();
            for (MultipartFile singleFile : files) {
                logger.debug("图片名称"+singleFile.getOriginalFilename());
                uploadImg(singleFile, request);
                sb.append("/upload/"+singleFile.getOriginalFilename()+"#");
            }
            news.setNewsContentUrl(sb.toString());
        }
        if (file!=null&&!file.isEmpty()) {
            logger.debug("文件不为空");
            uploadImg(file, request);
            news.setNewsTopUrl("/upload/"+file.getOriginalFilename());
        }

        System.out.println(news.toString());
        newsService.addNews(news);
        return "redirect:/news/getNews";
    }

    private void uploadImg( @RequestParam("newsTopImg") MultipartFile file, HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
        String fileName = file.getOriginalFilename();
        File saveFile = new File(realPath, fileName);
        logger.debug(saveFile.getAbsolutePath());
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(), saveFile);
        } catch (IOException e) {
            logger.debug("IOException"+e.getMessage());
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/editNews/{newsId}", method = RequestMethod.GET)
    public ModelAndView editNews(@PathVariable long newsId) {
        ModelAndView modelAndView = new ModelAndView("editNews");
        News news = newsService.selectNewsById(newsId);
        modelAndView.addObject("news", news);
        System.out.println(news.toString());
        return modelAndView;
    }

    @RequestMapping(value = "/updateNews", method = RequestMethod.POST)
    public String updateNews(News news) {
        System.out.println(news.toString());
        newsService.editNews(news);
        return "redirect:/news/getNews";
    }


    @RequestMapping(value = "/deleteNews/{newsId}", method = RequestMethod.GET)
    public String deleteNews(@PathVariable long newsId) {
        newsService.deleteNews(newsId);
        return "redirect:/news/getNews";
    }
    @ResponseBody
    @RequestMapping(value = "/getNewsJson/{newsId}", method = RequestMethod.GET)
    public News getNewsJsonById(@PathVariable long newsId) {
        // 记录debug级别的信息
        logger.debug("This is debug message.");
        // 记录info级别的信息
        logger.info("This is info message.");
        // 记录error级别的信息
        logger.error("This is error message.");
        News news = newsService.selectNewsById(newsId);
        return news;
    }
}
