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
public interface AccountDao {
    int selectAccount(Account account);

    int selectAccountByName(@Param(value = "name") String name);

    Account selectAccountByMap(Map<String, Object> map);

    Account selectIdByToken(@Param(value = "token") String token);

    void insertAccount(Account account);
    void insertAvatar(@Param(value = "accountId") String accountId, @Param(value = "avatar")String avatar);

    void insertToken(@Param(value = "token") String token, @Param(value = "name") String name);

}
