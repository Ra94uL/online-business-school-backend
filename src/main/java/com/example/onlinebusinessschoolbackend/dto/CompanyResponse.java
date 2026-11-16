package com.example.onlinebusinessschoolbackend.dto;

public record CompanyResponse(Long id, String companyName, String orgNumber, String contactEmail,
                              String phoneNumber) {
}
