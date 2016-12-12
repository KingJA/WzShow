package com.websocket.entity;


import com.websocket.util.DateUtil;
import com.websocket.util.FormatUtil;

import java.io.Serializable;

/**
 * Created by 一线生 on 2015/11/22.
 * 说明：消息实体类
 */
public class Text implements Serializable {
    private String userName;
    private String message;
    private String emitTime = DateUtil.now();
    private String color = "#2E2E2E";
    private String bubbleColor = "#CECECE";
    private String fontSize = "12";
    private String fontType = "黑体";

    public Text() {
    }

    public Text(String userName, String message) {
        this.userName = userName;
        this.message = message;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = FormatUtil.formatScript(userName);
    }

    public String getMessage() {
        return FormatUtil.formatScript(message);
    }

    public void setMessage(String message) {
        this.message = FormatUtil.formatScript(message);
    }

    public String getEmitTime() {
        return emitTime;
    }

    public void setEmitTime(String emitTime) {
        this.emitTime = emitTime;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBubbleColor() {
        return bubbleColor;
    }

    public void setBubbleColor(String bubbleColor) {
        this.bubbleColor = bubbleColor;
    }

    public String getFontSize() {
        return fontSize;
    }

    public void setFontSize(String fontSize) {
        this.fontSize = fontSize;
    }

    public String getFontType() {
        return fontType;
    }

    public void setFontType(String fontType) {
        this.fontType = fontType;
    }

}
