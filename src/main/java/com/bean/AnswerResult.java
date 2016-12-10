package com.bean;

import com.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2016/11/22 17:52
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class AnswerResult {
    private long questionId;
    private long accountId;
    private long answerId;
    private String name;
    private String avatar;
    private String content;
    private Date createTime;
    private int praiseCount;
    private int collectCount;

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public long getAccountId() {
        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }

    public long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(long answerId) {
        this.answerId = answerId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateTime() {
        return DateUtil.getDateTime(createTime);
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getPraiseCount() {
        return praiseCount;
    }

    public void setPraiseCount(int praiseCount) {
        this.praiseCount = praiseCount;
    }

    public int getCollectCount() {
        return collectCount;
    }

    public void setCollectCount(int collectCount) {
        this.collectCount = collectCount;
    }


}
