package com.bean;

import com.util.DateUtil;

import java.util.Date;

/**
 * Description：新闻实体
 * Create Time：2016/11/8 15:04
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class News {

    private long newsId;
    /*新闻标题*/
    private String title;
    /*新闻图片地址*/
    private String imgUrl;
    /*新闻内容*/
    private String content;
    /*创建时间*/
    private Date createTime;
    /*修改时间*/
    private Date modifyTime;
    /*分类*/
    private String category;
    /*作者*/
    private String author;

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

    public String getCreateTime() {
        return DateUtil.getDateTime(createTime);
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getModifyTime() {
        return DateUtil.getDateTime(modifyTime);
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public long getNewsId() {
        return newsId;
    }

    public void setNewsId(long newsId) {
        this.newsId = newsId;
    }

    @Override
    public String toString() {
        return "News{" +
                "newsId=" + newsId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", category='" + category + '\'' +
                ", author='" + author + '\'' +
                '}';
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}
