package com.dao;

import com.appbean.AppAnswer;
import com.appbean.AppMyAnswer;
import com.appbean.AppQuestion;
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

    List<AppQuestion> getQuestionsBySolved(@Param(value = "accountId") long accountId, @Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize, @Param(value = "solved") int solved);

    List<AppQuestion> getHotQuestions(@Param(value = "accountId") long accountId, @Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize);

    List<AppQuestion> getQuestions(@Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize);

    List<AppQuestion> getMyQuestions(@Param(value = "accountId") long accountId, @Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize);

    List<AppMyAnswer> getMyAnswers(@Param(value = "accountId") long accountId, @Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize);

    List<AppMyAnswer> getOtherAnswers(@Param(value = "accountId") long accountId, @Param(value = "otherAccountId") long otherAccountId, @Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize);

    List<AppQuestion> getOtherQuestions(@Param(value = "accountId") long accountId, @Param(value = "otherAccountId") long otherAccountId, @Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize);

    List<AppAnswer> getAnswers(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "pageIndex") int pageIndex, @Param(value = "pageSize") int pageSize);

    long publish(@Param(value = "accountId") long accountId, @Param(value = "title") String title, @Param(value = "content") String content, @Param(value = "tagId") long tagId, @Param(value = "imgUrls") String imgUrls);

    long answer(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "content") String content, @Param(value = "imgUrls") String imgUrls);

    int collect(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId);

    int cancleCollect(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId);

    int attention(@Param(value = "accountId") long accountId, @Param(value = "otherAccountId") long otherAccountId);

    int cancleAttention(@Param(value = "accountId") long accountId, @Param(value = "otherAccountId") long otherAccountId);

    int praise(@Param(value = "accountId") long accountId, @Param(value = "answerId") long answerId);

    int setBestAnswer(@Param(value = "answerId") long answerId);

    int setQuestionSolved(@Param(value = "questionId") long questionId);

    AppQuestion getQuestionInfo(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId);

}
