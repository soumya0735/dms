/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package wishlist;

import bean_wishlist.wish_list_bean;
import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CDAC-49
 */
public class AddToWishList extends ActionSupport implements SessionAware {

    Map<String, Object> session;
    private String bookId;

    public AddToWishList() {
    }

    public String add() {
        System.out.println("In AddToWishlist Java.");
        if (session.get("userName") == null) {
            return "showLogin";
        } else {
            try {
                wish_list_bean wishListParams = new wish_list_bean(Integer.parseInt(bookId), session.get("userName").toString());
                System.out.println("Hello");
                int chkNoOfBooksInTheWishList = Integer.parseInt(Ibatis.getSqlMap().queryForObject("wbsl.checkNoOfBooksInTheWishList", wishListParams).toString());
                if (chkNoOfBooksInTheWishList < 15) {
                    int chkIfExists = Integer.parseInt(Ibatis.getSqlMap().queryForObject("wbsl.checkIfExists", wishListParams).toString());
                    if (chkIfExists == 0) {
                        Ibatis.getSqlMap().insert("wbsl.addWishlist", new wish_list_bean(Integer.parseInt(bookId), session.get("userName").toString()));
                        addActionMessage("Successfully added to your wishlist.");
                    } else {
                        int checkDateDiff = Integer.parseInt(Ibatis.getSqlMap().queryForObject("wbsl.checkDateDiff", wishListParams).toString());
                        if (checkDateDiff < 14) {
                            addActionMessage("Selected book is already present in your wishlist!");
                        } else {
                            Ibatis.getSqlMap().insert("wbsl.addWishlist", new wish_list_bean(Integer.parseInt(bookId), session.get("userName").toString()));
                            addActionMessage("Successfully added to your wishlist.");
                        }
                    }
                } else {
                    addActionMessage("15 books already present in your wishlist! Please remove a book before adding a new book.");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                addActionMessage("Unable to add in the wishlist.");
            } finally {
                return "success";
            }
        }
    }

    public String delete() {
        try {
            wish_list_bean wishListParams = new wish_list_bean(Integer.parseInt(bookId), session.get("userName").toString());
            Ibatis.getSqlMap().delete("wbsl.deleteFromWishList",wishListParams);
            addActionMessage("Selected book has been removed from the wishlist.");
        } catch (Exception e) {
            addActionMessage("Unable to remove selected book from the wishlist.");
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
