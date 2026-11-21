package com.design.Green_Corridor_Backend.auth;

public record TokenResponse(String accessToken,
                            String refreshToken,
                            String tokenType,
                            long expiresInSeconds) { }