package com.dao;

import com.bean.MyAnswer;
import com.bean.MyCollect;
import com.bean.Question;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/21 14:56
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Repository
public interface PersonalDao {

    List<Question> selectQuestionsByAccountId(@Param(value = "accountId") long accountId);

    int selectMyAskCountAccountId(@Param(value = "accountId") long accountId);

    List<Question> selectMyAskByAccountId(@Param(value = "accountId") long accountId, @Param(value = "startRow") int startRow, @Param(value = "pageSize") int pageSize);

    int selectMyAnswerCountAccountId(@Param(value = "accountId") long accountId);
    int selectMyCollectCountAccountId(@Param(value = "accountId") long accountId);

    List<MyAnswer> selectMyAnswerByAccountId(@Param(value = "accountId") long accountId, @Param(value = "startRow") int startRow, @Param(value = "pageSize") int pageSize);
    List<MyCollect> selectMyCollectByAccountId(@Param(value = "accountId") long accountId, @Param(value = "startRow") int startRow, @Param(value = "pageSize") int pageSize);


}
