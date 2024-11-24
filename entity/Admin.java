package org.mypro.entity;

public class Admin {

    //管理员id信息
    private Integer id;


    //管理员id数据获取方法
    public Integer getId() {
        return id;
    }

    //管理员id数据设置方法
    public void setId(Integer id) {
        this.id = id;
    }

    //账号数据信息
    private String username;


    //账号数据获取方法
    public String getUsername() {
        return username;
    }

    //账号数据设置方法
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    //密码数据信息
    private String password;


    //密码数据获取方法
    public String getPassword() {
        return password;
    }

    //密码数据设置方法
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}

