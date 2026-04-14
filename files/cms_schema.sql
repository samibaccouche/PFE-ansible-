-- Création des tables principales pour WordPress

-- Table des articles/pages
CREATE TABLE IF NOT EXISTS wp_posts (
    ID BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    post_author BIGINT UNSIGNED DEFAULT 0 NOT NULL,
    post_date DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
    post_date_gmt DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
    post_content LONGTEXT,
    post_title TEXT,
    post_excerpt TEXT,
    post_status VARCHAR(20) DEFAULT 'publish' NOT NULL,
    comment_status VARCHAR(20) DEFAULT 'open' NOT NULL,
    ping_status VARCHAR(20) DEFAULT 'open' NOT NULL,
    post_password VARCHAR(255) DEFAULT '' NOT NULL,
    post_name VARCHAR(200) DEFAULT '' NOT NULL,
    to_ping TEXT,
    pinged TEXT,
    post_modified DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
    post_modified_gmt DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
    post_content_filtered LONGTEXT,
    post_parent BIGINT UNSIGNED DEFAULT 0 NOT NULL,
    guid VARCHAR(255) DEFAULT '' NOT NULL,
    menu_order INT DEFAULT 0 NOT NULL,
    post_type VARCHAR(20) DEFAULT 'post' NOT NULL,
    post_mime_type VARCHAR(100) DEFAULT '' NOT NULL,
    comment_count BIGINT DEFAULT 0 NOT NULL
);

-- Table des utilisateurs
CREATE TABLE IF NOT EXISTS wp_users (
    ID BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_login VARCHAR(60) DEFAULT '' NOT NULL,
    user_pass VARCHAR(255) DEFAULT '' NOT NULL,
    user_nicename VARCHAR(50) DEFAULT '' NOT NULL,
    user_email VARCHAR(100) DEFAULT '' NOT NULL,
    user_url VARCHAR(100) DEFAULT '' NOT NULL,
    user_registered DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
    user_activation_key VARCHAR(255) DEFAULT '' NOT NULL,
    user_status INT DEFAULT 0 NOT NULL,
    display_name VARCHAR(250) DEFAULT '' NOT NULL
);

-- Table des options
CREATE TABLE IF NOT EXISTS wp_options (
    option_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    option_name VARCHAR(191) DEFAULT '' NOT NULL,
    option_value LONGTEXT NOT NULL,
    autoload VARCHAR(20) DEFAULT 'yes' NOT NULL,
    UNIQUE KEY option_name (option_name)
);

-- Table des métadonnées utilisateurs
CREATE TABLE IF NOT EXISTS wp_usermeta (
    umeta_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED DEFAULT 0 NOT NULL,
    meta_key VARCHAR(255) DEFAULT NULL,
    meta_value LONGTEXT,
    KEY user_id (user_id),
    KEY meta_key (meta_key(191))
);

-- Table des métadonnées articles
CREATE TABLE IF NOT EXISTS wp_postmeta (
    meta_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    post_id BIGINT UNSIGNED DEFAULT 0 NOT NULL,
    meta_key VARCHAR(255) DEFAULT NULL,
    meta_value LONGTEXT,
    KEY post_id (post_id),
    KEY meta_key (meta_key(191))
);
