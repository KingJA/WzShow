package com.service;

/**
 * Description：TODO
 * Create Time：2016/12/5 14:01
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface OperationService {
    /*发布问题*/
    void doPublish(long accountId,long questionId,String title);
    /*回答问题*/
    void doAnswer(long accountId,long questionId,String title);
    /*点赞*/
    void doPraise(long accountId,long questionId,String title,long accountBId,String name);
    /*采纳问题*/
    void doAccepteAnswer(long accountId,long questionId,String title,long accountBId,String name);
    /*问题被收藏*/
    void beQuestionCollected(long accountId,long questionId,String title,long accountBId,String name);
    /*被关注*/
    void beAttentioned(long accountId,long accountBId,String name);
    /*发起悬赏*/
    void doReward(long accountId,long questionId,String title,long accountBId,String name);
    /*注册*/
    void doRegister(long accountId);

}
