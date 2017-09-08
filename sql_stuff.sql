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


/*
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/

select h.hacker_id, h.name from (
  -- Must not use aliases in count it does not work
  -- alias challenge_count can be accessed outside of sub query
select s.hacker_id as hid, count(*) as challenge_count from submissions s
    join challenges c on s.challenge_id = c.challenge_id
    join difficulty d on c.difficulty_level = d.difficulty_level
    where d.score = s.score
    group by hid
    having challenge_count > 1)
as t
join hackers h on hid = h.hacker_id
order by challenge_count desc, hid asc

/*
https://www.hackerrank.com/challenges/harry-potter-and-wands
The **minimum number*** of gold galleons needed to buy each **non-evil wand*** of ***high power and age***
Print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power.

If more than one wand has same power, sort the result in order of descending age.

*/

select w.id, wp.age as age , w.coins_needed, w.code, w.power as power
  from wands w
  join wands_property wp
    on w.code = wp.code
  where wp.is_evil = 0
  order by wp.age desc, w.power asc

-- Find distinct age and cn and power
select distinct(cn), age, power from (select w.id, wp.age as age , w.coins_needed as cn, w.code, w.power as power
  from wands w
  join wands_property wp
    on w.code = wp.code
  where wp.is_evil = 0
  order by wp.age desc, w.power asc) as flat
  group by cn


select w.id as id, wp.age as age , w.coins_needed as cn, w.code as code, w.power as power
  from wands w
  join wands_property wp
    on w.code = wp.code
    where wp.is_evil = 0  AND coins_needed
  order by wp.age desc, w.power asc
) as flat
group by age, power
order by age

---------
Answer

select w.id, p.age, w.coins_needed, w.power
from Wands as w
join Wands_Property as p on (w.code = p.code)
where p.is_evil = 0 and w.coins_needed =
  (select min(coins_needed)
    from Wands as w1
    join Wands_Property as p1
      on (w1.code = p1.code)
    where w1.power = w.power and p1.age = p.age)
    order by w.power desc, p.age desc
