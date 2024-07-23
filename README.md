# visual-data-analysis
Visual analysis of a database in PowerBI, querying and orchestrating data upfront using SQL and Azure Synapse Analytics

This repository contains:
- The SQL query used to create necessary views and the fact table;
- A documentation file outlining the main steps taken before reaching the visual analysis part in PowerBI, and
- The full report in PowerBI.
Some other files which are not necessary in order to view the report, and thus not included here but prerequisite for me to make the report are: images for background and logos, .drawio files for my database schema and .json file for custom theme used in the report.

The project entails manipulating with data using T-SQL, cloud orchestration using Azure Synapse Analytics and a detailed visual analysis using PowerBI. The softwares used are:
1. SQL Server Management Studio
In order to seamlessly transfer the data to the cloud, I needed to check for data quality and consistency, make sure the primary and foreign keys are well noted and there are no 
- Creating a server hosted on a local machine, connecting to it and importing the data in SQL Server Management Studio;
- Cleaning up the database, checking for and filling any missing values;
- Querying a fact table for database schema organization, and
- Changing the column types in order to match the accepted types in Azure Synapse.
2. Azure Synapse Analytics
After creating a very detailed database schema for my area of analysis, I proceeded to importing the data in Synapse Analytics. Even though there is a straightforward process using the built-in copy task, I was tasked with creating a custom pipeline that searches for and imports the tables from the database manually one-by-one. In order to achieve this, naturally, I had to setup the whole environment by:
- Creating a data lake, linking the SQL server on my local machine, and
- Creating a pipeline that uses activities to look for, iterate over a list of tables from my local SQL server and then use a copy activity to copy the full content of the necessary tables for this analysis.
3. PowerBI
After all preprocessing and orchestration, it was time to make the final report. What I did:
- Imported the data by logging on to the Azure Synapse Analytics portal in PowerBI using my credentials;
- Checked for any irregularities regarding the column types and values;
- Checked if the database schema is recognized correctly by PowerBI and fixing a few issues;
- Created a date table and connected it to the fact table;
- Created various visuals to represent basic sums and averages;
- Created a measure table to store all the measures for complicated calculations;
- Where absolutely necessary, created calculated columns in order to avoid aggregations for filtering in measures;
- After calculating everything that was required, I created a template page to design the layout of the report in order to ensure consistency when viewing;
- Created slicers for filtering the data by key dimensions;
- Showed the basic metrics on the top of the page for easy access;
- Created reset and back buttons using bookmarks in order for the user to be able to reset every filter and go back;
- Chose appropriate visuals for showing the data as it is and conveying the most information possible;
- Employed advanced techniques such as drill-through and dynamic text to show the analysis for every subcategory of products in a separate page, having the title of the page update on the drill-through value;
- And finally checked if everything performs as it should, editing interactions so that visuals are not filtered by dimensions that do not give added value to the report.
