package com.sunboard.ch4.domain;

public class PageHandler {
    private SearchCondition sc;
    //    private int pageSize = 10; // 한 페이지당 게시물 갯수
//    private int page; // 현재 페이지
//    private String  option;
//    private String  keyword;
    public  int naviSize = 10; // page navigation size
    private int totalCnt; // 게시물의 총 갯수
    private int totalPage; // 전체 페이지의 갯수
    private int beginPage; // 화면에 보여줄 첫 페이지
    private int endPage; // 화면에 보여줄 마지막 페이지
    private boolean showNext = false; // 이후를 보여줄지의 여부. endPage==totalPage이면, showNext는 false
    private boolean showPrev = false; // 이전을 보여줄지의 여부. beginPage==1이 아니면 showPrev는 false


    public SearchCondition getSc() {
        return sc;
    }

    public void setSc(SearchCondition sc) {
        this.sc = sc;
    }


    public PageHandler (int totalCnt, SearchCondition sc){
        this.totalCnt = totalCnt;
        this.sc = sc;

        doPaging(totalCnt,sc);
    }

    public void doPaging(int totalCnt, SearchCondition sc){

        this.totalPage = (int)Math.ceil(totalCnt / (double)sc.getPageSize());
        this.beginPage = (sc.getPage()-1) / naviSize * naviSize + 1;
        this.endPage = Math.min(beginPage + naviSize -1, totalPage);
        this.showPrev = beginPage != 1;
        this.showNext = endPage != totalPage;
    }


    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }


    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }



    void print(){
        System.out.println("page = " + sc.getPage());
        System.out.print(showPrev ? "[PREV]" : "");
        for(int i = beginPage; i <= endPage; i++){
            System.out.print(i + " ");
        }
        System.out.println(showNext ? "[NEXT]" : "");
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "sc=" + sc +
                ", totalCnt=" + totalCnt +
                ", showNext=" + showNext +
                ", beginPage=" + beginPage +
                ", NAV_SIZE=" + naviSize +
                ", totalPage=" + totalPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                '}';
    }
}
