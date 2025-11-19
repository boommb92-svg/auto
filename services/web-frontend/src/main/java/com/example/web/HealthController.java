package com.example.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

@RestController
public class HealthController {
  @GetMapping("/health")
  public Map<String,String> health() {
    return Map.of("status","UP");
  }

  @GetMapping("/")
  public String home() {
    return "Hello from web-frontend";
  }
}
