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
