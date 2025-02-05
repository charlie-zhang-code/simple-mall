package io.github.charlie.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 测试控制器
 */
@RequestMapping("/test")
@RestController
public class TestController {
    @GetMapping
    public String index() {
        return "Hello World!";
    }
}
