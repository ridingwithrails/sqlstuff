












    Select name order by last 3 letters.  Substring -means start at the end.
    select name
    from students where marks > 75
    order by substring(name, -3, 3) ASC, id ASC;

    Find sum with where condition
    select sum(c.population) pop
    from city c join country cty
    on c.countrycode = cty.code
    where cty.continent = 'ASIA'


    Find all cities in africa
    select c.name from
    city c join country cty on
    c.countrycode = cty.code
    where cty.continent = 'Africa'

    Floor (round down to nearest int)
    select cty.continent, floor(avg(c.population))
    from city c join country cty
    on c.countrycode = cty.code
    group by cty.continent





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




Select name order by last 3 letters.  Substring -means start at the end.
select name
from students where marks > 75
order by substring(name, -3, 3) ASC, id ASC;

Find sum with where condition
select sum(c.population) pop
from city c join country cty
on c.countrycode = cty.code
where cty.continent = 'ASIA'


Find all cities in africa
select c.name from
city c join country cty on
c.countrycode = cty.code
where cty.continent = 'Africa'

Floor (round down to nearest int)
select cty.continent, floor(avg(c.population))
from city c join country cty
on c.countrycode = cty.code
group by cty.continent

Map a value from a range on another table.
select s.id,  s.name, s.marks,
 (select g.grade from grades g
   where s.marks between g.min_mark and g.max_mark
 ) as grade
from students s
