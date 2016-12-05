package com.bean;

/**
 * Description：TODO
 * Create Time：2016/12/5 13:36
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class RankInfo {
    private int rank;
    private int upExperience;
    private String title;
    private int currentExperience;


    public RankInfo(int currentExperience) {
        this.currentExperience = currentExperience;
        if (currentExperience >= 0 && currentExperience < 20) {
            rank = 1;
            upExperience = 20;
            title = "初出茅庐1";
        } else if (currentExperience >= 20 && currentExperience < 124) {
            rank = 2;
            upExperience = 124;
            title = "初出茅庐2";
        } else if (currentExperience >= 124 && currentExperience < 420) {
            rank = 3;
            upExperience = 420;
            title = "初出茅庐3";
        } else if (currentExperience >= 420 && currentExperience < 1052) {
            rank = 4;
            upExperience = 1052;
            title = "初出茅庐4";
        } else if (currentExperience >= 1052 && currentExperience < 2212) {
            rank = 5;
            upExperience = 2212;
            title = "初出茅庐5";
        } else if (currentExperience >= 2212 && currentExperience < 4140) {
            rank = 6;
            upExperience = 4140;
            title = "初出茅庐6";
        } else if (currentExperience >= 4140 && currentExperience < 7124) {
            rank = 7;
            upExperience = 7124;
            title = "初出茅庐7";
        } else if (currentExperience >= 7124 && currentExperience < 11500) {
            rank = 8;
            upExperience = 11500;
            title = "初出茅庐8";
        } else if (currentExperience >= 11500 && currentExperience < 17652) {
            rank = 9;
            upExperience = 17652;
            title = "初出茅庐9";
        } else if (currentExperience >= 17652 && currentExperience < 26012) {
            rank = 10;
            upExperience = 26012;
            title = "初出茅庐10";
        }
    }

    public int getRank() {
        return rank;
    }


    public int getUpExperience() {
        return upExperience;
    }


    public String getTitle() {
        return title;
    }

}
