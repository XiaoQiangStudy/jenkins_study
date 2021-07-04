package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
    @ResponseBody
    @RequestMapping(path = "/hello")
    public String hello(){
        return "这是第2次使用 webhook 调用 Jenkins！";
    }
}
