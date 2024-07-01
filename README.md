# Covid19-Queries

# COVID-19 Queries in Ghana

## Project Description

This project aims to analyze the impact and spread of COVID-19 in Ghana using SQL queries. By leveraging data from the COVID-19 dataset, we seek to uncover insights into various aspects of the pandemic, including infection rates, death rates, and their correlation with the population. The analysis will help in understanding the trends and effects of COVID-19 in Ghana compared to other countries and continents.
General Data Query

SELECT * 
FROM covid19.coviddeathsdata
WHERE continent IS NOT NULL
ORDER BY 3,6;

## Variables Needed for Project
SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM covid19.coviddeathsdata
ORDER BY 2,3;

## Total Cases vs Total Deaths (Likelihood of dying from COVID in Ghana)

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercent
FROM covid19.coviddeathsdata
WHERE location LIKE '%Ghana%'
ORDER BY 1,2;

## Total Cases vs Population (Shows the number of population that got COVID in Ghana)

SELECT Location, date, population, total_cases, (total_cases/population)*100 AS AffecteddPercent
FROM covid19.coviddeathsdata
WHERE location LIKE '%Ghana%'
ORDER BY 1,2;

## Countries That Recorded Highest Infection Rate Compared to Their Population

SELECT Location, population, MAX(total_cases), MAX((total_cases/population))*100 AS AffecteddPercentPopulation
FROM covid19.coviddeathsdata
GROUP BY Location, population
ORDER BY AffecteddPercentPopulation DESC;

## Countries That Recorded Highest Death Rate Compared to Their Population

SELECT Location, 
MAX(cast(Total_Deaths as unsigned)) AS TotalDeathCount
FROM covid19.coviddeathsdata
WHERE continent IS NOT NULL
AND Location NOT IN ('Europe','North America', 'European Union','South America', 'Africa') 
GROUP BY Location
ORDER BY TotalDeathCount DESC;

## Continent That Recorded Highest Death Rate Compared to Their Population

SELECT continent, 
MAX(cast(Total_Deaths as unsigned)) AS TotalDeathCount
FROM covid19.coviddeathsdata
WHERE continent IS NOT NULL
AND Location NOT IN ('Europe','North America', 'European Union','South America', 'Africa') 
GROUP BY continent
ORDER BY TotalDeathCount DESC;

## Query to Select Locations in Ghana

SELECT Location
FROM covid19.coviddeathsdata
WHERE location LIKE '%Ghana'
