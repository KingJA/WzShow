package com.util;

import com.bean.Account;
import com.bean.AppResult;
import com.dao.DaoAccount;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Description：TODO
 * Create Time：2016/11/16 15:57
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class TokenCheckUtil {
    @Autowired
    DaoAccount daoAccount;

    public  <T> AppResult<T> checkToken(String token) {
        Account account = daoAccount.selectIdByToken(token);
        if (account != null) {

        }else{

        }
        return null;
    }
}
