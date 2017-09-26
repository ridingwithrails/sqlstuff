#NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.


Map a value from a range on another table.
select s.id,  s.name, s.marks,
 (select g.grade from grades g
   where s.marks between g.min_mark and g.max_mark
 ) as grade
from students s

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


Select name order by last 3 letters.  Substring -means start at the end.
select name
from students where marks > 75
order by substring(name, -3, 3) ASC, id ASC;
