package com.example.product;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class ProductController {
  @GetMapping("/health")
  public String health() { return "UP"; }

  @GetMapping("/products")
  public List<String> products() {
    return List.of("widget","gadget","thingamajig");
  }
}
