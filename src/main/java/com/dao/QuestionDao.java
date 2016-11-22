package com.dao;

import com.bean.Account;
import com.bean.AnswerResult;
import com.bean.Question;
import com.bean.Tag;
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
public interface QuestionDao {
    List<Tag> selectAllTag();

    void insertQuestion(Question question);

    int selectQuestionCount();

    List<Question> selectQuestionsByPage(@Param(value = "currentPage") int currentPage, @Param(value = "pageSize") int pageSize);

    Question selectQuestionById(@Param(value = "questionId") int questionId);

    Account selectAccountByQuestionId(@Param(value = "questionId") int questionId);

    AnswerResult selectAnsewerByQuestionId(@Param(value = "questionId") int questionId);
}
