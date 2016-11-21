package com.util;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Description：TODO
 * Create Time：2016/11/21 15:34
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class UploadUtil {
    private static Logger logger = Logger.getLogger(UploadUtil.class);
    public  static String uploadMultiImages(MultipartFile[] files, HttpServletRequest request) {
        StringBuilder sb = new StringBuilder();
        if (files != null && files.length > 0) {
            for (MultipartFile singleFile : files) {
                logger.debug("图片名称"+singleFile.getOriginalFilename());
                uploadImg(singleFile, request);
                sb.append("/upload/"+singleFile.getOriginalFilename()+"#");
            }
        }

        return sb.toString();
    }
    private static void uploadImg(MultipartFile file, HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
        String fileName = file.getOriginalFilename();
        File saveFile = new File(realPath, fileName);
        logger.debug(saveFile.getAbsolutePath());
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(), saveFile);
        } catch (IOException e) {
            logger.debug("IOException"+e.getMessage());
            e.printStackTrace();
        }
    }
}
