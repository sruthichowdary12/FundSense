package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Tutorial;
import java.util.List;

public interface TutorialService {
    Tutorial addTutorial(Tutorial tutorial);
    Tutorial getTutorialById(int id);
    List<Tutorial> getAllTutorials();
    Tutorial updateTutorial(int id, Tutorial tutorial);
    void deleteTutorial(int id);
}
