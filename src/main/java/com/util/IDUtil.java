package com.util;

import java.util.UUID;

/**
 * Description：TODO
 * Create Time：2017/3/15 9:55
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class IDUtil {
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
