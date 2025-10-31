package com.FitnessApplication.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.FitnessApplication.model.Workout;

public interface WorkoutRepository extends JpaRepository<Workout, Long> {
    List<Workout> findByUserId(Long userId);

    @Query("SELECT w FROM Workout w WHERE w.user.id = :userId AND w.durationInMinutes = (SELECT MAX(w2.durationInMinutes) FROM Workout w2 WHERE w2.user.id = :userId)")
    Optional<Workout> findWorkoutWithMaxDurationByUserId(@Param("userId") Long userId);

    @Query("SELECT w FROM Workout w WHERE w.user.id = :userId AND w.durationInMinutes = (SELECT MIN(w2.durationInMinutes) FROM Workout w2 WHERE w2.user.id = :userId)")
    Optional<Workout> findWorkoutWithMinDurationByUserId(@Param("userId") Long userId);
}
