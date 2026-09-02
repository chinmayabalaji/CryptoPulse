create or replace procedure initialize_datawarehouse()
as $$
BEGIN

    -- Schema Creation
    CREATE SCHEMA IF NOT EXISTS Bronze;

    CREATE SCHEMA IF NOT EXISTS Silver;

    CREATE SCHEMA IF NOT EXISTS Gold;

    -- Table Creation
    CREATE TABLE IF NOT EXISTS Bronze.Exchanges (
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
        timestamp TIMESTAMP default CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS Silver.Exchanges (
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

    CREATE TABLE IF NOT EXISTS Gold.Exchanges (
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


END;
$$ LANGUAGE plpgsql;
