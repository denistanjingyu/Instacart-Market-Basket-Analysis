CREATE database project1;

SELECT * 
FROM project1.resultba2;

SELECT itemA, 
       itemB, 
       supportAB, 
       confidenceAtoB 
FROM project1.resultba2 
WHERE supportAB > 0.02
AND confidenceAtoB > 0.2
ORDER BY confidenceAtoB DESC;

SELECT itemA, 
       itemB, 
       supportAB, 
       confidenceAtoB 
FROM project1.resultba2 
WHERE supportAB > 0
AND confidenceAtoB > 0 
AND itemA = "Coconut Chia Bar"
ORDER BY confidenceAtoB DESC;

CREATE VIEW CartItems1(itemA, 
                       itemB, 
                       supportAB, 
                       confidenceAtoB) AS 
SELECT itemA, 
       itemB, 
       supportAB, 
       confidenceAtoB 
FROM project1.resultba2 
WHERE supportAB > 0
AND confidenceAtoB > 0 
AND itemA = "Coconut Chia Bar" 
OR itemA = "Chocolate Sea Salt" 
OR itemA = "Peanut Butter Bar"
ORDER BY confidenceAtoB DESC;

SELECT * 
FROM CartItems1 
WHERE itemB != "Coconut Chia Bar" 
AND itemB != "Chocolate Sea Salt" 
AND itemB != "Chocolate Peanut Butter"
ORDER BY confidenceAtoB DESC 
LIMIT 3;
