CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL CHECK (LENGTH(password_hash) >= 60),
    created_at TIMESTAMP DEFAULT NOW(),
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT true,
    deleted_at TIMESTAMP
);

CREATE TABLE templates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    structure JSONB NOT NULL,
    is_public BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE cvs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    content JSONB NOT NULL,
    template_id INTEGER REFERENCES templates(id),
    ats_score FLOAT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    version INTEGER DEFAULT 1,
    deleted_at TIMESTAMP
);

CREATE TABLE cv_versions (
    id SERIAL PRIMARY KEY,
    cv_id INTEGER NOT NULL REFERENCES cvs(id) ON DELETE CASCADE,
    content JSONB NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);