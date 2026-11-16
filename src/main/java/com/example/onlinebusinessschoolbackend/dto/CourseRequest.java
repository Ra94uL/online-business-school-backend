package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;
import java.util.Set;

public record CourseRequest(
        @NotBlank @Size(max = 100) String title,
        @NotBlank @Size(max = 100) String description,
        @NotNull @Positive Double duration,
        @NotNull @DecimalMin("0.00") BigDecimal price,
        String imageUrl,
        Long teacherId,
        Set<Long> teacherIds) {
}
