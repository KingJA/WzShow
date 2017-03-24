package com.service.imp;

import com.bean.Question;
import com.dao.QuestionDao;
import com.service.QuestionService;
import com.util.Page;
import com.util.UploadUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:30
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    private static Logger logger = Logger.getLogger(QuestionServiceImpl.class);
    @Autowired
    QuestionDao questionDao;

    public long saveQuestion(Question question, MultipartFile[] files, HttpServletRequest request) {
        String imgUrls = UploadUtil.uploadMultiImages(files, request);
        question.setImgUrls(imgUrls);
        questionDao.insertQuestion(question);
        return question.getQuestionId();
    }

    public Page<Question> getQuestionsByPage(int currentPage, int pageSize) {
        int questionCount = questionDao.selectQuestionCount();
        Page<Question> page = new Page<Question>();
        page.setTotelItems(questionCount);
        page.setCurrentPage(currentPage);
        page.setPageSize(pageSize);
        page.setVisiblePages(Page.DEFAULT_VISIBLE_PAGE_SIZE);
        List<Question> questions = questionDao.selectQuestionsByPage(page.getStartRow(), pageSize);
        logger.debug("List<AppQuestion>============="+questions.toString());
        page.setPageDatas(questions);
        return page;
    }

    public long publish(long accountId, String title, String content, long tagId, MultipartFile[] files, HttpSession session) {
        String imgUrls = UploadUtil.savePublishedPictures(files, session);
        long publish = questionDao.publish(accountId, title, content, tagId, imgUrls);
        return publish;
    }

    public long answer(long accountId, long questionId, String content, MultipartFile[] files, HttpSession session) {
        String imgUrls = UploadUtil.saveAnswerPictures(files, session);
        long answer = questionDao.answer(accountId, questionId, content, imgUrls);
        return answer;
    }


}
