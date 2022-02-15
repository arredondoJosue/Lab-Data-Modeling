CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(500) NOT NULL,
    created TIMESTAMP NOT NULL
);

CREATE TABLE recipe(
    recipe_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    instructions VARCHAR(500) NOT NULL,
    created TIMESTAMP NOT NULL,
    IsPublic BOOLEAN NOT NULL
);

CREATE TABLE ingredients(
    ingredient_id SERIAL PRIMARY KEY,
    name VARCHAR(75) NOT NULL
);

CREATE TABLE grocery_list(
    grocery_list_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    created TIMESTAMP NOT NULL,
    status enum ('to_get', 'purchased') default 'to_get'
);

CREATE TABLE occasion (
    occasion_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    occasion VARCHAR(200)
);



CREATE TABLE recipe_ingredients(
    id SERIAL PRIMARY KEY,
    recipe_id INT NOT NULL REFERENCES recipe(recipe_id),
    ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
    amount VARCHAR(50)
);


CREATE TABLE grocery_list_ingredients(
    id SERIAL PRIMARY KEY,
    grocery_list_id INT NOT NULL REFERENCES grocery_list(grocery_list_id),
    ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
    amount VARCHAR(50)
);


CREATE TABLE occasions_recipes(
    id SERIAL PRIMARY KEY,
    occasion_id INT NOT NULL REFERENCES occasion(occasion_id),
    recipe_id INT NOT NULL REFERENCES recipe(recipe_id)
);