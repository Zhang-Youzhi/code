package org.mypro.service;

import java.io.File;

import java.io.FileInputStream;

import java.io.FileOutputStream;

import java.io.IOException;

import java.math.BigDecimal;

import java.text.SimpleDateFormat;

import java.util.HashMap;

import java.util.Map;

import java.util.ArrayList;

import java.util.Calendar;

import java.util.Collections;

import java.util.Date;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;

import org.apache.commons.logging.LogFactory;

import org.mypro.dao.LianxiMapper;

import org.mypro.entity.Lianxi;

import org.mypro.entity.LianxiExample;

import org.mypro.entity.*;
import org.mypro.dao.*;
import org.mypro.entity.User;

import org.mypro.entity.UserExample;

import org.mypro.dao.UserMapper;

import org.mypro.entity.User;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;

public interface LianxiServiceImp {


    //定义方法addlianxi接口,响应控制层添加联系人请求

    public void addlianxi(HttpServletRequest request, HttpSession session);


    //定义useraddlianxi接口，在联系人控制层中调用

    public void useraddlianxi(HttpServletRequest request, HttpSession session);


    // 定义userupdatelianxi方法

    public void userupdatelianxi(HttpServletRequest request, HttpSession session, int id);


    //定义userlianximanage方法

    public void userlianximanage(HttpServletRequest request, HttpSession session);


    //定义useraddlianxiact接口，响应控制层添加请求

    public void useraddlianxiact(HttpServletRequest request, HttpSession session, Lianxi lianxi) throws IOException;


    //定义addlianxiact接口

    public void addlianxiact(HttpServletRequest request, HttpSession session, Lianxi lianxi) throws IOException;


    //定义lianximanage方法响应页面请求

    public void lianximanage(HttpServletRequest request, HttpSession session);


    // 定义 lianxiview方法

    public void lianxiview(HttpServletRequest request, HttpSession session);


    // 定义 updatelianxi方法

    public void updatelianxi(HttpServletRequest request, HttpSession session, int id);


    // 定义updatelianxiact处理联系人修改

    public void updatelianxiact(HttpServletRequest request, Lianxi lianxi, HttpSession session) throws IOException;


    // 定义userupdatelianxiact方法

    public void userupdatelianxiact(HttpServletRequest request, Lianxi lianxi, HttpSession session) throws IOException;


    // 定义deletelianxi,处理删除联系人

    public void deletelianxi(HttpServletRequest request, HttpSession session, int id);


    // 定义userdeletelianxi方法

    public void userdeletelianxi(HttpServletRequest request, HttpSession session, int id);


    // 定义searchlianxi方法，处理搜索操作

    public void searchlianxi(HttpServletRequest request, HttpSession session, String search);


    // 定义LianxipinglunMapper

    public void lianxidetails(HttpServletRequest request, HttpSession session, int id);


}

