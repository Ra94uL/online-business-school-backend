package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

import java.time.LocalDateTime;

public record LectureRequest(
        @NotBlank @Size(max = 300) String lectureTitle,
        @NotBlank @Size(max = 300) String lectureDescription,
        LocalDateTime lectureDate,
        @NotNull @Positive Integer durationMinutes,
        @NotNull @Positive Integer lectureSequenceNumber,
        String lectureUrl,
        @NotNull Long moduleId) {
}
