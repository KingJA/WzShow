package com.service;

import com.bean.Account;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:20
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface AccountService {
    Account login(String name, String password);

    void register(Account account);
}
