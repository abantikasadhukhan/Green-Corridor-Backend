package com.design.Green_Corridor_Backend.user;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "user_roles")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "user_id", nullable = false)
    private UUID userId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    private Role role;

    @Enumerated(EnumType.STRING)
    @Column(name = "scope_type", nullable = false, length = 20)
    private ScopeType scopeType;

    @Column(name = "scope_id")
    private UUID scopeId;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private Instant createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private Instant updatedAt;

    @Version
    private Long version;

    protected UserRole() { }   // JPA needs this

    public UserRole(UUID userId, Role role, ScopeType scopeType, UUID scopeId) {
        this.userId = userId;
        this.role = role;
        this.scopeType = scopeType;
        this.scopeId = scopeId;
    }

    public UUID getUserId() { return userId; }
    public Role getRole() { return role; }
    public ScopeType getScopeType() { return scopeType; }
    public UUID getScopeId() { return scopeId; }
}
