/*
Qestion: What are the top skills based on salary?
— Look at the average salary associated with each skill for Data Analyst positions
— Focuses on roles with specified salaries, regardless of location
— Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/


SELECT 
	skills,
	AVG(salary_year_avg) avg_salary
FROM 
	job_postings_fact
INNER JOIN 
	skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
	skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where 
	job_title_short = 'Data Analyst' and
	salary_year_avg is not null and
	job_work_from_home = true
GROUP BY skills
ORDER BY avg_salary DESC
limit 25;

/* 
Insights: 
Data analysts with skills in big data (like pyspark), automation (like datarobot), and
strong DevOps/CI-CD integration are among the top earners. Mastery of the Python ecosystem and
knowledge of modern AI/NLP tools can significantly boost your salary potential.
*/