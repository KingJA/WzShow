package com.service;

import com.bean.Gift;
import com.util.Page;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:28
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface ShopService {

    Page<Gift> getGiftByPage(int currentPage, int pageSize);

}
