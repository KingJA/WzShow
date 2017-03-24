package com.util;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    public static String uploadMultiImages(MultipartFile[] files, HttpServletRequest request) {
        StringBuilder sb = new StringBuilder();
        if (files != null && files.length > 0) {
            for (MultipartFile singleFile : files) {
                logger.debug("图片名称" + singleFile.getOriginalFilename());
                uploadImg(singleFile, request);
                sb.append("/upload/" + singleFile.getOriginalFilename() + "#");
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
            logger.debug("IOException" + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 保存发表的文章的图片
     * @param files
     * @param session
     * @return
     */
    public static String savePublishedPictures(MultipartFile[] files, HttpSession session) {
        return saveFiles(files, session, Constants.PUBLISHED_PICTURES_SAVED_PATH);
    }

    /**
     * 保存回答的图片
     * @param files
     * @param session
     * @return
     */
    public static String saveAnswerPictures(MultipartFile[] files, HttpSession session) {
        return saveFiles(files, session, Constants.ANSWER_PICTURES_SAVED_PATH);
    }

    public static String saveAvatarPictures(MultipartFile[] files, HttpSession session) {
        return saveFiles(files, session, Constants.AVATAR_SAVED_PATH);
    }

    private static String saveFiles(MultipartFile[] files, HttpSession session, String savePath) {
        StringBuilder sb = new StringBuilder();
        if (files != null && files.length > 0) {
            for (MultipartFile singleFile : files) {
                String saveDir = session.getServletContext().getRealPath(Constants.WEB_INF + savePath);
                String suffix = singleFile.getOriginalFilename().substring(singleFile.getOriginalFilename().lastIndexOf("."));
                String saveName = IDUtil.getUUID() + suffix;
                File saveFile = new File(saveDir, saveName);
                try {
                    FileUtils.copyInputStreamToFile(singleFile.getInputStream(), saveFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                sb.append(savePath + saveName + Constants.DECOLLATOR);
            }
        }
        return sb.toString();
    }
}
