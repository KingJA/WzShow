package com.bean;

import com.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2016/12/9 13:33
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class MyFootprint {
    private long   pathId;
    private long   accountId;
    private int   operationCode;
    private long  questionId;
    private String  title;
    private long  accountBId;
    private String  name;
    private Date createTime;
    private int  experience;
    private int  coin;

    public long getPathId() {
        return pathId;
    }

    public void setPathId(long pathId) {
        this.pathId = pathId;
    }

    public long getAccountId() {
        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }

    public int getOperationCode() {
        return operationCode;
    }

    public void setOperationCode(int operationCode) {
        this.operationCode = operationCode;
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getAccountBId() {
        return accountBId;
    }

    public void setAccountBId(long accountBId) {
        this.accountBId = accountBId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreateTime() {
        return DateUtil.getTimeTip(createTime);
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }
}
