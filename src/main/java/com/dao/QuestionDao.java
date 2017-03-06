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

    int insertQuestion(Question question);

    int selectQuestionCount();

    int selectPraiseCountByAnswerId(@Param(value = "answerId") long answerId);

    List<Question> selectQuestionsByPage(@Param(value = "currentPage") int currentPage, @Param(value = "pageSize") int pageSize);

    Question selectQuestionById(@Param(value = "questionId") long questionId);

    Account selectAccountByQuestionId(@Param(value = "questionId") long questionId);

    List<AnswerResult> selectAnsewersByQuestionId(@Param(value = "questionId") long questionId);

    void addPraise(@Param(value = "answerId") long answerId);

    void insertPraiseRecord(@Param(value = "accountId") long accountId, @Param(value = "answerId") long answerId);

    int selectPraiseRecord(@Param(value = "accountId") long accountId, @Param(value = "answerId") long answerId);

    /*添加收藏问题*/
    int addCollect(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId);

    /*取消收藏问题*/
    int cancelCollect(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId);

    /*判断你是否收藏的问题*/
    int selectIfCollect(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId);

    int answerQuestion(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "content") String content, @Param(value = "imgUrls") String imgUrls);
/*app=================================================*/

    List<Question> getQuestionsBySolved(@Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize, @Param(value = "solved") int solved);

    List<Question> getQuestions(@Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize);

}
