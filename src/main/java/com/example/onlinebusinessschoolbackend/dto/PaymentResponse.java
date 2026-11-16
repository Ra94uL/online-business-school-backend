package com.example.onlinebusinessschoolbackend.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

public record PaymentResponse(Long id, LocalDate paymentDate, String status, BigDecimal amount, Long orderId) {
}
