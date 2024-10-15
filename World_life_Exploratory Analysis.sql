# World Life Expectancy Project (Exploratory Data Analysis)

SELECT Country, MIN(`Life expectancy`), MAX(`Life expectancy`), 
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`), 1) AS Life_Increase_15_Years  #Minimum and maximum life expectancy trough 15 years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY Country ASC;


SELECT Year, ROUND(AVG(`Life expectancy`), 2)  #Average life expectancy for each year
FROM world_life_expectancy     
WHERE `Life expectancy` <> 0
AND `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year;


SELECT Country, ROUND(AVG(`Life expectancy`), 1) AS Life_Exp, ROUND(AVG(GDP), 1) AS GDP 
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp >0
AND GDP > 0
ORDER BY GDP ASC;

SELECT
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,  #Life expectancy vs GDP
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) High_GDP_Ex,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) Low_GDP_Ex
FROM world_life_expectancy;


SELECT Status, ROUND(AVG(`Life expectancy`), 1)
FROM world_life_expectancy
GROUP BY Status;                   # Status developing VS developed and their life expectancy

SELECT Status, COUNT(DISTINCT Country)
FROM world_life_expectancy
GROUP BY Status;                                                                                   # `Life expectancy`


SELECT Country, ROUND(AVG(`Life expectancy`), 1) AS Life_Exp, ROUND(AVG(BMI), 1) AS BMI   #Life expectancy VS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp >0  #high BMI more risks, overweight
AND BMI > 0
ORDER BY BMI DESC;

#How many people are dying each year comparing to life expectancy

SELECT Country, Year, `Life expectancy`, `Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
GROUP BY Country;
















