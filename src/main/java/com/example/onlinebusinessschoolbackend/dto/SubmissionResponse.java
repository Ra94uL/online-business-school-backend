package com.example.onlinebusinessschoolbackend.dto;

public record SubmissionResponse(Long id, String submissionDescription, String fileReference, Long assignmentId,
                                 Long enrollmentId) {
}
