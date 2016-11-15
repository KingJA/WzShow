package com.dao;

import com.bean.Account;
import org.springframework.stereotype.Repository;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Repository
public interface DaoAccount {
    int selectAccount(Account account);

    void insertAccount(Account account);

}
