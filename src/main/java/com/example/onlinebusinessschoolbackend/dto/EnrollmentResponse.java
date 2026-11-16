package com.example.onlinebusinessschoolbackend.dto;

import java.time.LocalDate;

public record EnrollmentResponse(Long id, LocalDate enrollmentDate, String status, String grade, Long studentId,
                                 Long courseId, Long orderItemId) {
}
