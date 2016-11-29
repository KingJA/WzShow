package com.bean;

import com.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2016/11/29 15:19
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class MyCollect {
    private long collectId;
    private long questionId;
    private String title;
    private int collectCount;
    private int answerCount;
    private Date createTime;

    public long getCollectId() {
        return collectId;
    }

    public void setCollectId(long collectId) {
        this.collectId = collectId;
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

    public int getCollectCount() {
        return collectCount;
    }

    public void setCollectCount(int collectCount) {
        this.collectCount = collectCount;
    }

    public int getAnswerCount() {
        return answerCount;
    }

    public void setAnswerCount(int answerCount) {
        this.answerCount = answerCount;
    }

    public String getCreateTime() {
        return DateUtil.getDateTime(createTime);
    }
    public String getCreateYearDay() {
        return DateUtil.getYearDay(createTime);
    }

    public void setCreateTIME(Date createTime) {
        this.createTime = createTime;
    }
}
