package com.bean;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2016/12/8 10:11
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class MyGift {
    private long accountId;
    private long giftId;
    private int giftCount;
    private int giftCost;
    private String giftName;
    private String giftUrl;
    private int giftRank;
    private Date createTime;

    public long getAccountId() {
        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }

    public long getGiftId() {
        return giftId;
    }

    public void setGiftId(long giftId) {
        this.giftId = giftId;
    }

    public int getGiftCount() {
        return giftCount;
    }

    public void setGiftCount(int giftCount) {
        this.giftCount = giftCount;
    }

    public int getGiftCost() {
        return giftCost;
    }

    public void setGiftCost(int giftCost) {
        this.giftCost = giftCost;
    }

    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    public String getGiftUrl() {
        return giftUrl;
    }

    public void setGiftUrl(String giftUrl) {
        this.giftUrl = giftUrl;
    }

    public int getGiftRank() {
        return giftRank;
    }

    public void setGiftRank(int giftRank) {
        this.giftRank = giftRank;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
