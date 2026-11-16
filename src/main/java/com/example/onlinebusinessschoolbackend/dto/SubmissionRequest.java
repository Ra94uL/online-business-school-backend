package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotNull;

public record SubmissionRequest(
        String submissionDescription,
        String fileReference,
        @NotNull Long assignmentId,
        @NotNull Long enrollmentId) {
}
