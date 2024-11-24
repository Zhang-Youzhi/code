package org.mypro.front;

import java.io.File;

import java.io.FileInputStream;

import java.io.FileOutputStream;

import java.io.IOException;

import java.math.BigDecimal;

import java.text.SimpleDateFormat;

import java.util.ArrayList;

import java.util.HashMap;

import java.util.Map;

import com.alibaba.fastjson.JSON;

import org.springframework.web.bind.annotation.*;

import java.util.Calendar;

import java.util.Collections;

import java.util.Date;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;

import org.apache.commons.logging.LogFactory;

import org.mypro.service.LianxiServiceImp;

import org.mypro.entity.Lianxi;

import org.mypro.entity.LianxiExample;

import org.mypro.entity.*;
import org.mypro.dao.*;
import org.mypro.entity.User;

import org.mypro.entity.UserExample;

import org.mypro.dao.UserMapper;

import org.mypro.entity.User;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.multipart.MultipartFile;

@Controller

@RequestMapping(value = "/")

public class LianxiController {


    private static final Log logger = LogFactory.getLog(LianxiController.class);

    @Autowired
    private LianxiServiceImp lianxiservice;


    //定义方法addlianxi,响应页面addlianxi请求

    @RequestMapping(value = "addlianxi")

    public String addlianxi(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        //输出日志，当前执行方法为addlianxi

        logger.debug("LianxiController.addlianxi ......");

        lianxiservice.addlianxi(request, session);

        return "addlianxi";

    }


    //定义useraddlianxi方法

    @RequestMapping(value = "useraddlianxi")

    public String useraddlianxi(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        //输出日志，表示当前正在执行LianxiController.useraddlianxi方法

        logger.debug("LianxiController.useraddlianxi ......");

        lianxiservice.useraddlianxi(request, session);


        //返回添加联系人页面

        return "useraddlianxi";

    }


    // 定义userupdatelianxi方法

    @RequestMapping(value = "userupdatelianxi")

    public String userupdatelianxi(HttpServletRequest request, HttpServletResponse response, HttpSession session, int id) {

        // 输出日志LianxiController.userupdatelianxi

        logger.debug("LianxiController.userupdatelianxi ......");

        lianxiservice.userupdatelianxi(request, session, id);


        // 返回user修改联系人页面

        return "userupdatelianxi";

    }


    //定义userlianximanage方法

    @RequestMapping(value = "userlianximanage")

    public String userlianximanage(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

        //输出日志 ，表示当前正在执行方法为LianxiController.userlianximanage

        logger.debug("LianxiController.userlianximanage ......");

        lianxiservice.userlianximanage(request, session); // 返回user联系人管理页面


        return "userlianximanage";

    }


    //定义useraddlianxiact，响应页面添加联系人请求

    @RequestMapping(value = "useraddlianxiact")

    public String useraddlianxiact(HttpServletRequest request, HttpSession session, HttpServletResponse response, Lianxi lianxi) throws IOException {

        //输出日志，表示当前正在执行方法为LianxiController.useraddlianxiact

        logger.debug("LianxiController.useraddlianxiact ......");

        lianxiservice.useraddlianxiact(request, session, lianxi); //返回到user添加联系人方法

        return "forward:/userlianximanage.action";

    }


    //定义addlianxiact方法,将联系人信息插入到数据库的t_lianxi表中

    @RequestMapping(value = "addlianxiact")

    public String addlianxiact(HttpServletRequest request, HttpSession session, HttpServletResponse response, Lianxi lianxi) throws IOException {

        //输出当前方法日志，表示正在执行LianxiController.addlianxiact方法

        logger.debug("LianxiController.addlianxiact ......");

        lianxiservice.addlianxiact(request, session, lianxi); //返回联系人管理方法，执行联系人信息的查询

        return "forward:/lianximanage.action";

    }


    //定义lianximanage方法响应页面请求

    @RequestMapping(value = "lianximanage")

