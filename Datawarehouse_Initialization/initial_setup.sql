-- Database Creation
CREATE DATABASE IF NOT EXISTS crypto_db;

-- Schema Creation
CREATE SCHEMA IF NOT EXISTS crypto_db.Bronze;

CREATE SCHEMA IF NOT EXISTS crypto_db.Silver;

CREATE SCHEMA IF NOT EXISTS crypto_db.Gold;

-- Table Creation
CREATE TABLE IF NOT EXISTS crypto_db.Bronze.Exchanges (
    batch_id VARCHAR(20) NOT NULL,
    id VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    year_established INT,
    country VARCHAR(100),
    description TEXT,
    url VARCHAR(255),
    image VARCHAR(255),
    has_trading_incentive BOOLEAN,
    trust_score INT,
    trust_score_rank INT,
    trade_volume_24h_btc FLOAT,
    trade_volume_24h_btc_normalized FLOAT,
    timestamp TIMESTAMP default CURRENT_TIMESTAMP,
);

CREATE TABLE IF NOT EXISTS crypto_db.Silver.Exchanges (
    batch_id VARCHAR(20) NOT NULL,
    id VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    year_established INT,
    country VARCHAR(100),
    description TEXT,
    url VARCHAR(255),
    image VARCHAR(255),
    has_trading_incentive BOOLEAN,
    trust_score INT,
    trust_score_rank INT,
    trade_volume_24h_btc FLOAT,
    trade_volume_24h_btc_normalized FLOAT,
    timestamp TIMESTAMP default CURRENT_TIMESTAMP,
    row_effective_start_time TIMESTAMP,
    row_effective_end_time TIMESTAMP,
    active_flag BOOLEAN
);

CREATE TABLE IF NOT EXISTS crypto_db.Gold.Exchanges (
    batch_id VARCHAR(20) NOT NULL,
    id VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    year_established INT,
    country VARCHAR(100),
    description TEXT,
    url VARCHAR(255),
    image VARCHAR(255),
    has_trading_incentive BOOLEAN,
    trust_score INT,
    trust_score_rank INT,
    trade_volume_24h_btc FLOAT,
    trade_volume_24h_btc_normalized FLOAT,
    timestamp TIMESTAMP default CURRENT_TIMESTAMP,
    row_effective_start_time TIMESTAMP,
    row_effective_end_time TIMESTAMP,
    active_flag BOOLEAN
);