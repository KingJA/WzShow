package com.bean;

/**
 * Description：TODO
 * Create Time：2016/11/16 15:11
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class SingleValue {
    private String resultText = "";
    private long resultInt=-1;

    public SingleValue(long resultInt) {
        this.resultInt = resultInt;
    }

    public String getResultText() {
        return resultText;
    }

    public void setResultText(String resultText) {
        this.resultText = resultText;
    }

    public SingleValue(String resultText) {
        this.resultText = resultText;
    }

    public SingleValue() {

    }

    public SingleValue(long resultInt, String resultText) {
        this.resultText = resultText;
        this.resultInt = resultInt;
    }

    public long getResultInt() {
        return resultInt;
    }

    public void setResultInt(long resultInt) {
        this.resultInt = resultInt;
    }
}
