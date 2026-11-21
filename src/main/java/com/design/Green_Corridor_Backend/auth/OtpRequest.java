package com.design.Green_Corridor_Backend.auth;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record OtpRequest(
        @NotBlank @Pattern(regexp = "^\\+?[0-9]{10,14}$", message = "invalid phone number")
        String phone) { }
