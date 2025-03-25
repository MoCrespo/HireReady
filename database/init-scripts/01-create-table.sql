CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE cvs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    content JSONB NOT NULL,
    template_id INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);