package org.mypro.service;

import java.io.File;

import java.io.FileInputStream;

import java.io.FileOutputStream;

import java.io.IOException;

import java.math.BigDecimal;

import java.text.SimpleDateFormat;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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

@Service

public class LianxiService implements LianxiServiceImp {


    private static final Log logger = LogFactory.getLog(LianxiService.class);

    @Autowired
    private LianxiMapper lianxidao;
// 定义userdao参数  


    @Autowired
    private UserMapper userdao;


    //定义方法addlianxi,响应控制层addlianxi请求

    public void addlianxi(HttpServletRequest request, HttpSession session) {

        //输出日志，当前执行方法为addlianxi

        logger.debug("LianxiService.addlianxi ......");

// 定义 example1为 UserExample的实例

        UserExample example1 = new UserExample();

// 定义userall的List使用 userdao的selectByExample方法查询所有联系人数据

        List userall = userdao.selectByExample(example1);

        // 将上面查询到的联系人数据保存到request中，返回页面

        request.setAttribute("userall", userall);


    }


    //定义useraddlianxi方法，在联系人控制层中调用

    public void useraddlianxi(HttpServletRequest request, HttpSession session) {

        //输出日志，表示当前正在执行LianxiService.useraddlianxi方法

        logger.debug("LianxiService.useraddlianxi ......");

// 定义 example1为 UserExample的实例

        UserExample example1 = new UserExample();

// 定义userall的List使用 userdao的selectByExample方法查询所有联系人数据

        List userall = userdao.selectByExample(example1);

        // 将上面查询到的联系人数据保存到request中，返回页面

        request.setAttribute("userall", userall);


    }


    // 定义userupdatelianxi方法

    public void userupdatelianxi(HttpServletRequest request, HttpSession session, int id) {

        // 输出日志LianxiService.userupdatelianxi

        logger.debug("LianxiService.userupdatelianxi ......");


        // 实例化联系人,使用lianxidao的selectByPrimaryKey方法通过id查询联系人

        Lianxi lianxi = lianxidao.selectByPrimaryKey(id);


// 定义 example1为 UserExample的实例

        UserExample example1 = new UserExample();

// 定义userall的List使用 userdao的selectByExample方法查询所有联系人数据

        List userall = userdao.selectByExample(example1);

        // 将上面查询到的联系人数据保存到request中，返回页面

        request.setAttribute("userall", userall);


        // 将查询出的联系人信息保存到request中

        request.setAttribute("lianxi", lianxi);


    }


    //定义userlianximanage方法

    public void userlianximanage(HttpServletRequest request, HttpSession session) {

        //输出日志 ，表示当前正在执行方法为LianxiService.userlianximanage

        logger.debug("LianxiService.userlianximanage ......");


        //定义实体，从session中获取当前用户，赋值给

        User user = (User) session.getAttribute("userinfo");


        //实例化联系人类为example

        LianxiExample example = new LianxiExample();


        //实例化联系人Example类的criteria

        LianxiExample.Criteria criteria = example.createCriteria();

        // 通过 criteria设置查询条件Userid为当前用户id

        criteria.andUseridEqualTo(user.getId());


        // 使用 lianxidao.selectByExample(example)方法查询所有userid为当前用户id的联系人

        List<Lianxi> lianxiall = lianxidao.selectByExample(example);

// 遍历列表，读取xinxi字段，并转换为JSON字符串
        for (Lianxi lianxi : lianxiall) {
            // 获取xinxi字段，假设它已经是JSON格式的字符串
            String xinxiJson = lianxi.getXinxi();

            // 将字符串解析为JSONArray
            JSONArray jsonArray = JSON.parseArray(xinxiJson);

            // 使用StringBuilder来构建格式化的字符串
            StringBuilder formattedString = new StringBuilder();

            // 遍历JSONArray中的每个JSONObject
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                // 获取name和value键对应的值
                String name = jsonObject.getString("name");
                String value = jsonObject.getString("value");
                // 添加到StringBuilder中，格式为"键：值|"
                formattedString.append(name).append("：").append(value).append("|");
            }

            // 移除最后一个多余的"|"
            if (formattedString.length() > 0) {
                formattedString.setLength(formattedString.length() - 1);
            }

            // 重新设置xinxi字段
            lianxi.setXinxi(formattedString.toString());

        }

        // 将查询的联系人数据保存到request中的 lianxiall参数中


