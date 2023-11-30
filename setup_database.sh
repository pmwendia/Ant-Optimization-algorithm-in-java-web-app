#!/bin/bash

# Connect to MySQL
mysql -u root -p -e "
# Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS mydb;

# Use the created database
USE mydb;

# Create the users table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id INT (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

# Create the history table if it doesn't exist
CREATE TABLE IF NOT EXISTS history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    query_date TIMESTAMP NOT NULL,
    query_type VARCHAR(255) NOT NULL,
    start_point VARCHAR(255) NOT NULL,
    end_point VARCHAR(255) NOT NULL,
    best_route TEXT NOT NULL,
    total_distance INT NOT NULL
);

"
