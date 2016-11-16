package com.bean;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:17
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Account {
    @Override
    public String toString() {
        return "Account{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    private long account_id;
    private String name;
    private String password;
    private String createTime;
    private String modifyTime;
    private String nickName;
    private String phone;
    private String token;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public long getAccount_id() {

        return account_id;
    }

    public void setAccount_id(long account_id) {
        this.account_id = account_id;
    }


    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
