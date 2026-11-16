package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotNull;

public record EnrollmentRequest(@NotNull Long studentId, @NotNull Long courseId, Long orderItemId) {
}
