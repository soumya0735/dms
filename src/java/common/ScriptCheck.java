/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.util.regex.Pattern;

/**
 *
 * @author CDAC-01
 */
public class ScriptCheck {
    public String error;
    private static Pattern[] patterns = new Pattern[]{
        // Script fragments
        Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE),
        // src='...'
        Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // lonely script tags
        Pattern.compile("</script>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // eval(...)
        Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // expression(...)
        Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // javascript:...
        Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE),
        // vbscript:...
        Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE),
        // onload(...)=...
        Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        Pattern.compile(
        "<img(\\s+.*?)(?:src\\s*=\\s*(?:'|\")(.*?)(?:'|\"))(.*?)/>",
        Pattern.DOTALL | Pattern.CASE_INSENSITIVE),
        Pattern.compile("<iframe>(.*?)</iframe>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("<iframe(.*?)>", Pattern.CASE_INSENSITIVE)
    };

    private int hasscript = 0;

    public boolean Check(String str) {
        
        for (Pattern scriptPattern : patterns) {
            if (scriptPattern.matcher(str).matches()) {
                hasscript++;
            }
        }
        if (hasscript > 0) {
            System.out.println("script:" + hasscript);
            return true;
        } else {
            return false;
        }
    }
    
    public boolean CheckNumber(String str){
        String pattern="\\d{0,9}";
        if(str.matches(pattern)){
            return true;
        }else{
            return false;
        }
        
    }
    
    public boolean CheckPhoneNumber(String str){
        String pattern="\\d{0,11}";
        if(str.matches(pattern)){
            return true;
        }else{
            return false;
        }
        
    }
    
    
    public boolean checkPassword(String password) {
        char c[] = password.toCharArray();
        boolean upper = false;
        boolean lower = false;
        boolean number = false;
        boolean special = false;
        String splChr = " ^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$";
        
        if (password.length() < 7) {
            error="Password should be minimum 7 characters with one or more Upper/Lower case letter,Number and Special Character";
            return false;
        }
        for (int count = 0; count < c.length; count++) {
            if (Character.isUpperCase(c[count])) {
                upper = true;
            } else if (Character.isLowerCase(c[count])) {
                lower = true;
            } else if (Character.isDigit(c[count])) {
                number = true;
            }

        }
        for (int count = 0; count < password.length(); count++) {
            System.out.println(count + " " + password.substring(count, count + 1));
            if (splChr.contains(password.substring(count, count + 1))) {
                System.out.println("Special Character Found");
                special = true;
            }
        }
        System.out.println(upper + " " + lower + " " + number + " " + special);
        if (upper == false || lower == false || number == false || special == false) {
            error="Password should be minimum 7 characters with one or more Upper/Lower case letter,Number and Special Character";
            return false;
        } else {
            return true;
        }
    }
}
