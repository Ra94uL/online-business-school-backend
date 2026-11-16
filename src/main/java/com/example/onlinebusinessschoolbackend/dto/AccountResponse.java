package com.example.onlinebusinessschoolbackend.dto;

import java.util.Set;

public record AccountResponse(Long id, String email, Set<String> roles) {
}
