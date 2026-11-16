package com.example.onlinebusinessschoolbackend.dto;

import java.time.LocalDate;

public record AssignmentResponse(Long id, String title, String description, LocalDate dueDate, Long moduleId) {
}
