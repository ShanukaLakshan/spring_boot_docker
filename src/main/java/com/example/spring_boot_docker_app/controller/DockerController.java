package com.example.spring_boot_docker_app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/docker")
public class DockerController {

    @GetMapping("test")
    public String test() {
        return "Hello Docker!";
    }

    @GetMapping("test2")
    public String test2() {
        return "Docker2!";
    }

}
