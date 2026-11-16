package com.example.onlinebusinessschoolbackend.dto;

public record CourseModuleResponse(Long id, String title, String description, Integer sequenceNumber,
                                   Long courseId) {
}
