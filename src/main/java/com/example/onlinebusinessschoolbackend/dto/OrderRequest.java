package com.example.onlinebusinessschoolbackend.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;

import java.util.List;

public record OrderRequest(Long studentId, Long companyId, @NotEmpty List<@Valid OrderItemRequest> items) {
}
