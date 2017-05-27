package com.appbean;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2017/3/30 16:15
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class AppQuestionDetail {
    public AppQuestionDetail(AppQuestion question, List<AppAnswer> answers) {
        this.question = question;
        this.answers = answers;
    }

    private AppQuestion question;
    private List<AppAnswer> answers;

    public AppQuestion getQuestion() {
        return question;
    }

    public void setQuestion(AppQuestion question) {
        this.question = question;
    }

    public List<AppAnswer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<AppAnswer> answers) {
        this.answers = answers;
    }
}
