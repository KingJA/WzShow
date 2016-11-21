package com.service.imp;

import com.bean.Question;
import com.dao.QuestionDao;
import com.service.QuestionService;
import com.util.Page;
import com.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:30
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    QuestionDao questionDao;

    public void saveQuestion(Question question, MultipartFile[] files, HttpServletRequest request) {
        String imgUrls = UploadUtil.uploadMultiImages(files, request);
        question.setImgUrls(imgUrls);
        questionDao.insertQuestion(question);
    }

    public Page<Question> getQuestionsByPage(int currentPage, int pageSize) {
        Page<Question> page = new Page<Question>();
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        List<Question> questions = questionDao.selectQuestionsByPage(page.getCurrentPage()-1, page.getPageSize());
        page.setDatas(questions);
        return page;
    }
}
