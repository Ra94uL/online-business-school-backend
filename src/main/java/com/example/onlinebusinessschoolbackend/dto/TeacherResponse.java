package com.example.onlinebusinessschoolbackend.dto;

public record TeacherResponse(Long id, String name, String phoneNumber, String subject, String country,
                              Long accountId) {
}
