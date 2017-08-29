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


    select
        case
        when grade > 8 then
            s.name
        else
           'NULL'
        end,
    grade,
    s.marks as mark
    from students s,
    (select g.grade from grades g
       where mark between g.min_mark and g.max_mark) as grade


    #NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.




    select
        case
        when grade >= 8 then
            s.name
        else
           'NULL'
        end,
    grade,
    s.marks
    from students s join grades g
    on s.marks between g.min_mark and g.max_mark
    order by grade desc, s.name asc,
    case when grade <= 8 then s.marks end asc;
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


    select
        case
        when grade > 8 then
            s.name
        else
           'NULL'
        end,
    grade,
    s.marks as mark
    from students s,
    (select g.grade from grades g
       where mark between g.min_mark and g.max_mark) as grade


    #NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.




    select
        case
        when grade >= 8 then
            s.name
        else
           'NULL'
        end,
    grade,
    s.marks
    from students s join grades g
    on s.marks between g.min_mark and g.max_mark
    order by grade desc, s.name asc,
    case when grade <= 8 then s.marks end asc;
 as temp_count;

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


select
    case
    when grade > 8 then
        s.name
    else
       'NULL'
    end,
grade,
s.marks as mark
from students s,
(select g.grade from grades g
   where mark between g.min_mark and g.max_mark) as grade


#NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.




select
    case
    when grade >= 8 then
        s.name
    else
       'NULL'
    end,
grade,
s.marks
from students s join grades g
on s.marks between g.min_mark and g.max_mark
order by grade desc, s.name asc,
case when grade <= 8 then s.marks end asc;
