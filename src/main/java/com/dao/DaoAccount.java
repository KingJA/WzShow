package com.dao;

import com.bean.Account;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Repository
public interface DaoAccount {
    int selectAccount(Account account);
    Account selectAccountByMap(Map<String,Object> map);

    void insertAccount(Account account);
    void insertToken(@Param(value = "token")String token, @Param(value = "name")String name);

}
