package com.service.imp;

import com.bean.Question;
import com.controller.web.NewsController;
import com.dao.SearchDao;
import com.service.SearchService;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/28 9:54
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Service
public class SearchServiceImpl implements SearchService {
    private static Logger logger = Logger.getLogger(NewsController.class);
    @Autowired
    private SearchDao searchDao;

    public Page<Question> getSelectedQuestionsByPage(String keyword, int currentPage, int pageSize) {
        Page<Question> page = new Page<Question>();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<Question> questions = searchDao.searchQuestion(keyword, page.getStartRow(), pageSize);
        page.setPageDatas(questions);
        page.setTotelItems(questions.size());
        return page;
    }
}
