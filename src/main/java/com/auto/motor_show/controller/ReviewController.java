package com.auto.motor_show.controller;


import com.auto.motor_show.repository.ReviewRepository;
import com.auto.motor_show.repository.entity.Review;
import com.auto.motor_show.repository.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class ReviewController {

    @Autowired
    ReviewRepository reviewRepository;

    @GetMapping("/review")
    public String mainController(Map<String, Object> model) {
        Iterable<Review> reviews = reviewRepository.findAll();

        model.put("reviews", reviews);
        return "review";

    }

    @PostMapping("/review")
    public String add(@AuthenticationPrincipal User user,
                      @RequestParam String text,
                      Map<String, Object> model) {


        Review review = new Review(text, user);

        reviewRepository.save(review);

        Iterable<Review> reviews = reviewRepository.findAll();

        model.put("reviews", reviews);

        return "review";
    }
}
