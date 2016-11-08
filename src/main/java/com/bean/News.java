package com.bean;

/**
 * Description：新闻实体
 * Create Time：2016/11/8 15:04
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class News {

    private long newId;
    /*新闻标题*/
    private String title;
    /*新闻内容*/
    private String content;
    /*创建时间*/
    private String createTime;
    /*修改时间*/
    private String modifyTime;
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
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
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

    public long getNewId() {
        return newId;
    }

    public void setNewId(long newId) {
        this.newId = newId;
    }

    @Override
    public String toString() {
        return "News{" +
                "newId=" + newId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", category='" + category + '\'' +
                ", author='" + author + '\'' +
                '}';
    }
}
