package com.util;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/21 16:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Page<T> {
    public static final int DEFAULT_PAGE_SIZE=5;
    private int pageSize = DEFAULT_PAGE_SIZE;
    private int totelPages;
    private int currentPage;
    private int totelItems;
    private List<T> datas;

    @Override
    public String toString() {
        return "Page{" +
                "pageSize=" + pageSize +
                ", totelPages=" + totelPages +
                ", currentPage=" + currentPage +
                ", totelItems=" + totelItems +
                ", datas=" + datas +
                '}';
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotelPages() {
        if (totelItems % pageSize != 0) {
            totelPages = totelItems / pageSize + 1;
        } else {
            totelPages = totelItems / pageSize;
        }
        return totelPages;
    }

    public void setTotelPages(int totelPages) {
        this.totelPages = totelPages;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotelItems() {
        return datas.size();
    }

    public void setTotelItems(int totelItems) {
        this.totelItems = totelItems;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }
}
