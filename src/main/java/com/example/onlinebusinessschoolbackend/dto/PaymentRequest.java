package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotNull;

// belopp och status bestäms av servern utifrån ordern
public record PaymentRequest(@NotNull Long orderId) {
}
