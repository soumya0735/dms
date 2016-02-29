/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Manas Chakraborty
 */
public class ListValue {
    private String listId;
    private String ListString;

    public ListValue() {
    }

    public ListValue(String listId, String ListString) {
        this.listId = listId;
        this.ListString = ListString;
    }

    public String getListId() {
        return listId;
    }

    public void setListId(String listId) {
        this.listId = listId;
    }

    public String getListString() {
        return ListString;
    }

    public void setListString(String ListString) {
        this.ListString = ListString;
    }
    
}
