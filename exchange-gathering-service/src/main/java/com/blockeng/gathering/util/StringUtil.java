package com.blockeng.gathering.util;

public class StringUtil {

    public static String RemoveLastThree(String str){
        str=str.substring(0,str.length()-3);
        return str;
    }
}
