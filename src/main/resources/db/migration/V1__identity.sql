CREATE TABLE regions (
    id                       uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name                     varchar(100)  NOT NULL UNIQUE,
    price_cap_per_km         numeric(10,2) NOT NULL,
    price_cap_base           numeric(10,2) NOT NULL,
    max_pickup_charge_per_km numeric(10,2) NOT NULL,
    timezone                 varchar(50)   NOT NULL DEFAULT 'Asia/Kolkata',
    created_at               timestamptz   NOT NULL DEFAULT now(),
    updated_at               timestamptz   NOT NULL DEFAULT now(),
    version                  bigint        NOT NULL DEFAULT 0
);

CREATE TABLE users (
    id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    phone       varchar(15)  NOT NULL UNIQUE,
    email       varchar(120),
    full_name   varchar(100) NOT NULL,
    status      varchar(30)  NOT NULL DEFAULT 'PENDING_VERIFICATION',
    region_id   uuid REFERENCES regions (id),
    created_at  timestamptz  NOT NULL DEFAULT now(),
    updated_at  timestamptz  NOT NULL DEFAULT now(),
    version     bigint       NOT NULL DEFAULT 0,
    CONSTRAINT chk_users_status
        CHECK (status IN ('ACTIVE', 'SUSPENDED', 'PENDING_VERIFICATION'))
);

CREATE TABLE user_roles (
    id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     uuid        NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    role        varchar(30) NOT NULL,
    scope_type  varchar(20) NOT NULL DEFAULT 'NONE',
    scope_id    uuid,
    created_at  timestamptz NOT NULL DEFAULT now(),
    updated_at  timestamptz NOT NULL DEFAULT now(),
    version     bigint      NOT NULL DEFAULT 0,
    CONSTRAINT chk_user_roles_role CHECK (role IN
        ('PATIENT','DRIVER','HOSPITAL_ADMIN','TRAFFIC_OFFICER',
         'PLATFORM_ADMIN','MEDICAL_ADVISOR','AUDITOR')),
    CONSTRAINT chk_user_roles_scope CHECK (scope_type IN
        ('REGION','HOSPITAL','ZONE','NONE')),
    CONSTRAINT uq_user_role_scope
        UNIQUE NULLS NOT DISTINCT (user_id, role, scope_id)
);