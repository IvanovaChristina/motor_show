package com.auto.motor_show.repository;

import com.auto.motor_show.repository.entity.Review;
import org.springframework.data.repository.CrudRepository;

public interface ReviewRepository extends CrudRepository<Review, Long> {
}
