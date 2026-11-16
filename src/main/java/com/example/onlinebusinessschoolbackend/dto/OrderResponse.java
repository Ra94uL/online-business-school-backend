package com.example.onlinebusinessschoolbackend.dto;

import java.time.LocalDate;
import java.util.List;

public record OrderResponse(Long id, LocalDate orderDate, Long companyId, Long studentId,
                            List<OrderItemResponse> items) {
}
