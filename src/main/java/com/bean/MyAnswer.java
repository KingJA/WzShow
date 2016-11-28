package com.bean;

import com.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2016/11/28 16:32
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class MyAnswer {
    private long questionId;
    private int paiseCount;
    private String content;
    private Date createTime;
    private String title;

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public int getPaiseCount() {
        return paiseCount;
    }

    public void setPaiseCount(int paiseCount) {
        this.paiseCount = paiseCount;
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
    public String getCreateYearDay() {
        return DateUtil.getYearDay(createTime);
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
