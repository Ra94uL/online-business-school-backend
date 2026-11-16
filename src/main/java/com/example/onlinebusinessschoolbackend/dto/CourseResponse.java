package com.example.onlinebusinessschoolbackend.dto;

import java.math.BigDecimal;
import java.util.Set;

public record CourseResponse(Long id, String title, String description, Double duration, BigDecimal price,
                             String imageUrl, Long teacherId, Set<Long> teacherIds, Long adminId) {
}
