CREATE TABLE rangers (
    ranger_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );

SELECT * FROM rangers;
DROP TABLE rangers;

CREATE TABLE species (
    species_id SERIAL NOT NULL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(20) NOT NULL
);

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

SELECT * FROM species;
DROP TABLE species;


CREATE TABLE sightings (
    sighting_id SERIAL NOT NULL PRIMARY KEY,
    species_id INT,
    ranger_id INT,
    location VARCHAR(50) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes VARCHAR(50)
);

INSERT INTO
    sightings (
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

SELECT * FROM sightings;
DROP TABLE sightings






-- > Ans no 1: Register a new ranger with provided data.
INSERT INTO
    rangers (name, region)
VALUES ('Darek Fox', 'Coastal Plains');

SELECT * FROM rangers;




-- > Ans no 2: Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;




-- > Ans no 3: Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location = 'Snowfall Pass';





-- > Ans no 4: List each ranger's name and their total number of sightings.
SELECT name, COUNT(s.sighting_id) total_sightings
FROM rangers AS r
    JOIN sightings AS s ON r.ranger_id = s.ranger_id
GROUP BY
    name;





-- > Ans no 5: List species that have never been sighted.
SELECT common_name
FROM species AS sp
    LEFT JOIN sightings AS si ON si.species_id = sp.species_id
WHERE
    si.species_id IS NULL;





-- > Ans no 6: Show the most recent 2 sightings.
SELECT common_name, sighting_time, name
FROM
    species AS sp
    JOIN sightings AS si ON sp.species_id = si.species_id
    JOIN rangers AS r ON r.ranger_id = si.ranger_id
ORDER BY sighting_time DESC
LIMIT 2;





-- > Ans no 7: Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    EXTRACT(
        YEAR
        FROM discovery_date
    ) < '1800';






-- > Ans no 8: Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT
    sighting_id,
    CASE
        WHEN extract(
            HOUR
            FROM sighting_time
        ) < 12 THEN 'Morning'
        WHEN extract(
            HOUR
            FROM sighting_time
        ) BETWEEN 12 AND 17  THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;





-- > Ans no 9: Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE
    ranger_id NOT IN (
        SELECT DISTINCT
            ranger_id
        FROM sightings
    );




SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;