package com.example.onlinebusinessschoolbackend.dto;

import java.math.BigDecimal;

public record OrderItemResponse(Long id, Integer quantity, BigDecimal unitPrice, Long orderId, Long courseId) {
}
