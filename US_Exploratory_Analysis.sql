# US Household Income Exploratory Data Analysis

SELECT * 
FROM us_project.us_household_income;

SELECT * 
FROM us_project.us_household_income_statistics;

# states with sum of waters and lands
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC;

# average income and median income by state
SELECT u.State_Name, ROUND(AVG( Mean), 1) , ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
ON u.id = us.id
WHERE Mean <> 0 
GROUP BY u.State_Name
ORDER BY 2;

#average income by states and cities
SELECT u.State_Name, ROUND(AVG( Mean), 1) , City
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG( Mean), 1) DESC;








