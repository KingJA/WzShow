package com.bean;

/**
 * Description：TODO
 * Create Time：2016/11/15 15:17
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Account {


    private long accountId;
    private String name;
//    private String password;
//    private Date createTime;
//    private Date modifyTime;
    private String nickName;
    private String phone;
    private String token;
    private String avatar;
    private int coin;
    private int experience;

    public RankInfo getRankInfo() {
        return new RankInfo(experience);
    }


    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }


    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public String getCreateTime() {
//        return DateUtil.getDateTime(createTime);
//    }
//
//    public void setCreateTime(Date createTime) {
//        this.createTime = createTime;
//    }
//
//    public String getModifyTime() {
//        return DateUtil.getDateTime(modifyTime);
//    }
//
//    public void setModifyTime(Date modifyTime) {
//        this.modifyTime = modifyTime;
//    }

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

    public long getAccountId() {

        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }


    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }
}
