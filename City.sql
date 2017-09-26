Find the repeated number of cities
select(
    (select count(city) from station) -
    (select count(distinct(city)) from station)
    Find the repeated number of cities
    select(
        (select count(city) from station) -
        (select count(distinct(city)) from station)
    ) as temp_count;

    Find city and number of chars in city name, order them by big to small.
    select city, char_length(city) as size from station order by city DESC;

    MIN MAX
    select city, max(char_length(city)) as size
    from station
    group by city
    order by size DESC
    limit 1
    ;
    select city, min(char_length(city)) as size
    from station
    group by city
    order by size ASC
    limit 1
    ;

    City begins with vowel
    select distinct(city) from station where city REGEXP '^[aieou]';
    City begins with vowel and consditions.
    select distinct(city) from station where city REGEXP '^[aieou]' and lat_n > 0 and long_w > 0
    City ends with vowel.
    select distinct(city) from station where city REGEXP '[aieou]$' and lat_n > 0 and long_w > 0


    Start and end of field
    select distinct(city) from station
    where city REGEXP '[aieou]$'
      and  city REGEXP '^[aieou]'
      and lat_n > 0
      and long_w > 0

    City does not start with vowels.
      select distinct(city) from station where city REGEXP '^[^aieou]';

    City does not end with vowels.
      select distinct(city) from station where city REGEXP '[^aieou]$';

    City either not vowel start or not vowel end.
    select distinct(city) from station
    where (city REGEXP '[^aieou]$'
      or  city REGEXP '^[^aieou]' )
      and lat_n > 0
      and long_w > 0
      order by city

    City either not vowel start and not vowel end.
      select distinct(city) from station
    where city REGEXP '[^aieou]$'
      and  city REGEXP '^[^aieou]'
      and lat_n > 0
      and long_w > 0
      order by city
