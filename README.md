# 🌌 Exoplanet Data Analysis with SQL and Power BI

This project explores a large dataset from the NASA Exoplanet Archive using SQL for data cleaning and Power BI for interactive visualization. It showcases my ability to handle real-world datasets, write complex SQL queries, and design compelling visual dashboards and reports. The purpose of this project is to answer the following research questions as well as explore the dataset to discover any interesting insights:

- What detection methods are most effective in terms of number of discovered planets?
- Which missions contributed the most discoveries?
- What are the properties of the commonly discovered exoplanets?
- How has the number and properties of discovered exoplanets changed over time?


---

## 📂 Dataset

- **Source**: [NASA Exoplanet Archive](https://exoplanetarchive.ipac.caltech.edu)
- **Format**: CSV
- **Contents**: 70+ columns covering planet mass, radius, orbital period, discovery method, discovery year, host star properties, etc.

---

## 🛠 Tools & Technologies

- **SQL (MySQL)**: Data importing, cleaning, transformation
- **Power BI**: Dashboard creation and data visualization
- **Python (optional)**: Used to aid data importing and previewing data
- **Git/GitHub**: Version control and documentation

---

## 🔍 Project Steps

1. **Data Importing**: Imported large CSV into MySQL using staging table and `LOAD DATA LOCAL INFILE`.
2. **Data Cleaning**: Parsed and normalized inconsistent values, renamed columns, converted types.
3. **Schema Design**: Created structured table with meaningful column names.
4. **Analysis**:
    - Filtered for confirmed exoplanets with no blank values
    - Analyzed trends in exoplanet properties over discovery years
    - Explored discoveries across different methods and facilities
    - Verified Kepler's third law and Radius vs. Mass trends in exoplanets
    - Compiled a histogram plot for exoplannet masses
    - Created views for each of these plots to be imported into Power BI
5. **Visualization**: Connected Power BI to MySQL to build interactive visualizations across three pages.

---

## 📈 Dashboard Highlights

Includes:
- Column charts of most successful discovery methods and facilities
- Rolling total table of discoveries
- Time series of exoplanet properties by year
- Histogram of planet masses
- Scatter plots for Kepler's third law and Radius vs. Mass
---

## 🚀 Insights

- The Transit method is by far the most successful method of discovering exoplanets, with most thee discoveries done by the Kepler facility
- The top 5 most successful facilities also mainly the Transit method for discoveries, with HATSouth being the most successful facility to
  use the Radial Velocity method
- There is a general trend of increasing exoplanet discoveries over the year, with spikes due to particular missions that launched during 
  that year
- In the time series, average planet mass, radius, and brightness decrease over time, which makes sense as better technology allows us 
  to discover smaller and fainter planets
- Average distance increases over the years for the same reason, although there are spikes in the data due to missions targeting
  exoplanets from a particular solar system that may be closer
- As expected, Kepler's Third Law, which states the orbital period squared is proportional to the semi-major axis cubed (T^2 = a^3) is verified
  in the scatter plot through a linear relationship
- The Radius vs. Mass scatter plot shows a general increase in planet radius with increasing mass, with a plateau at large masses indicating the 
  "Jupiter" size planets
- From the scatter plots, direct imaging can discovery only the largest planets that are furthest from their host star, while the transit method mainly
  reveals planets in the super-Earth/mini-Neptune region
- The mass histogram reveals the majority of discovered planets lie in the 1-10 Earth mass range, with very few planets above 1000 Earth masses

---

## 📁 Repository Structure
Exoplanet-Trends-Project/
├── README.md          # Overview, goals, insights
├── Scripts/
│   ├── data_analysis.sql
│   ├── data_cleaning.sql
│   └── data_importing.sql
│   └── data_importing_names.py
├── Data/
│   └── PSCompPars_2025.06.18_07.30.56.csv
│   └── raw_data_excel.xlsx
├── Visuals/
│   └── report_overview_screenshot.png
│   └── report_time_series_screenshot.png
│   └── report_properties_screenshot.png
├── exoplanet_report.pbix
---

## 📚 Credits

- [NASA Exoplanet Archive](https://exoplanetarchive.ipac.caltech.edu)
- [Power BI Desktop](https://powerbi.microsoft.com/)
- [MySQL Community Server](https://dev.mysql.com/downloads/mysql/)

---

## 👨‍💻 Author

Akshay Ramasubramanian – Physics Student | Aspiring Data Analyst | Astrophysics Enthusiast

📫 [https://www.linkedin.com/in/akshay-ram02/]