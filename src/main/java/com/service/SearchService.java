package com.service;

import com.bean.*;
import com.util.Page;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:28
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public interface SearchService {

    Page<Question> getSelectedQuestionsByPage(String keyword, int currentPage, int pageSize);

}
