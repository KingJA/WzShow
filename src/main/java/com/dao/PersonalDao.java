package com.dao;

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

//    List<Question> selectQuestionsByAccountId(@Param(value = "accountId") int accountId, @Param(value = "currentPage") int currentPage, @Param(value = "pageSize") int pageSize);
    List<Question> selectQuestionsByAccountId(@Param(value = "accountId") long accountId);


}
