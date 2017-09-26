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


Start and end of field
select distinct(city) from station
where city REGEXP '[aieou]$'
  and  city REGEXP '^[aieou]'
  and lat_n > 0
  and long_w > 0
