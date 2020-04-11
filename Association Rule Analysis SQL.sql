Create database project1;

select* from project1.resultba2;


select itemA, itemB, supportAB, confidenceAtoB from project1.resultba2 where supportAB> 0.02
 and confidenceAtoB > 0.2
 order by confidenceAtoB desc;

select itemA, itemB, supportAB, confidenceAtoB from project1.resultba2 where supportAB> 0
 and confidenceAtoB > 0 and itemA= "Coconut Chia Bar"
 order by confidenceAtoB desc;

create view CartItems1( itemA, itemB, supportAB, confidenceAtoB)
as select itemA, itemB, supportAB, confidenceAtoB from project1.resultba2 where supportAB> 0
 and confidenceAtoB > 0 and itemA= "Coconut Chia Bar" or itemA =  "Chocolate Sea Salt" or itemA= "Peanut Butter Bar"
 order by confidenceAtoB desc;

select* from CartItems1 where itemB != "Coconut Chia Bar" and itemB !=  "Chocolate Sea Salt" and itemB != "Chocolate Peanut Butter"
order by confidenceAtoB desc limit 3;

