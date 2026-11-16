package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

public record AssignmentRequest(
        @NotBlank @Size(max = 300) String title,
        @NotBlank @Size(max = 600) String description,
        LocalDate dueDate,
        @NotNull Long moduleId) {
}
