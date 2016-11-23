package com.bean;

import com.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2016/11/21 13:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Question {
    private long questionId;
    private String title;
    private String content;
    private String imgUrls;
    private String tagId;
    private Date createTime;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getImgUrls() {
        return imgUrls;
    }

    public void setImgUrls(String imgUrls) {
        this.imgUrls = imgUrls;
    }

    public String getCreateTime() {
        return DateUtil.getDateTime(createTime);
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
