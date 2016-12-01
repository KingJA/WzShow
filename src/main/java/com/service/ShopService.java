package com.service;

import com.bean.Gift;
import com.bean.SingleValue;
import com.util.Page;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:28
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface ShopService {

    Page<Gift> getGiftByPage(int currentPage, int pageSize);

    SingleValue buyGift(long accountId, long giftId, int giftCount, int giftCost);

}
