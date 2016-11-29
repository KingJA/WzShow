package com.bean;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2016/11/29 16:27
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class MyAttention {
    private long attentionId;
    private long otherAccountId;
    private String name;
    private String avatar;
    private Date createTime;

    public long getAttentionId() {
        return attentionId;
    }

    public void setAttentionId(long attentionId) {
        this.attentionId = attentionId;
    }

    public long getOtherAccountId() {
        return otherAccountId;
    }

    public void setOtherAccountId(long otherAccountId) {
        this.otherAccountId = otherAccountId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
