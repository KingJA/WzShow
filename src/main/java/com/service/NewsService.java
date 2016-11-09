package com.service;

import com.bean.News;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/11/4.
 */
@Repository
public interface NewsService {
    News selectNewsById(long id);

    List<News> selectNews();

    void addNews(News news);

    void editNews(News news);
}
