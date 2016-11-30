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

    List<Gift> selectGiftByPage(@Param(value = "startRow") int startRow, @Param(value = "pageSize") int pageSize);
}
