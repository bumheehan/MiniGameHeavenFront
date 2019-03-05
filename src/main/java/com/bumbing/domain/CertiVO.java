package com.bumbing.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CertiVO {

  private String email;
  private String key;
  private int type;
  
}
