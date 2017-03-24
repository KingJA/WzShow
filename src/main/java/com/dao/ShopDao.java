package com.dao;

import com.bean.Gift;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/21 14:56
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Repository
public interface ShopDao {

    List<Gift> selectGiftById();

    int selectGiftCount();

    int selectGift(@Param(value = "accountId") long accountId, @Param(value = "giftId") long giftId);

    int insertMyGift(@Param(value = "accountId") long accountId, @Param(value = "giftId") long giftId, @Param(value = "giftCount") int giftCount);

    int addMyGift(@Param(value = "accountId") long accountId, @Param(value = "giftId") long giftId, @Param(value = "giftCount") int giftCount);
    int reduceMyGift(@Param(value = "accountId") long accountId,  @Param(value = "giftTotleCost") int giftTotleCost);

    int selectCoin(@Param(value = "accountId") long accountId);

    List<Gift> selectGiftByPage(@Param(value = "startRow") int startRow, @Param(value = "pageSize") int pageSize);
    List<Gift> getGifts();
    List<Gift> getMyGifts(@Param(value = "accountId") long accountId);

}
