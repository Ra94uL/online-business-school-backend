package com.example.onlinebusinessschoolbackend.dto;

import java.time.LocalDate;

public record StudentResponse(Long id, String name, LocalDate dateOfBirth, String phoneNumber, String country,
                              Long companyId, Long accountId) {
}
