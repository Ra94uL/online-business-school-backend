package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record TeacherRequest(
        @NotBlank @Size(max = 100) String name,
        @NotBlank @Size(max = 20) String phoneNumber,
        @NotBlank @Size(max = 100) String subject,
        @NotBlank @Size(max = 100) String country) {
}
