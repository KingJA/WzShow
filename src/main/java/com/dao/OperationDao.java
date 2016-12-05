package com.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Description：TODO
 * Create Time：2016/12/5 13:56
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Repository
public interface OperationDao {
    int addIncome(@Param(value = "accountId") long accountId, @Param(value = "experience") int experience, @Param(value = "coin") int coin);

    int recordDoPublish(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "title") String title,
                        @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordDoAnswer(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "title") String title,
                       @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordDoPraise(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "title") String title,
                       @Param(value = "accountBId") long accountBId, @Param(value = "name") String name,
                       @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordBePraised(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "title") String title,
                        @Param(value = "accountBId") long accountBId, @Param(value = "name") String name,
                        @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordDoAccepteAnswer(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "title") String title,
                              @Param(value = "accountBId") long accountBId, @Param(value = "name") String name,
                              @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordBeAccepteAnswer(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "title") String title,
                              @Param(value = "accountBId") long accountBId, @Param(value = "name") String name,
                              @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordBeQuestionCollected(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "title") String title,
                                  @Param(value = "accountBId") long accountBId, @Param(value = "name") String name,
                                  @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordBeAttentioned(@Param(value = "accountId") long accountId, @Param(value = "accountBId") long accountBId, @Param(value = "name") String name,
                            @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordDoReward(@Param(value = "accountId") long accountId, @Param(value = "questionId") long questionId, @Param(value = "title") String title,
                       @Param(value = "accountBId") long accountBId, @Param(value = "name") String name,
                       @Param(value = "experience") int experience, @Param(value = "coin") int coin);
    int recordDoRegister(@Param(value = "accountId") long accountId, @Param(value = "experience") int experience, @Param(value = "coin") int coin);


}
