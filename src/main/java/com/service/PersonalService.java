package com.service;

import com.bean.*;
import com.util.Page;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:28
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface PersonalService {

    Page<Question> getMyAskByPage(long accountId,int currentPage, int pageSize);
    Page<MyAnswer> getMyAnswerByPage(long accountId, int currentPage, int pageSize);
    Page<MyCollect> getMyCollectByPage(long accountId, int currentPage, int pageSize);
    Page<MyAttention> getMyAttentionByPage(long accountId, int currentPage, int pageSize);
    Page<MyGift> getMyGiftByPage(long accountId, int currentPage, int pageSize);

}
