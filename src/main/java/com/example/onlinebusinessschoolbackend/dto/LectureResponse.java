package com.example.onlinebusinessschoolbackend.dto;

import java.time.LocalDateTime;

public record LectureResponse(Long id, String lectureTitle, String lectureDescription, LocalDateTime lectureDate,
                              Integer durationMinutes, Integer lectureSequenceNumber, String lectureUrl,
                              Long moduleId) {
}
