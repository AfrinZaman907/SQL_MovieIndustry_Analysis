create database Movie_Industry;
use Movie_Industry;
SELECT * FROM movie_industry;

/*Q.1.Top 10 ranking movies*/
select name, genre, score,votes,country,runtime,
Rank() over (Order By score DESC) as rnk
from movie_industry
limit 10;
 /*Q.2.Ranking movies countrywise*/
select name, genre,year, score,votes,country,
Rank() over (partition by country Order By score DESC) as rnk
from movie_industry;
/*Q.3.Comparing between score, votes, budget and rank */
select name, genre,score,votes,country, budget,
Rank() over (Order By score DESC) as rnk
from movie_industry
order by budget desc
limit 10;
/*Q.4.no of movies released in each year*/
Select year,count(*) as noofmovies
From movie_industry
group by year;
/*Q.4.How many movies were produced by each country in the each year ?*/
Select country, year,count(year) as noofmovies
From movie_industry
group by Year, country 
order by country asc;

/*Q.5.How many movies were produced in each country?*/
Select country, count(country) as noofmovies
From movie_industry
group by country 
order by noofmovies desc;
/*Q.6.top 10 movie were produces by each country*/
Select country, count(country) as noofmovies
From movie_industry
group by country 
order by noofmovies desc
limit 10;
/*Q.7.Find the unique list of the genres present in the data set and Which genre had the highest number of movies produced overall?*/
Select genre,count(genre) as MovieType
From movie_industry
group by genre;
/*Q.8.What is the average duration of movies in each genre?*/
Select genre, runtime, count(*) as Avgduration
From movie_industry
group by genre
order by genre asc;
/*Q.9.How many releases from each top 10 company?*/
select company, count(*) As CompanyMovies from movie_industry
group by company;
select company, count(*) As CompanyMovies from movie_industry
group by company
order by CompanyMovies desc
limit 10;
/*Q.10.Which production house has produced the most number of hit movies (average rating > 8)?*/
select score, company, count(name) As CompanyMovies 
from movie_industry
where score > 8 and company IS NOT NULL
group by company;
/*Q.11.How many movies released in each genre in each year in US and had more than 1,000 votes?*/
select genre, votes, country, count(name) AS movie_count
from movie_industry 
where country= 'united states' and votes>1000
group by genre;





