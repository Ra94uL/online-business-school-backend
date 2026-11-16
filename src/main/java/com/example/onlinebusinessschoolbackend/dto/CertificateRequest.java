package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

public record CertificateRequest(
        @NotNull LocalDate dateOfIssue,
        @NotBlank @Size(max = 100) String certificateType,
        @NotNull Long enrollmentId) {
}
