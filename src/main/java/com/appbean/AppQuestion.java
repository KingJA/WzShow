package com.appbean;

import com.bean.RankInfo;
import com.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2017/3/6 17:10
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class AppQuestion {

    private long questionId;
    private long accountId;
    private String name;
    private String avatar;
    private String title;
    private String content;
    private String imgUrls;
    private int solved;
    private int isCollected;
    private int isAttentioned;
    private int experience;
    private int answerCount;
    private int collectCount;
    private long tagId;
    private Date createTime;
    public int getIsCollected() {
        return isCollected;
    }
    public long getAccountId() {
        return accountId;
    }
    public int getIsAttentioned() {
        return isAttentioned;
    }

    public void setIsAttentioned(int isAttentioned) {
        this.isAttentioned = isAttentioned;
    }
    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }
    public void setIsCollected(int isCollected) {
        this.isCollected = isCollected;
    }
    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public RankInfo getRankInfo() {
        return new RankInfo(experience);
    }

    public String getName() {
        return name;
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
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

    public String getImgUrls() {
        return imgUrls;
    }

    public void setImgUrls(String imgUrls) {
        this.imgUrls = imgUrls;
    }

    public int getSolved() {
        return solved;
    }

    public void setSolved(int solved) {
        this.solved = solved;
    }

    public int getAnswerCount() {
        return answerCount;
    }

    public void setAnswerCount(int answerCount) {
        this.answerCount = answerCount;
    }

    public int getCollectCount() {
        return collectCount;
    }

    public void setCollectCount(int collectCount) {
        this.collectCount = collectCount;
    }

    public long getTagId() {
        return tagId;
    }

    public void setTagId(long tagId) {
        this.tagId = tagId;
    }

    public String getCreateTime() {
          return DateUtil.getTimeTip(createTime);
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
