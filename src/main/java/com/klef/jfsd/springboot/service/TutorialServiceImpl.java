package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Tutorial;
import com.klef.jfsd.springboot.repository.TutorialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TutorialServiceImpl implements TutorialService {

    @Autowired
    private TutorialRepository tutorialRepository;

    @Override
    public Tutorial addTutorial(Tutorial tutorial) {
        return tutorialRepository.save(tutorial);
    }

    @Override
    public Tutorial getTutorialById(int id) {
        Optional<Tutorial> tutorial = tutorialRepository.findById(id);
        return tutorial.orElse(null);
    }

    @Override
    public List<Tutorial> getAllTutorials() {
        return tutorialRepository.findAll();
    }

    @Override
    public Tutorial updateTutorial(int id, Tutorial tutorial) {
        Optional<Tutorial> existingTutorial = tutorialRepository.findById(id);
        if (existingTutorial.isPresent()) {
            tutorial.setId(id);
            return tutorialRepository.save(tutorial);
        }
        return null;
    }

    @Override
    public void deleteTutorial(int id) {
        tutorialRepository.deleteById(id);
    }
}
