package com.service.imp;

import com.bean.Gift;
import com.bean.SingleValue;
import com.dao.ShopDao;
import com.service.ShopService;
import com.util.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    private static Logger logger = Logger.getLogger(ShopServiceImpl.class);

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

    @Transactional
    public SingleValue buyGift(long accountId, long giftId, int giftCount, int giftCost) {
        //检查金币是否够
        //根据accountId 查找gitfId是否存在
        //不存在则插入
        //存在则修改数量
        //减掉对应金币数
        int coin = shopDao.selectCoin(accountId);
        if (coin >= giftCount * giftCost) {//可以购买
            if (shopDao.selectGift(accountId, giftId) > 0) {
                shopDao.addMyGift(accountId, giftId, giftCount);
            } else {
                shopDao.insertMyGift(accountId, giftId, giftCount);
            }
            shopDao.reduceMyGift(accountId,giftCount*giftCost);
            int leftCoin=coin-giftCount*giftCost;
            return new SingleValue(leftCoin,"交易成功");
        } else {//金币不够
            return new SingleValue("金币不够");
        }
    }
}
