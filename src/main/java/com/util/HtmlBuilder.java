package com.util;

/**
 * Description：TODO
 * Create Time：2016/11/28 11:24
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class HtmlBuilder {
    public static  String getPageHtml(Page page, String methodName) {
        StringBuilder sb = new StringBuilder();
        sb.append("<ul class='pagination pagination'>");
        if (page.isHasPrevious()) {
            sb.append("<li><a href='javascript:void(0);'  onclick='" + methodName + "(" + (page.getCurrentPage() - 1) + ")'>&laquo;上一页</a></li>");
        }
        for (int i = 1; i <= page.getTotelPages(); i++) {
            if (i == page.getCurrentPage()) {
                sb.append("<li class='active'><a href='javascript:void(0);'>" + i + "</a></li>");
            } else {
                sb.append("<li><a href='javascript:void(0);' onclick='" + methodName + "(" + i + ")'>" + i + "</a></li>");
            }
        }
        if (page.isHasNext()) {
            sb.append("<li><a href='javascript:void(0);'  onclick='" + methodName + "(" + (page.getCurrentPage() + 1) + ")'>下一页&raquo;</a></li>");
        }
        sb.append("</ul>");
        return sb.toString();
    }
}
