package com.example.onlinebusinessschoolbackend.dto;

import java.time.LocalDate;

public record CertificateResponse(Long id, LocalDate dateOfIssue, String certificateType, Long enrollmentId) {
}
