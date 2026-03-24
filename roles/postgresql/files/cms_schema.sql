-- ==========================================================
-- 1. CRÉATION DU CONTENEUR (SCHÉMA)
-- ==========================================================
CREATE SCHEMA IF NOT EXISTS cms_schema AUTHORIZATION cms_user;

-- ==========================================================
-- 2. CRÉATION DES TABLES (STRUCTURE)
-- ==========================================================
CREATE TABLE IF NOT EXISTS cms_schema.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    email VARCHAR(100)
);

-- Tu pourras ajouter ici d'autres tables comme 'articles' plus tard

-- ==========================================================
-- 3. GESTION DES DROITS (SÉCURITÉ)
-- ==========================================================

-- Droits pour le groupe ANALYSTE (Lecture seule)
GRANT USAGE ON SCHEMA cms_schema TO db_analyst;
GRANT SELECT ON ALL TABLES IN SCHEMA cms_schema TO db_analyst;

-- Droits pour le groupe DEVELOPPEUR (Lecture + Écriture)
GRANT USAGE ON SCHEMA cms_schema TO db_developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA cms_schema TO db_developer;

-- ==========================================================
-- 4. AUTOMATISATION POUR LE FUTUR (SCALABILITÉ)
-- ==========================================================
-- Pour que les prochaines tables créées par 'cms_user' héritent des droits
ALTER DEFAULT PRIVILEGES IN SCHEMA cms_schema 
GRANT SELECT ON TABLES TO db_analyst;

ALTER DEFAULT PRIVILEGES IN SCHEMA cms_schema 
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO db_developer;
