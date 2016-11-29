package com.service;

import com.bean.MyAnswer;
import com.bean.MyCollect;
import com.bean.Question;
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

}
