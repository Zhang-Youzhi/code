package org.mypro.entity;

public class Lianxi {

    //联系人id信息
    private Integer id;


    //联系人id数据获取方法
    public Integer getId() {
        return id;
    }

    //联系人id数据设置方法
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

    //信息数据信息
    private String xinxi;


    //信息数据获取方法
    public String getXinxi() {
        return xinxi;
    }

    //信息数据设置方法
    public void setXinxi(String xinxi) {
        this.xinxi = xinxi == null ? null : xinxi.trim();
    }

    //重要数据信息
    private String zhongyao;


    //重要数据获取方法
    public String getZhongyao() {
        return zhongyao;
    }

    //重要数据设置方法
    public void setZhongyao(String zhongyao) {
        this.zhongyao = zhongyao == null ? null : zhongyao.trim();
    }

    //用户数据信息
    private String user;


    //用户数据获取方法
    public String getUser() {
        return user;
    }

    //用户数据设置方法
    public void setUser(String user) {
        this.user = user == null ? null : user.trim();
    }

    //用户id信息
    private Integer userid;


    //用户id数据获取方法
    public Integer getUserid() {
        return userid;
    }

    //用户id数据设置方法
    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}