    public String lianximanage(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

        //输出日志，表示当前正在执行LianxiController.lianximanage

        logger.debug("LianxiController.lianximanage ......");


        lianxiservice.lianximanage(request, session); //返回到联系人管理页面

        return "lianximanage";

    }


    // 定义 lianxiview方法

    @RequestMapping(value = "lianxiview")

    public String lianxiview(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

        // 输出日志，表示当前正在执行LianxiController.lianxiview方法

        logger.debug("LianxiController.lianxiview ......");


        lianxiservice.lianxiview(request, session);

        // 返回联系人查看页面

        return "lianxiview";

    }


    // 定义 updatelianxi方法

    @RequestMapping(value = "updatelianxi")

    public String updatelianxi(HttpServletRequest request, HttpServletResponse response, HttpSession session, int id) {

        // 输出日志LianxiController.updatelianxi，表示正在执行该方法

        logger.debug("LianxiController.updatelianxi ......");


        lianxiservice.updatelianxi(request, session, id); // 返回修改联系人页面

        return "updatelianxi";

    }


    // 定义updatelianxiact处理联系人修改

    @RequestMapping(value = "updatelianxiact")

    public String updatelianxiact(HttpServletRequest request, HttpServletResponse response, Lianxi lianxi, HttpSession session) throws IOException {

        // 输出日志，表示正在执行当前方法LianxiController.updatelianxiact

        logger.debug("LianxiController.updatelianxiact ......");

        lianxiservice.updatelianxiact(request, lianxi, session);

        // 返回联系人管理方法

        return "forward:/lianximanage.action";

    }


    // 定义userupdatelianxiact方法

    @RequestMapping(value = "userupdatelianxiact")

    public String userupdatelianxiact(HttpServletRequest request, HttpServletResponse response, Lianxi lianxi, HttpSession session) throws IOException {

        // 当执行此方法时，输出此日志

        logger.debug("LianxiController.userupdatelianxiact ......");

        lianxiservice.userupdatelianxiact(request, lianxi, session);

        // 返回user联系人管理方法

        return "forward:/userlianximanage.action";

    }


    // 定义deletelianxi,处理删除联系人

    @RequestMapping(value = "deletelianxi")

    public String deletelianxi(HttpServletRequest request, HttpServletResponse response, HttpSession session, int id) {

        // 输出日志，表示当前正在执行LianxiController.deletelianxi方法

        logger.debug("LianxiController.deletelianxi ......");

        lianxiservice.deletelianxi(request, session, id);

        // 返回联系人管理方法

        return "forward:/lianximanage.action";

    }


    // 定义userdeletelianxi方法

    @RequestMapping(value = "userdeletelianxi")

    public String userdeletelianxi(HttpServletRequest request, HttpServletResponse response, HttpSession session, int id) {

        // 输出日志，表示当前正在执行LianxiController.userdeletelianxi方法

        logger.debug("LianxiController.userdeletelianxi ......");


        lianxiservice.userdeletelianxi(request, session, id); // 返回user联系人管理方法

        return "forward:/userlianximanage.action";

    }


    // 定义searchlianxi方法，处理搜索操作

    @RequestMapping(value = "searchlianxi")

    public String searchlianxi(HttpServletRequest request, HttpServletResponse response, HttpSession session, String search) {

        // 输出日志，表示当前正在执行LianxiController.searchlianxi

        logger.debug("LianxiController.searchlianxi ......");


        lianxiservice.searchlianxi(request, session, search); // 返回查询联系人页面

        return "searchlianxi";

    }


    // 定义LianxipinglunMapper

    @RequestMapping(value = "lianxidetails")

    public String lianxidetails(HttpServletRequest request, HttpSession session, HttpServletResponse response, int id) {

        // 输入日志信息，表名当前执行方法为LianxiController.lianxidetails

        logger.debug("LianxiController.lianxidetails ......");


        lianxiservice.lianxidetails(request, session, id); // 返回联系人详情页面

        return "lianxidetails";

    }


}

