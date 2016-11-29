package com.util;

/**
 * Description：TODO
 * Create Time：2016/11/28 11:24
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class HtmlBuilder {
    public static  String getPageHtml(Page page, String methodName,int visiblePages) {
        StringBuilder sb = new StringBuilder();
        int rightPages=(visiblePages-1)/2;
        int leftPages=visiblePages-rightPages-1;
//        int totelPages=page.getTotelPages()<visiblePages?page.getTotelPages():
        sb.append("<ul class='pagination pagination'>");
        if (page.isHasPrevious()) {
            sb.append("<li><a href='javascript:void(0);'  onclick='" + methodName + "(" + (page.getCurrentPage() - 1) + ")'>&laquo;上一页</a></li>");
        }
//        for (int i = page.getCurrentPage()>visiblePages?(page.getCurrentPage()-leftPages):1; i <= (page.getCurrentPage()>visiblePages?(page.getCurrentPage()+rightPages):(page.getTotelPages()>=visiblePages?visiblePages:page.getTotelPages())); i++) {
        for (int i = page.getPageStart(); i <= page.getPageEnd(); i++) {
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
