package com.util;

import com.sun.istack.internal.Nullable;

/**
 * Description：TODO
 * Create Time：2016/11/23 15:18
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class TextUtil {
    public static boolean isEmpty(@Nullable CharSequence str) {
        if (str == null || str.length() == 0)
            return true;
        else
            return false;
    }
}
