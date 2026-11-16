package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.Size;

public record EnrollmentUpdateRequest(@Size(max = 20) String status, @Size(max = 20) String grade) {
}
