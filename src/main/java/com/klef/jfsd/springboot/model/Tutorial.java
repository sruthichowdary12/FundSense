package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tutorial_table")
public class Tutorial {
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "tutorial_id")
  private int id;

  @Column(name = "tutorial_category", nullable = false, length = 100)
  private String category;

  @Column(name = "tutorial_name", nullable = false, length = 100)
  private String name;

  @Column(name = "tutorial_desc", nullable = false, length = 500)
  private String description;

  // Attribute to store the video file as a Blob
  @Column(name = "tutorial_video", nullable = false)
  private Blob video;

  @Column(name = "tutorial_difficulty_level", nullable = false, length = 50)
  private String difficultyLevel;  // For example: "Beginner", "Intermediate", "Advanced", "Tips"

  // Getters and Setters
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public String getCategory() {
    return category;
  }
  public void setCategory(String category) {
    this.category = category;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }
  public Blob getVideo() {
    return video;
  }
  public void setVideo(Blob video) {
    this.video = video;
  }
  public String getDifficultyLevel() {
    return difficultyLevel;
  }
  public void setDifficultyLevel(String difficultyLevel) {
    this.difficultyLevel = difficultyLevel;
  }
}
