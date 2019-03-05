package com.bumbing.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitorCountVO {
  private int visit_id;
    private String visit_ip;
    private Date visit_time;
    private String visit_refer;
    private String visit_agent;
}