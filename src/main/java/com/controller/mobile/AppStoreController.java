package com.controller.mobile;

import com.bean.Account;
import com.bean.AppResult;
import com.bean.Gift;
import com.dao.AccountDao;
import com.dao.ShopDao;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/mobile/store")
public class AppStoreController {
    @Autowired
    private ShopDao shopDao;
    @Autowired
    private AccountDao accountDao;
    private static Logger logger = Logger.getLogger(AppStoreController.class);

    @ResponseBody
    @RequestMapping(value = "/getGifts", method = RequestMethod.POST)
    public AppResult getGifts(@RequestParam("token") String token) {
        if (checkTokenAvail(token) != -1) {
            List<Gift> gifts = shopDao.getGifts();
            return new AppResult(0, "Token error", gifts);
        }else{
            return new AppResult(4, "Token error", null);
        }
    }
    @ResponseBody
    @RequestMapping(value = "/buyGift", method = RequestMethod.POST)
    public AppResult getGifts(@RequestParam("token") String token,@RequestParam("giftId") long giftId,@RequestParam("count") int count,@RequestParam("cost") int cost) {
        long accountId = checkTokenAvail(token);
        if (accountId == -1) {
            return new AppResult(4, "Token error", null);
        }
        int coin = shopDao.selectCoin(accountId);
        if (coin >= count * cost) {//可以购买
            if (shopDao.selectGift(accountId, giftId) > 0) {
                shopDao.addMyGift(accountId, giftId, count);
            } else {
                shopDao.insertMyGift(accountId, giftId, count);
            }
            shopDao.reduceMyGift(accountId,count*cost);
            return new AppResult(0, "交易成功", null);
        } else {//金币不够
            return new AppResult(4, "抱歉，你的金币不够", null);
        }

    }

    @ResponseBody
    @RequestMapping(value = "/getMyGifts", method = RequestMethod.POST)
    public AppResult getMyGifts(@RequestParam("token") String token) {
        long accountId = checkTokenAvail(token);
        if (accountId != -1) {
            List<Gift> gifts = shopDao.getMyGifts(accountId);
            return new AppResult(0, "Token error", gifts);
        }else{
            return new AppResult(4, "Token error", null);
        }
    }


    public long checkTokenAvail(String token) {
        long accountId = -1;
        Account account = accountDao.selectIdByToken(token);
        if (account != null) {
            accountId = account.getAccountId();
        }
        return accountId;
    }
}
