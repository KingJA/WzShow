package com.service;

import com.bean.Question;
import com.util.Page;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:28
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface QuestionService {
    long saveQuestion(Question question, MultipartFile[] files, HttpServletRequest request);

    Page<Question> getQuestionsByPage(int currentPage, int pageSize);

    long publish(long accountId,  String title,  String content,long tagId,MultipartFile[] files, HttpSession session);
    long answer(long accountId,  long questionId,  String content,MultipartFile[] files, HttpSession session);

}
