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
public interface SearchDao {

    List<Question> searchQuestion(@Param(value = "keyword") String keyword, @Param(value = "startRow") int startRow, @Param(value = "pageSize") int pageSize);

}
