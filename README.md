# Video-Game-Sales

Video Game Sales & Engagement Analysis Report
________________________________________
🔹 Problem Statement
The objective of this project is to analyze and visualize video game sales and user engagement data to uncover meaningful patterns in:
•	Game popularity 
•	User behavior 
•	Platform performance 
By integrating sales data with user engagement metrics (ratings, wishlists, plays, backlogs), the project aims to deliver actionable insights into:
•	How game attributes (genre, platform, developer) impact performance 
•	The relationship between user perception (ratings) and commercial success (sales) 
•	Trends that influence market demand and player engagement 
The data pipeline is structured using SQL for storage and transformation, while Power BI dashboards provide interactive visualizations to support decision-making for:
•	Game Developers 
•	Marketing Teams 
•	Publishers 
________________________________________
🔹 Business Use Cases
 1. Game Marketing Strategy
•	Identify high-performing genres and platforms to optimize marketing campaigns 
•	Analyze wishlist and rating trends to understand player interest before and after release 
•	Target regions based on genre preferences and sales patterns 
________________________________________
 2. Product Development
•	Evaluate how attributes like genre, developer (team), and ratings influence engagement and sales 
•	Identify features associated with successful games 
•	Support data-driven decisions in game design and content planning 
________________________________________
3. Sales Forecasting
•	Use historical data to predict future game demand 
•	Analyze how wishlist counts and ratings correlate with sales performance 
•	Detect seasonal or yearly market trends 
________________________________________
4. Resource Allocation
•	Focus development on high-growth platforms and genres 
•	Identify under-saturated markets with high engagement but low competition 
•	Optimize budget allocation for maximum ROI 
________________________________________
🔹 Approach
1. Data Cleaning & Preprocessing
•	Removed duplicate records to ensure data consistency 
•	Handled missing/null values in: 
o	Ratings 
o	Plays 
o	Sales 
•	Standardized: 
o	 Date formats (e.g., converting text to datetime) 
o	 Categorical values (Genre, Platform, Publisher) 
•	Converted textual metrics (e.g., “3.9K”) into numeric values 
________________________________________
 2. SQL Database Setup
•	Designed structured tables: 
o	Game Metadata Table (Title, Genre, Rating, Engagement metrics) 
o	Sales Table (Platform, Region-wise sales, Global sales) 
•	Created a merged dataset using joins for unified analysis 
•	Applied: 
o	Primary Keys 
o	Foreign Keys 
o	Constraints to maintain data integrity 
________________________________________
 3. Power BI Integration
•	Connected Power BI to the SQL database 
•	Imported cleaned and structured datasets 
•	Established relationships between tables for relational modeling 
•	Enabled dynamic filtering using: 
o	Slicers 
o	Drilldowns 
o	Cross-filtering 
________________________________________
 4. Data Visualization in Power BI
Developed interactive dashboards including:
•	 Bar Charts 
o	Top genres, platforms, publishers 
•	 Heatmaps 
o	Regional sales distribution by genre 
•	 Line Charts 
o	Sales and release trends over time 
•	 Scatter Plots 
o	Relationship between ratings, wishlist, and sales 
•	 KPI Indicators 
o	Average rating 
o	Total plays 
o	Top-performing genres 
________________________________________
 5. Exploratory Data Analysis (EDA)
Performed using Python (Pandas, Seaborn) and Power BI:
•	Analyzed: 
o	Ratings distribution 
o	Wishlist and backlog behavior 
o	Global and regional sales trends 
•	Explored: 
o	Genre popularity 
o	Platform lifecycle trends 
•	Identified: 
o	Key drivers of high-performing games 
o	Correlations between engagement and sales 
________________________________________
🔹 Key Insights (Example Findings)
•	 Action and Shooter genres dominate global sales 
•	RPG games show strong regional preference in Japan 
•	Higher-rated games generally show better sales performance, but not always 
•	 Wishlist trends indicate pre-release hype, moderately correlated with sales 
•	 Some genres show high engagement but lower monetization potential 
________________________________________
🔹 Conclusion
This project demonstrates how integrating sales and engagement data can provide a comprehensive view of the gaming market. By leveraging:
•	 SQL for structured data handling 
•	 Power BI for visualization 
•	 Python for analysis 
we can uncover actionable insights that support:
•	Strategic marketing 
•	Data-driven game development 
•	Accurate sales forecasting 
Ultimately, the analysis enables stakeholders to make informed decisions, improve player satisfaction, and maximize business performance in the gaming industry.

