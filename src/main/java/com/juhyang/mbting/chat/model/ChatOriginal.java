package com.juhyang.mbting.chat.model;

import java.util.Date;

public class ChatOriginal {
  private int id;
  private int man;
  private int woman;
  private String manName;
  private String womanName;
  private String manProfile;
  private String womanProfile;
  private Date createdAt;
  private Date updatedAt;


  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getMan() {
    return man;
  }

  public void setMan(int man) {
    this.man = man;
  }

  public int getWoman() {
    return woman;
  }

  public void setWoman(int woman) {
    this.woman = woman;
  }

  public String getManName() {
    return manName;
  }

  public void setManName(String manName) {
    this.manName = manName;
  }

  public String getWomanName() {
    return womanName;
  }

  public void setWomanName(String womanName) {
    this.womanName = womanName;
  }

  public String getManProfile() {
    return manProfile;
  }

  public void setManProfile(String manProfile) {
    this.manProfile = manProfile;
  }

  public String getWomanProfile() {
    return womanProfile;
  }

  public void setWomanProfile(String womanProfile) {
    this.womanProfile = womanProfile;
  }

  public Date getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public Date getUpdatedAt() {
    return updatedAt;
  }

  public void setUpdatedAt(Date updatedAt) {
    this.updatedAt = updatedAt;
  }



}


