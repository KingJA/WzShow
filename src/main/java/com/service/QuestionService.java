package com.service;

import com.bean.Question;
import com.util.Page;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:28
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface QuestionService {
    long saveQuestion(Question question, MultipartFile[] files, HttpServletRequest request);

    Page<Question> getQuestionsByPage(int currentPage, int pageSize);

}
