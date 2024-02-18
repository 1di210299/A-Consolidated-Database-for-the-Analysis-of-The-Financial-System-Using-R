# A Consolidated Database for the Analysis of The Financial System Using R
# Central Reserve Bank of Peru - Financial Tracking Project

This repository contains the code and necessary files to carry out daily tracking of key variables in the Peruvian financial system using data from the Central Reserve Bank of Peru (BCRP).

## Project Description

The goal of this project is to create a consolidated database that allows us to track key variables of the Peruvian financial system on a daily basis, using data from the year 2023 available on the BCRP website. The process is divided into three main steps:

### Step 1: Download Information
In this stage, access is made to the BCRP's daily data section, and the following series for the entire year 2023 are downloaded in CSV format:
- Net international reserves
- Interbank interest rate S/.
- Yield of the Peruvian government bond at 10 years (in S/ and US$)
- Interbank Exchange Rate (S/ per US$) - Buying and Selling
- Lima Stock Exchange General Index BVL

### Step 2: Information Processing
Information processing is carried out following these steps:
- Creation of columns to indicate the year, month, and day, as well as a column with these values concatenated in the format dd-mm-yy.
- Conversion of all values to numerical format.
- Removal of missing values.
- Reduction of values to a maximum of two decimals.
- Renaming of variables following the snake_case format.
- Creation of a column for the average exchange rate between buying and selling.

### Step 3: Data Integration and Deliverables
A merge is performed by date between each processed series. Then, the mean, median, minimum value, and maximum value of each series per month are printed and exported to an Excel file. Additionally, a PDF dictionary is created with the names of the variables and their descriptions. Finally, the created file is exported in Excel format with the name "BBDD DB Financial".

## Folder Structure

- **data**: Contains the files in raw, intermediate, and final states.
- **programs**: Contains the script or notebook used for data processing.
- **results**: Contains the final deliverable in Excel format.

## Requirements

- Python 3.x
- Pandas
- Jupyter Notebook (optional, only if a notebook is used for processing)

## Usage Instructions

1. Download or clone this repository.
2. Execute the script/notebook located in the `programs` folder.
3. Review the results in the `results` folder.

## Contributions

Contributions are welcome. Feel free to open an issue or submit a pull request.

## References

- [Central Reserve Bank of Peru (BCRP)](https://www.bcrp.gob.pe/)

Thank you for contributing to the financial tracking of Peru!
