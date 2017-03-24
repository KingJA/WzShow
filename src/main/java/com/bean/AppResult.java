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
    private T resultData;

    public AppResult() {

    }  public AppResult(int resultCode, String resultText, T resultData) {
        this.resultCode = resultCode;
        this.resultText = resultText;
        this.resultData = resultData;
    }

    public String getResultText() {
        return resultText;
    }

    public AppResult setResultText(String resultText) {
        this.resultText = resultText;
        return this;
    }

    public T getResultData() {
        return resultData;
    }

    public AppResult setResultData(T resultData) {
        this.resultData = resultData;
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
