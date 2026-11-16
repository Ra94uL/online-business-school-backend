package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

public record StudentRegistrationRequest(
        @NotBlank @Email @Size(max = 100) String email,
        @NotBlank @Size(min = 8, max = 100) String password,
        @NotBlank @Size(max = 300) String name,
        @NotNull @Past LocalDate dateOfBirth,
        @NotBlank @Size(max = 20) String phoneNumber,
        @NotBlank @Size(max = 100) String country,
        Long companyId) {
}
