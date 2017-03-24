package com.appbean;

import com.util.DateUtil;

import java.util.Date;

/**
 * Description：TODO
 * Create Time：2017/3/21 14:00
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class AppMyAnswer extends AppQuestion {
    private int praiseCount;
    private String answerContent;
    private String answerImgUrls;
    private Date answerTime;

    public int getPraiseCount() {
        return praiseCount;
    }

    public void setPraiseCount(int praiseCount) {
        this.praiseCount = praiseCount;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public String getAnswerImgUrls() {
        return answerImgUrls;
    }

    public void setAnswerImgUrls(String answerImgUrls) {
        this.answerImgUrls = answerImgUrls;
    }

    public String getAnswerTime() {
        return DateUtil.getTimeTip(answerTime);
    }

    public void setAnswerTime(Date answerTime) {
        this.answerTime = answerTime;
    }
}
