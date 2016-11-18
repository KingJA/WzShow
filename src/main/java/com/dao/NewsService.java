package com.dao;

import com.bean.News;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/11/4.
 */
@Repository
public interface NewsService {
    News selectNewsById(long id);

    List<News> selectNews();

    List<News> selectNewsByPage(@Param(value = "page")int page, @Param(value = "pageSize")int pageSize);

    void addNews(News news);

    void editNews(News news);

    void deleteNews(long id);
}
