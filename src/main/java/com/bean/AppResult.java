package com.bean;

/**
 * Description：TODO
 * Create Time：2016/11/16 14:00
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class AppResult<T> {
    private int resultCode;
    private String resultText;
    private T date;

    public String getResultText() {
        return resultText;
    }

    public AppResult setResultText(String resultText) {
        this.resultText = resultText;
        return this;
    }

    public T getDate() {
        return date;
    }

    public AppResult setDate(T date) {
        this.date = date;
        return this;
    }

    public int getResultCode() {

        return resultCode;
    }

    public AppResult setResultCode(int resultCode) {
        this.resultCode = resultCode;
        return this;
    }
}
