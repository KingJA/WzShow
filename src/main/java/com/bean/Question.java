package com.bean;

/**
 * Description：TODO
 * Create Time：2016/11/21 13:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Question {
    private long queistionId;
    private String title;
    private String content;
    private String tagId;

    public long getQueistionId() {
        return queistionId;
    }

    public void setQueistionId(long queistionId) {
        this.queistionId = queistionId;
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
}
