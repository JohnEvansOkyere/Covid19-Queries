-- COVID 19 QUERRIES IN GHANA


SELECT * 
FROM covid19.coviddeathsdata
WHERE continent IS NOT NULL
ORDER BY 3,6;

-- SELECT *
-- FROM covid19.covidvaccinationdata
-- ORDER BY 3,4;

-- Variables nedded for project

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM  covid19.coviddeathsdata
ORDER BY 2,3;

-- querrying Total Cases vs Total Deaths
-- Likelyhood of dying from Covid in Ghana

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercent
FROM  covid19.coviddeathsdata
WHERE location LIKE '%Ghana%'
ORDER BY 1,2;

-- Qurrying Total Cases vs Population
-- Shows the number of population got covid in Ghana
SELECT Location, date, population, total_cases, (total_cases/population)*100 AS AffecteddPercent
FROM  covid19.coviddeathsdata
WHERE location LIKE '%Ghana%'
ORDER BY 1,2;

-- Countries That Recorded Highest Infection Rate Compared to Their Population
SELECT Location, population, MAX(total_cases), MAX((total_cases/population))*100 AS AffecteddPercentPopulation
FROM  covid19.coviddeathsdata
-- WHERE location LIKE '%Ghana%'
GROUP BY Location, population
ORDER BY AffecteddPercentPopulation DESC;

-- Countries That Recorded Highest Death Rate Compared to Their Population
SELECT Location, 
MAX(cast(Total_Deaths as unsigned)) AS TotalDeathCount
FROM  covid19.coviddeathsdata
WHERE continent IS NOT NULL
AND Location NOT IN ('Europe','North America', 'European Union','South America', 'Africa') 
-- WHERE location LIKE '%Ghana%'
GROUP BY Location
ORDER BY TotalDeathCount DESC;

-- Continent That Recorded Highest Death Rate Compared to Their Population
SELECT continent, 
MAX(cast(Total_Deaths as unsigned)) AS TotalDeathCount
FROM  covid19.coviddeathsdata
WHERE continent IS NOT NULL
AND Location NOT IN ('Europe','North America', 'European Union','South America', 'Africa') 
-- WHERE location LIKE '%Ghana%'
GROUP BY continent
ORDER BY TotalDeathCount DESC;

SELECT Location, 
FROM  covid19.coviddeathsdata
WHERE location LIKE '%Ghana'