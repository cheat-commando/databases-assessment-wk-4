CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(15),
    last_name VARCHAR(20),
    email VARCHAR(40),
    user_password VARCHAR(20),
    phone NUMERIC(10,0),
    user_address VARCHAR(100),
    age INT NOT NULL
)

CREATE TABLE species_breed (
    species_breed_id SERIAL PRIMARY KEY,
    gen_info TEXT
)

CREATE TABLE animals (
    animal_id SERIAL PRIMARY KEY,
    species_breed_id INT NOT NULL REFERENCES species_breed(species_breed_id),
    animal_name VARCHAR(20),
    age INT NOT NULL
    admittance_date DATE
)

CREATE TABLE conditions (
    condition_id SERIAL PRIMARY KEY,
    summary TEXT,
    resource_link VARCHAR(60)
)

CREATE TABLE animals_conditions (
    animals_conditions_id SERIAL PRIMARY KEY,
    animal_id INT NOT NULL REFERENCES animals(animal_id),
    condition_id INT NOT NULL REFERENCES conditions(condition_id),
    dx_date DATE
)

CREATE TABLE meets (
    meet_id SERIAL PRIMARY KEY,
    meet_date DATE,
    meet_time TIME,
    animal_id INT NOT NULL REFERENCES animals(animal_id),
    user_id INT NOT NULL REFERENCES users(user_id)
)

CREATE TABLE user_preferences (
    user_preference_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    species_breed_id INT NOT NULL REFERENCES species_breed(species_breed_id)
)
