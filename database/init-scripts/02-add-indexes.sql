CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

CREATE INDEX idx_cvs_user_id ON cvs(user_id);
CREATE INDEX idx_cvs_created_at ON cvs(created_at);
CREATE INDEX idx_cvs_ats_score ON cvs(ats_score);

CREATE INDEX idx_cv_versions_cv_id ON cv_versions(cv_id);