package com.controller.mobile;

import com.bean.Account;
import com.bean.AppResult;
import com.bean.SingleValue;
import com.dao.AccountDao;
import com.service.AccountService;
import com.util.Constant;
import com.util.StringUtil;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:35
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
@Controller()
@RequestMapping(value = "/mobile/account")
public class AppAccountController {
    private static Logger logger = Logger.getLogger(AppAccountController.class);
    @Autowired
    AccountService accountService;
    @Autowired
    AccountDao accountDao;

    /**
     * 登录
     * @param httpServletRequest
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "doLogin.json", method = RequestMethod.POST)
    public AppResult doLogin(HttpServletRequest httpServletRequest) {
        String name = httpServletRequest.getParameter("name");
        String password = httpServletRequest.getParameter("password");
        Account account = accountService.login(name, password);
        AppResult<Account> accountAppResult = new AppResult<Account>();
        if (account != null) {
            String token = StringUtil.getUUID();
            account.setToken(token);
            accountDao.insertToken(token,name);
            accountAppResult.setResultCode(0).setResultText("登录成功").setResultData(account);
        }else{
            accountAppResult.setResultCode(4).setResultText("登录失败").setResultData(account);
        }
        return accountAppResult;
    }

    /**
     * 注册
     * @param account
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "doRegister.json", method = RequestMethod.POST)
    public AppResult doRegister(Account account) {
        int count = accountDao.selectAccountByName(account.getName());
        AppResult<Account> appResult = new AppResult();
        if (count > 0) {
            appResult.setResultCode(4).setResultText("用户名已经被注册").setResultData(new SingleValue());
        }else{
            accountDao.insertAccount(account);
            appResult.setResultCode(0).setResultText("注册成功").setResultData(account.getName());
        }
        return appResult;
    }

    /**
     * 设置头像
     * @param token
     * @param file
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "setAvatar.json", method = RequestMethod.POST)
    public AppResult doRegister(@RequestParam("token")String token,@RequestParam("avatar") MultipartFile file, HttpServletRequest request) {
        AppResult<SingleValue> appResult = new AppResult();
        long accountId = checkTokenAvail(token);
        if (accountId!=-1) {
            if (file!=null&&!file.isEmpty()) {
                String savePath = uploadImg(file, request, Constant.saveAvatarPath);
                appResult.setResultCode(0).setResultText("头像上传成功").setResultData(new SingleValue(savePath));
                accountDao.insertAvatar(accountId+"",savePath);
            }
        }else{
            appResult.setResultCode(4).setResultText("登录失效").setResultData(new SingleValue());
        }
        return appResult;
    }


    /**
     * 检验token
     * @param token
     * @return
     */

    public  long checkTokenAvail(String token) {
        long accountId=-1;
        Account account = accountDao.selectIdByToken(token);
        if (account != null) {
            accountId=account.getAccountId();
        }
        return accountId;
    }

    private String uploadImg( @RequestParam("newsTopImg") MultipartFile file, HttpServletRequest request,String savePath) {
        String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF"+savePath);
        String fileName = file.getOriginalFilename();
        File saveFile = new File(realPath, fileName);
        logger.debug(saveFile.getAbsolutePath());
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(), saveFile);
        } catch (IOException e) {
            logger.debug("IOException"+e.getMessage());
            e.printStackTrace();
        }
        return savePath+fileName;
    }
}
