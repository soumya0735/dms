/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author CDAC-49
 */
public class advanced_search_bean {

    private String bookheadno;
    private String title;
    private String creator;
    private String keywords;
    private int fromPeriod;
    private int toPeriod;

    public advanced_search_bean() {
    }

    public String getBookheadno() {
        return bookheadno;
    }

    public void setBookheadno(String bookheadno) {
        this.bookheadno = bookheadno;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public int getFromPeriod() {
        return fromPeriod;
    }

    public void setFromPeriod(int fromPeriod) {
        this.fromPeriod = fromPeriod;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getToPeriod() {
        return toPeriod;
    }

    public void setToPeriod(int toPeriod) {
        this.toPeriod = toPeriod;
    }
}
