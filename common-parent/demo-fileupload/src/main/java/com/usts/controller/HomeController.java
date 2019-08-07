package com.usts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lenovo on 2019/8/6.
 */
@Controller
public class HomeController {

    @RequestMapping("home")
    public String home(){
        return "register";
    }

    //@RequestMapping("upload")
    //public String upload(){
    //    return "success";
    //}

    @RequestMapping("file/upload")
    public void fileupload(){

        System.out.println("上传图片");
    }
}
