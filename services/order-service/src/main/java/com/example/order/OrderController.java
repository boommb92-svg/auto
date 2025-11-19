package com.example.order;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

@RestController
public class OrderController {
  @GetMapping("/health")
  public String health() { return "UP"; }

  @GetMapping("/order")
  public Map<String,String> order() {
    return Map.of("status","created","id","12345");
  }
}
