# Week 1 Notes: Getting and Cleaning Data

## Obtaining Data Motivation

Purpose of the class is to both identify what tidy data looks like, and how one
can actually get there. Examples given include extracting data from multiple
structured environments, pulling raw data from a really complex flat data source,
or even importing data that it already nicely structured but in a format like
JSON.

Example Pipeline:

1. Raw Data
2. Processing Script
3. Tidy Data
4. Data Analysis
5. Data Communication

This course covers 1-3.

## Raw and Processed Data

> "Data are values of qualitative or quantitative variables, belonging to a set
> of items. -- Wikipedia"

Qualitative: Country of origin, sex, treatment
Quantitative: Height, weight, blood pressure

Raw: Original, hard to parse, needs processing
Processed: Ready for analysis, process is varied (merge, subset, transform, etc)

Nota bene: all steps should be recorded and reproducible.

## Components of Tidy Data

Four components to have at the end of cleaning data:

1. The Raw Data
2. A Tidy Dataset
3. A Code Book of each variable and its values, as contained in the tidy data
4. An explicit and exact recipe you used to go from number 1, to 2 & 3
 * Promotes Reproducibility
 * Allows data process checking

### 1. The Raw Data

Truly raw data:

1. Has not been processed through any software
2. Has no manipulated values
3. No data has been removed
4. The data has not been summarized in any way

### 2. A Tidy Dataset

1. Each column describes one variable
2. Each observation of that variable should be in a different row
3. One table for each "kind" of variable
4. Multiple tables must have an ID column

Helpful tips:

 * Include a header row with column names
 * Variables should have human-readable names: EmpID, NOT EID01
 * Data should generally be in one file per table

### 3. A Code Book

1. Information about variables (including units!) in the tidy Dataset
2. Choices about why data was included or chosen
3. Information about the study, dataset design, etc

This can be a Word or text file, with a section called "Study Design" describing
data collection, and a "Code Book" section describing variables and units.

### 4. The Recipe

1. Ideally, a script (e.g., R, Python) that performs the operation
 * The input is the raw data
 * The output, is the processed data
 * There should be no parameters in the script (i.e., no interaction required)

 If scripts cannot handle every part of the step, and there are manual
 steps required, then the "recipe" should include steps to reproduce the data
 preparation and tidying process. *GO OVERBOARD*

 The biggest research paper in favor of austerity was based on incorrect data
 and was later retracted?

## Downloading Files


## Reading Local Files


## Reading Excel Files


## Reading XML


## Reading JSON


## The data.table Package
