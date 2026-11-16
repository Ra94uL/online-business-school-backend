package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CompanyRequest(
        @NotBlank @Size(max = 300) String companyName,
        @NotBlank @Size(max = 20) String orgNumber,
        @Email @Size(max = 100) String contactEmail,
        @Size(max = 20) String phoneNumber) {
}
