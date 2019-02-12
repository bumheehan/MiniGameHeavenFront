package com.bumbing.domain;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AuthVO {

  private String email;
  private String auth;
  
}
