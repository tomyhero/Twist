create table tweet (
        tweet_id integer NOT NULL PRIMARY KEY,
        screen_name varchar(255) NOT NULL,
        lat double NOT NULL,
        lon double NOT NULL,
        text text NOT NULL,
        geohash varchar(255) NOT NULL,
        created_at datetime NOT NULL
);
