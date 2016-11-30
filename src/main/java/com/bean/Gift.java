package com.bean;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2016/11/30 10:56
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Gift {
    private long giftId;
    private String giftName;
    private int giftCost;
    private int giftRank;
    private String giftUrl;
    private Date createTime;

    public long getGiftId() {
        return giftId;
    }

    public void setGiftId(long giftId) {
        this.giftId = giftId;
    }

    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    public int getGiftCost() {
        return giftCost;
    }

    public void setGiftCost(int giftCost) {
        this.giftCost = giftCost;
    }

    public int getGiftRank() {
        return giftRank;
    }

    public void setGiftRank(int giftRank) {
        this.giftRank = giftRank;
    }

    public String getGiftUrl() {
        return giftUrl;
    }

    public void setGiftUrl(String giftUrl) {
        this.giftUrl = giftUrl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
