package com.service.imp;

import com.bean.Gift;
import com.controller.web.NewsController;
import com.dao.ShopDao;
import com.service.ShopService;
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
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopDao shopDao;
    private static Logger logger = Logger.getLogger(NewsController.class);

    public Page<Gift> getGiftByPage(int currentPage, int pageSize) {
        int giftCount = shopDao.selectGiftCount();
        Page<Gift> page = new Page<Gift>();
        page.setTotelItems(giftCount);
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<Gift> collects = shopDao.selectGiftByPage(page.getStartRow(), pageSize);
        page.setPageDatas(collects);
        return page;
    }
}