        request.setAttribute("lianxiall", lianxiall);
    }


    //定义useraddlianxiact，响应页面添加请求

    public void useraddlianxiact(HttpServletRequest request, HttpSession session, Lianxi lianxi) throws IOException {

        //输出日志，表示当前正在执行方法为LianxiService.useraddlianxiact

        logger.debug("LianxiService.useraddlianxiact ......");

        //使用mybatis逆向工程所提供的insert方法添加联系人数据到数据库中

        lianxidao.insert(lianxi);


        //将添加联系人成功的信息保存到request中，在页面中进行初始化

        request.setAttribute("message", "添加联系人成功");

    }


    //定义addlianxiact方法

    public void addlianxiact(HttpServletRequest request, HttpSession session, Lianxi lianxi) throws IOException {

        //输出当前方法日志，表示正在执行LianxiService.addlianxiact方法

        logger.debug("LianxiService.addlianxiact ......");

        //使用lianxidao的insert方法将联系人添加到数据库中

        lianxidao.insert(lianxi);


        //将添加联系人信息添加到request中用message参数进行保存

        request.setAttribute("message", "添加联系人成功");

    }


    //定义lianximanage方法响应页面请求

    public void lianximanage(HttpServletRequest request, HttpSession session) {

        //输出日志，表示当前正在执行LianxiService.lianximanage

        logger.debug("LianxiService.lianximanage ......");


        //实例化LianxiExample类为example

        LianxiExample example = new LianxiExample();


        // 使用 lianxidao.selectByExample(example)方法查询所有userid为当前用户id的联系人

        List<Lianxi> lianxiall = lianxidao.selectByExample(example);

// 遍历列表，读取xinxi字段，并转换为JSON字符串
        for (Lianxi lianxi : lianxiall) {
            // 获取xinxi字段，假设它已经是JSON格式的字符串
            String xinxiJson = lianxi.getXinxi();

            // 将字符串解析为JSONArray
            JSONArray jsonArray = JSON.parseArray(xinxiJson);

            // 使用StringBuilder来构建格式化的字符串
            StringBuilder formattedString = new StringBuilder();

            // 遍历JSONArray中的每个JSONObject
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                // 获取name和value键对应的值
                String name = jsonObject.getString("name");
                String value = jsonObject.getString("value");
                // 添加到StringBuilder中，格式为"键：值|"
                formattedString.append(name).append("：").append(value).append("|");
            }

            // 移除最后一个多余的"|"
            if (formattedString.length() > 0) {
                formattedString.setLength(formattedString.length() - 1);
            }

            // 重新设置xinxi字段
            lianxi.setXinxi(formattedString.toString());

        }

        // 将查询的联系人数据保存到request中的 lianxiall参数中


        request.setAttribute("lianxiall", lianxiall);


    }


    // 定义 lianxiview方法

    public void lianxiview(HttpServletRequest request, HttpSession session) {

        // 输出日志，表示当前正在执行LianxiService.lianxiview方法

        logger.debug("LianxiService.lianxiview ......");


        // 实例化LianxiExample类

        LianxiExample example = new LianxiExample();

        LianxiExample.Criteria criteria = example.createCriteria();

        criteria.andUseridEqualTo((Integer) session.getAttribute("id"));

        criteria.andZhongyaoEqualTo("重要");


        // 使用 lianxidao.selectByExample(example)方法查询所有userid为当前用户id的联系人

        List<Lianxi> lianxiall = lianxidao.selectByExample(example);

// 遍历列表，读取xinxi字段，并转换为JSON字符串
        for (Lianxi lianxi : lianxiall) {
            // 获取xinxi字段，假设它已经是JSON格式的字符串
            String xinxiJson = lianxi.getXinxi();

            // 将字符串解析为JSONArray
            JSONArray jsonArray = JSON.parseArray(xinxiJson);

            // 使用StringBuilder来构建格式化的字符串
            StringBuilder formattedString = new StringBuilder();

            // 遍历JSONArray中的每个JSONObject
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                // 获取name和value键对应的值
                String name = jsonObject.getString("name");
                String value = jsonObject.getString("value");
                // 添加到StringBuilder中，格式为"键：值|"
                formattedString.append(name).append("：").append(value).append("|");
            }

            // 移除最后一个多余的"|"
            if (formattedString.length() > 0) {
                formattedString.setLength(formattedString.length() - 1);
            }

            // 重新设置xinxi字段
            lianxi.setXinxi(formattedString.toString());

        }

        // 将查询的联系人数据保存到request中的 lianxiall参数中


        request.setAttribute("lianxiall", lianxiall);


    }


    // 定义 updatelianxi方法

    public void updatelianxi(HttpServletRequest request, HttpSession session, int id) {

        // 输出日志LianxiController.updatelianxi，表示正在执行该方法

        logger.debug("LianxiController.updatelianxi ......");


        // 定义联系人为biaoming，使用 lianxidao的selectByPrimaryKey方法通过id查询数据

        Lianxi lianxi = lianxidao.selectByPrimaryKey(id);


// 定义 example1为 UserExample的实例

        UserExample example1 = new UserExample();

// 定义userall的List使用 userdao的selectByExample方法查询所有联系人数据

        List userall = userdao.selectByExample(example1);

        // 将上面查询到的联系人数据保存到request中，返回页面

        request.setAttribute("userall", userall);


        // 将查询的联系人保存到request中

        request.setAttribute("lianxi", lianxi);


    }


    // 定义userupdatelianxiact方法

    public void userupdatelianxiact(HttpServletRequest request, Lianxi lianxi, HttpSession session) throws IOException {

        // 当执行此方法时，输出此日志

        logger.debug("LianxiService.userupdatelianxiact ......");

        // 调用lianxidao的updateByPrimaryKeySelective方法修改传入的lianxi

        lianxidao.updateByPrimaryKeySelective(lianxi);


        request.setAttribute("message", "修改联系人信息成功");


    }
    // 定义updatelianxiact处理联系人修改

    public void updatelianxiact(HttpServletRequest request, Lianxi lianxi, HttpSession session) throws IOException {

        // 输出日志，表示正在执行当前方法LianxiController.updatelianxiact

        logger.debug("LianxiController.updatelianxiact ......");

        // 执行lianxidao的updateByPrimaryKeySelective方法，将传入的联系人数据同步到数据库中

        lianxidao.updateByPrimaryKeySelective(lianxi);


        // 将修改成功信息保存到request中

        request.setAttribute("message", "修改联系人信息成功");


    }


    // 定义deletelianxi,处理删除联系人

    public void deletelianxi(HttpServletRequest request, HttpSession session, int id) {

        // 输出日志，表示当前正在执行LianxiService.deletelianxi方法

        logger.debug("LianxiService.deletelianxi ......");

        //如果传入的id为-1，表示进行批量删除
        if (id == -1) {
            //实例化联系人example
            LianxiExample example = new LianxiExample();
            //获取到传递过来的ids数据信息
            String ids = request.getParameter("ids");
            //为id信息添加-1数据，添加此数据可以防止数据为空时的报错
            ids += "-1,";
            //截取掉多余的逗号
            ids.substring(0, ids.length() - 1);
            //设置where语句进行删除id数据的传入
            //example.setWhere("id in ("+ ids +")");
            //实例化联系人criteria
            LianxiExample.Criteria criteria = example.createCriteria();
            //设置integer类型的数组，保存需要删除的联系人id信息
            List<Integer> idlist = new ArrayList();
            //根据id分离出需要删除的数据id信息
            String[] idarr = ids.split(",");
            //将对应的id数据信息保存到数组中
            for (int i = 0; i < idarr.length; i++) {
                //取出对应的id信息，并转换成int类型
                idlist.add(Integer.parseInt(idarr[i]));
            }
            //传入需要删除的id数组信息
            criteria.andIdIn(idlist);
            //调用联系人的dao类，执行批量删除操作
            lianxidao.deleteByExample(example);
        } else {
            // 根据id调用lianxidao的deleteByPrimaryKey方法，删除联系人


            lianxidao.deleteByPrimaryKey(id);

        }


        request.setAttribute("message", "删除联系人成功");


    }


    // 定义userdeletelianxi方法

    public void userdeletelianxi(HttpServletRequest request, HttpSession session, int id) {

        // 输出日志，表示当前正在执行LianxiController.userdeletelianxi方法

        logger.debug("LianxiController.userdeletelianxi ......");


        // 调用lianxidao的deleteByPrimaryKey方法，传入id。删除id所对应的联系人

        lianxidao.deleteByPrimaryKey(id);

        // 将删除联系人成功信息保存到request中


        request.setAttribute("message", "删除联系人成功");

    }


    // 定义searchlianxi方法，处理搜索操作

    public void searchlianxi(HttpServletRequest request, HttpSession session, String search) {

        // 输出日志，表示当前正在执行LianxiService.searchlianxi

        logger.debug("LianxiService.searchlianxi ......");


        // 实例化 LianxiExample

        LianxiExample example = new LianxiExample();

        // 实例化 LianxiExample的Criteria内部类

        LianxiExample.Criteria criteria = example.createCriteria();

        // 如果搜索内容不等于空

        if (search != null) {

            // 将搜索内容通过like关键字传到数据库中进行搜索

            criteria.andNameLike("%" + search + "%");

        }

        // 查询联系人结果

        // 使用 lianxidao.selectByExample(example)方法查询所有userid为当前用户id的联系人

        List<Lianxi> lianxiall = lianxidao.selectByExample(example);

// 遍历列表，读取xinxi字段，并转换为JSON字符串
        for (Lianxi lianxi : lianxiall) {
            // 获取xinxi字段，假设它已经是JSON格式的字符串
            String xinxiJson = lianxi.getXinxi();

            // 将字符串解析为JSONArray
            JSONArray jsonArray = JSON.parseArray(xinxiJson);

            // 使用StringBuilder来构建格式化的字符串
            StringBuilder formattedString = new StringBuilder();

            // 遍历JSONArray中的每个JSONObject
            for (int i = 0; i < jsonArray.size(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                // 获取name和value键对应的值
                String name = jsonObject.getString("name");
                String value = jsonObject.getString("value");
                // 添加到StringBuilder中，格式为"键：值|"
                formattedString.append(name).append("：").append(value).append("|");
            }

            // 移除最后一个多余的"|"
            if (formattedString.length() > 0) {
                formattedString.setLength(formattedString.length() - 1);
            }

            // 重新设置xinxi字段
            lianxi.setXinxi(formattedString.toString());

        }

        // 将查询的联系人数据保存到request中的 lianxiall参数中


        request.setAttribute("lianxiall", lianxiall);

    }


    // 定义LianxipinglunMapper

    public void lianxidetails(HttpServletRequest request, HttpSession session, int id) {

        // 输入日志信息，表名当前执行方法为LianxiController.lianxidetails

        logger.debug("LianxiController.lianxidetails ......");


        // 传入页面所传入的联系人id使用lianxidao的selectByPrimaryKey方法进行查询

        Lianxi lianxi = lianxidao.selectByPrimaryKey(id);

        // 将查询到的联系人保存到request中

        request.setAttribute("lianxi", lianxi);


    }


//	上传文件图片等

    public String uploadUtile(MultipartFile file, HttpServletRequest request) throws IOException {

        // 根据当前时间生成时间字符串

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");

        String res = sdf.format(new Date());

        // uploads文件夹位置

        String tomcatroot = request.getSession().getServletContext().getRealPath("resource/uploads/");
        String localroot = request.getServletContext().getRealPath("").split("out")[0] + "WebRoot/resource/uploads";
        System.out.println(tomcatroot);
        System.out.println(localroot);

        // 原始名称

        String originalFileName = file.getOriginalFilename();

        // 新文件名

        String newFileName = "sliver" + res + originalFileName.substring(originalFileName.lastIndexOf("."));

        // 创建年月文件夹

        Calendar date = Calendar.getInstance();

        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH) + 1));

        // 新文件

        File tomcatFile = new File(tomcatroot + File.separator + dateDirs + File.separator + newFileName);
        File localFile = new File(localroot + File.separator + dateDirs + File.separator + newFileName);

        // 判断目标文件所在目录是否存在

        if (!tomcatFile.getParentFile().exists()) {

            // 如果目标文件所在的目录不存在，则创建父目录

            tomcatFile.getParentFile().mkdirs();

        }
        // 判断目标文件所在目录是否存在

        if (!localFile.getParentFile().exists()) {

            // 如果目标文件所在的目录不存在，则创建父目录

            localFile.getParentFile().mkdirs();

        }

        file.transferTo(tomcatFile);
        String tomcatfilename = tomcatroot + File.separator + dateDirs + File.separator + newFileName;
        String localfilename = localroot + File.separator + dateDirs + File.separator + newFileName;

        try (FileInputStream fis = new FileInputStream(tomcatfilename);
             FileOutputStream fos = new FileOutputStream(localfilename)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
            System.out.println("文件复制成功！");
        } catch (IOException e) {
            e.printStackTrace();
        }

        String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH) + 1) + "/" + newFileName;

        return fileUrl;

    }
}

