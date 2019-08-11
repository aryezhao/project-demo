package com.usts.controller;

import com.usts.entity.User;
import com.usts.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created by lenovo on 2019/8/7.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //@RequestMapping("list")
    //public void findAll(){
    //    List<User> list = userService.findAll();
    //    System.out.println("user信息："+list);
    //}

    @RequestMapping("upload")
    public String upload(User user, HttpServletRequest request, Model model) throws IOException {

        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath="E:\\www\\images\\";
        //String localPath="http:\\114.67.73.152\\img\\images\\";
        //定义 文件名
        String filename=null;
        if(!user.getFile().isEmpty()){
            //生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=user.getFile().getContentType();
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
            //得到 文件名
            filename=uuid+"."+suffixName;
            //文件保存路径
            user.getFile().transferTo(new File(localPath+filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = "img/images/"+filename;
        System.out.println(sqlPath);
        user.setImage(sqlPath);
        userService.addUser(user);
        model.addAttribute("user", user);
        System.out.println("添加成功===============");
        return "redirect:/list.do";
    }

    //查询所有用户
    @RequestMapping("list")
    public String getAll(Model model) throws Exception{
        List<User> userList = userService.findAll();
        model.addAttribute("userList",userList);
        return "success";
    }

}
