use MyPortfolio
select* from CovidDeaths
where continent is not null
order by 3,4

select* from CovidVaccinations$
order by 3,4

--Data We'll use

select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths
where continent is not null
order by 1,2

--Total Case vs Total Deaths (Death percentage)
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths
where continent is not null
order by 1,2

--Death Percentage in Nigeria
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as NigDeathPercentage
from CovidDeaths 
where continent is not null and location like '%Nigeria%'
order by 1,2

--Percentage of Cases in Nigeria by Population
select location, date, total_cases, population, (total_cases/population)*100 as PopDeathPercentage
from CovidDeaths 
where location like '%Nigeria%'
order by 1,2

--Percentage of Cases in the world by Population
select location, date, total_cases, population, (total_cases/population)*100 as WorldPopDeathPercentage
from CovidDeaths 
where continent is not null
order by 1,2

--Countries with highest cases compared to population (From Highest to Lowest)
select location,  population, Max(cast(total_cases as int)) as HighestInfectionCount, 
Max(total_cases/population)*100 as HighestInfectionPercentage
from CovidDeaths 
where continent is not null
Group by location, population
order by HighestInfectionPercentage desc

--Countries with the highest death count per population
select location, population, Max(cast(total_deaths as int)) as HighestDeathCount, 
Max(total_deaths/population)*100 as HighestDeathPercentage
from CovidDeaths 
where continent is not null
Group by location, population
order by HighestDeathPercentage desc

--Countries with the highest Total death count per population
select location, Max(cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths
where continent is not null
Group by location
order by TotalDeathCount desc

--Finding the total Death count by Continent
select continent, Max(cast(total_deaths as int)) as TotalDeathInCont
from CovidDeaths
where continent is not null
Group by continent
order by TotalDeathInCont desc

--Global Statitics
select date, Sum(new_cases) as TotalCases, sum(cast (new_deaths as int)) as TotalDeaths, sum(cast (new_deaths as int))/Sum(new_cases)*100 
as GlobalDeathPercentage
from CovidDeaths 
where continent is not null
Group by date
order by 1,2

--GlobalDeathPercentage
select Sum(new_cases) as TotalCases, sum(cast (new_deaths as int)) as TotalDeaths, sum(cast (new_deaths as int))/Sum(new_cases)*100 
as GlobalDeathPercentage
from CovidDeaths
where continent is not null
order by 1,2

select* from CovidVaccinations


--Joining CovidDeaths and Vaccinations
Select * 
from CovidDeaths d 
join CovidVaccinations v
	on d.location = v.location
	and d.date = v.date

--Total World Population vs Vaccinations 
Select d.continent, d.location, d.date, d.population, v.new_vaccinations 
from CovidDeaths d 
join CovidVaccinations v
	on d.location = v.location
	and d.date = v.date
where d.continent is not null
order by 2,3

--Total World Population vs Vaccinations 
Select d.continent, d.location, d.date, d.population, vee.new_vaccinations, 
sum(cast( vee.new_vaccinations as int )) OVER (Partition by d.location order by d.location, d.date)
from CovidDeaths d 
join CovidVaccinations vee
	on d.location = vee.location
	and d.date = vee.date
where d.continent is not null
order by 2,3


