package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

public record CourseModuleRequest(
        @NotBlank @Size(max = 100) String title,
        @NotBlank @Size(max = 300) String description,
        @NotNull @Positive Integer sequenceNumber,
        @NotNull Long courseId) {
}
