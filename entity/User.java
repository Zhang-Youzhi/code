package org.mypro.entity;

public class User {

    //用户id信息
    private Integer id;


    //用户id数据获取方法
    public Integer getId() {
        return id;
    }

    //用户id数据设置方法
    public void setId(Integer id) {
        this.id = id;
    }

    //名字数据信息
    private String name;


    //名字数据获取方法
    public String getName() {
        return name;
    }

    //名字数据设置方法
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
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

    //性别数据信息
    private String sex;


    //性别数据获取方法
    public String getSex() {
        return sex;
    }

    //性别数据设置方法
    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    //年龄数据信息
    private String age;


    //年龄数据获取方法
    public String getAge() {
        return age;
    }

    //年龄数据设置方法
    public void setAge(String age) {
        this.age = age == null ? null : age.trim();
    }
}

