package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

// unitPrice hämtas från kursen på servern så klienten kan inte styra priset
public record OrderItemRequest(@NotNull Long courseId, @NotNull @Positive Integer quantity) {
}
