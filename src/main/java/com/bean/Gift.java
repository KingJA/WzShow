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

    public String getGiftDes() {
        return giftDes;
    }

    public void setGiftDes(String giftDes) {
        this.giftDes = giftDes;
    }

    private String giftDes;
    private int giftCost;
    private int giftRank;
    private int giftCount;
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

    public int getGiftCount() {
        return giftCount;
    }

    public void setGiftCount(int giftCount) {
        this.giftCount = giftCount;
    }
}
