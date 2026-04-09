# **Environmental Data Science Capstone Project – Yale University**


## Examining Habitat Integrity, Land Use, and the Value of the African Parks Network for at Risk Migratory Bird Species Across the African Continent


# **<span style="text-decoration:underline;">Background</span>**

African Parks (AP) is a non-profit conservation organization and NGO that takes on responsibility for the long-term management of protected areas in partnership with governments and local communities.<sup>1</sup> African Parks manages 26 protected areas in 13 countries covering over 20 million hectares in Angola, Benin, Central African Republic, Chad, the Democratic Republic of Congo, Ethiopia, Malawi, Mozambique, the Republic of Congo, South Sudan, Rwanda, Zambia and Zimbabwe.<sup>1</sup> 

The goal of this project is to examine the value of the AP network of protected land for at-risk migratory bird species across the African continent. Migratory species were chosen as a focus because they are facing increased pressures due to habitat loss, climate change, pollution and illegal hunting activities. This makes compiling information on how they utilize their range, when they are moving across the landscape, and how much of their range is protected especially valuable. This information provides a basis for more targeted surveys on these at risk species within our parks and helps us prioritize them in land management decisions.<sup>2</sup>   

This project mainly focuses on long term habitat integrity for migratory bird species in Africa. While habitat loss exacerbates extinction risk for any species, migratory species are often more seriously impacted due to their reliance on both long term habitat (in breeding and non-breeding/over-wintering areas), and short term habitat (stop over points). Habitat loss throughout the migration path may result in reductions in population size and fecundity due to increased impact of density-dependent factors such as disease, intraspecific competition, and predation.<sup>3</sup> Loss or degradation of suitable stopover habitat during their passage between breeding and non-breeding habitat can also lead to more birds dying enroute, and have serious impacts on nesting success when or if the birds do reach their breeding grounds.<sup>4</sup> Often times, birds in transit to breeding habitat already face time constraints to reach their destination, establish territory, mate, and hatch and raise young.<sup>4</sup> If a bird arrives late, or in poor health/condition, it can significantly impact their ability reproduce successfully.<sup>4</sup> Lastly, disturbance or destruction of breeding habitat during nesting season can lead to nests being abandoned.<sup>5</sup> All of these factors contribute to significant population declines among these migratory species.

Four migratory species that occur within AP parks were selected for this project:
* Steppe Eagle (*Aquila nipalensis*) - Endangered
* Malagasy Pond Heron (*Ardeola idae*) - Endangered
* Rüppell's Vulture (*Gyps rueppellii*) - Critically Endangered
* Egyptian Vulture (*Neophron percnopterus*) - Endangered




# **<span style="text-decoration:underline;">Data Sources</span>**

Data for this project was acquired from the following sources. Some sources used do not allow for raw data to be published publicly, others are too large to be uploaded to GitHub in their entirety. Small, synthetic datasets and/or associated meta data and data dictionaries have been supplied in these cases.


## **Africa Polygon**



* [https://geoportal.icpac.net/layers/geonode%3Aafr_g2014_2013_0#more](https://geoportal.icpac.net/layers/geonode%3Aafr_g2014_2013_0#more)
* Acquired from Intergovernmental Authority on Development (IGAD)’s Climate Predictions and Applications Centre (ICPAC)


## **World Countries Polygon**



* [https://hub.arcgis.com/datasets/esri::world-countries/about](https://hub.arcgis.com/datasets/esri::world-countries/about)


## **WDPA Data**



* [https://www.protectedplanet.net/en](https://www.protectedplanet.net/en)
* <span style="text-decoration:underline;">Europe, Africa, Asia & Pacific</span>
    * UNEP-WCMC and IUCN (2026), Protected Planet: The World Database on Protected Areas (WDPA) and World Database on Other Effective Area-based Conservation Measures (WD-OECM) [Online], January 2026, Cambridge, UK: UNEP-WCMC and IUCN. Available at: [www.protectedplanet.net](http://www.protectedplanet.net).
    * Each continent/region was downloaded separately 
        * **Africa –** [https://www.protectedplanet.net/region/AF](https://www.protectedplanet.net/region/AF)
        * **Europe –** [https://www.protectedplanet.net/region/EU](https://www.protectedplanet.net/region/EU)
        * **Asia & Pacific –** [https://www.protectedplanet.net/region/AS](https://www.protectedplanet.net/region/AS)


## **BirdLife Range Data**



* [https://datazone.birdlife.org/contact-us/request-our-data](https://datazone.birdlife.org/contact-us/request-our-data)
* Acquired through BirdLife’s data request form


## **BirdLife Bird Species List**



* [https://datazone.birdlife.org/search](https://datazone.birdlife.org/search)
* Common name and IUCN classification data for species was obtained from BirdLife (via the download option on their search page) to be paired with GBIF observation data
    * redlistCategory:
        * NE = Not Evaluated
        * DD = Data Deficient
        * LC = Least Concern
        * NT = Near Threatened
        * VU = Vulnerable
        * EN = Endangered
        * CR = Critically Endangered


## **Important Bird Areas (IBAs) Site Boundaries**



* [https://datazone.birdlife.org/contact-us/request-our-data](https://datazone.birdlife.org/contact-us/request-our-data) 
* Acquired through BirdLife’s data request form


## **All GBIF Data**
* Occurrence data gathered largely from citizen science platforms (like GBIF) tends to be biased towards charasmatic and beautiful species, especially with birds, because charasmatic species are more likely to be around people and beautiful species are more likely to be reported on by citizen scientists 


## **GBIF Data - All Bird Observations in Countries in Which AP Manages Land (2015-2025)**



* [https://www.gbif.org/](https://www.gbif.org/)
    * [https://www.gbif.org/occurrence/search?occurrence_status=present&q=](https://www.gbif.org/occurrence/search?occurrence_status=present&q=) 
    * <span style="text-decoration:underline;">Filters:</span>
        * *Scientific name* = 
            * Aves
        * *Basis of record* = 
            * Observation
            * Machine Observation
            * Human Observation
            * Material sample
            * Living Specimen
            * Occurrence evidence
        * *Year* =
            * 2015 - 2025
        * *Location* =
            * Including coordinates
        * *Country or area* =
            * Angola
            * Benin
            * Central African Republic
            * Chad
            * Congo
            * Congo, Democratic Republic of the
            * Ethiopia
            * Malawi
            * Mozambique
            * Rwanda
            * South Sudan
            * Zambia
            * Zimbabwe
* Bird Occurrences in Rwanda, South Sudan, Zambia, CAR, Chad, Ethiopia, DRC, Angola, Malawi, Zimbabwe, Congo, and Benin w/ coordinates (2015 - 2025)
    * GBIF.org (16 January 2026) GBIF Occurrence Download [https://doi.org/10.15468/dl.c8n4h3](https://doi.org/10.15468/dl.c8n4h3)


## **GBIF Data - All Observations of Steppe Eagle (*Aquila nipalensis*) w/in Africa (2000-2026)**



* [https://www.gbif.org/](https://www.gbif.org/)
    * [https://www.gbif.org/occurrence/search?occurrence_status=present&q=](https://www.gbif.org/occurrence/search?occurrence_status=present&q=) 
    * <span style="text-decoration:underline;">Filters:</span>
        * *Scientific name* = 
            * Aquila nipalensis Hodgson, 1833
        * *Basis of record* = 
            * Observation
            * Machine Observation
            * Human Observation
            * Material sample
            * Living Specimen
            * Occurrence
        * *Year* =
            * Between start of 2000 and end of 2026
        * *Location* =
            * Including coordinates
* GBIF.org (23 March 2026) GBIF Occurrence Download [https://doi.org/10.15468/dl.hexg6d](https://doi.org/10.15468/dl.hexg6d) 


## **GBIF Data - All Observations of Malagasy Pond Heron (*Ardeola idae*) w/in Africa (2000-2026)**



* [https://www.gbif.org/](https://www.gbif.org/)
    * [https://www.gbif.org/occurrence/search?occurrence_status=present&q=](https://www.gbif.org/occurrence/search?occurrence_status=present&q=) 
    * <span style="text-decoration:underline;">Filters:</span>
        * *Scientific name* = 
            * Ardeola idae (Hartlaub, 1860)
        * *Basis of record* = 
            * Observation
            * Machine Observation
            * Human Observation
            * Material sample
            * Living Specimen
            * Occurrence evidence
        * *Year* =
            * Between start of 2000 and end of 2026
        * *Location* =
            * Including coordinates
* GBIF.org (23 March 2026) GBIF Occurrence Download [https://doi.org/10.15468/dl.vfmq7f](https://doi.org/10.15468/dl.vfmq7f)  


## **GBIF Data - All Observations of Rüppell's Vulture (*Gyps rueppellii*) w/in Africa (2000-2026)**



* [https://www.gbif.org/](https://www.gbif.org/)
    * [https://www.gbif.org/occurrence/search?occurrence_status=present&q=](https://www.gbif.org/occurrence/search?occurrence_status=present&q=) 
    * <span style="text-decoration:underline;">Filters:</span>
        * *Scientific name* = 
            * Gyps rueppellii (A.E.Brehm, 1852)
        * *Basis of record* = 
            * Observation
            * Machine Observation
            * Human Observation
            * Material sample
            * Living Specimen
            * Occurrence evidence
        * *Year* =
            * Between start of 2000 and end of 2026
        * *Location* =
            * Including coordinates
* GBIF.org (23 March 2026) GBIF Occurrence Download [https://doi.org/10.15468/dl.twgsxm](https://doi.org/10.15468/dl.twgsxm)  


## **GBIF Data - All Observations of Egyptian Vulture (*Neophron percnopterus*) w/in Africa (2000-2026)**



* [https://www.gbif.org/](https://www.gbif.org/)
    * [https://www.gbif.org/occurrence/search?occurrence_status=present&q=](https://www.gbif.org/occurrence/search?occurrence_status=present&q=) 
    * <span style="text-decoration:underline;">Filters:</span>
        * *Scientific name* = 
            * Neophron percnopterus (Linnaeus, 1758)
        * *Basis of record* = 
            * Observation
            * Machine Observation
            * Human Observation
            * Material sample
            * Living Specimen
            * Occurrence evidence
        * *Year* =
            * Between start of 2000 and end of 2026
        * *Location* =
            * Including coordinates
* GBIF.org (23 March 2026) GBIF Occurrence Download [https://doi.org/10.15468/dl.xcb2g8](https://doi.org/10.15468/dl.xcb2g8) 

# **<span style="text-decoration:underline;">Workflow</span>**


## **World Database on Protected Areas (WDPA)**



* **Goal:**
    * Compile geospatial data for protected land throughout the range of African migratory birds
        * Most migratory birds native to Africa utilize land across Africa, Europe, and Asia
* Download Africa, Europe, Asia, & Pacific WDPA data from [https://www.protectedplanet.net/en](https://www.protectedplanet.net/en) as specified in the Data Sources section
* **Run WDPA_data_manip R script:**
* Ingests data
    * WDPA data downloads in three separate pieces for each region
    * Each piece consists of a points file and a polygon file
    * Only the polygon file is ingested for this analysis
* Investigates data for missing values
* Filters for needed columns to make the size of the datasets more manageable
    * SITE_ID, SITE_PID, SITE_TYPE, NAME_ENG, DESIG_ENG, DESIG_TYPE, REP_AREA, geometry
* Joins the three pieces for each region into one shape file for each region
* Selects rows from the Africa cumulative shape file that correspond to sites managed by African Parks (AP) using SITE_ID
    * '862', '2337', '555583110', '4106', '802', '1371', '555583108', '555781120', '555622048', '13704', '1083', '347', '1085', '1084', '1089', '2316', '2319', '33157', '1107', '2318', '9148', '555555585', '2253', '555781119', '12201', '641'
* Exports 3 shape files:
    * wdpa_eu.shp → contains all of the WDPA areas in Europe 
    * wdpa_asia_pacific.shp → contains all of the WDPA areas in Asia & the Pacific
    * wdpa_africa.shp → contains all of the WDPA areas in Africa in one shape file
    * wdpa_ap.shp → contains only the areas managed by African Parks


## **Global Biodiversity Information Facility (GBIF) Bird Occurrence Data**



* **Goals:** 
    * Compile data of all bird occurrences (and their accompanying geospatial data) recorded on GBIF that fall within land managed by African Parks
    * Compile a list of all bird species that occur on land managed by African Parks
*  Download data via the GBIF occurrence search with the filters detailed in the Data Sources section
* **Run bird_occ_manip R script:**
* Ingests data
* Examines data
* Filters for needed columns to make the size of the dataset more manageable
* Filters out observations where scientific name was not determined
* Filters out observations where date is not recorded
* Investigates cleaned dataset for missing values
* Create and export csv with only the 'issue' column to be processed in python
    * **Run bird_issues_list python script:**
    * Separates each entry in the issue column
        * Issues for each observation in the original data set are listed together in the issues column with a semicolon (;) as a delimiter
    * Generates a list of unique entries
    * Exports a csv (allBirdIssues) containing the list of unique issues present in the dataset 
* Check issue documentation from GBIF and select what issues are unwanted in the dataset
    * [https://techdocs.gbif.org/en/data-use/occurrence-issues-and-flags](https://techdocs.gbif.org/en/data-use/occurrence-issues-and-flags)
    * [https://gbif.github.io/gbif-api/apidocs/org/gbif/api/vocabulary/OccurrenceIssue.html](https://gbif.github.io/gbif-api/apidocs/org/gbif/api/vocabulary/OccurrenceIssue.html) 
* Remove observations with unwanted issues in R
    * RECORDED_DATE_INVALID
    * CONTINENT_COORDINATE_MISMATCH
    * TAXON_MATCH_HIGHERRANK
* Export the cleaned csv (afbirds_obs.csv)
* **Further process data in qGIS:**
* Convert the afbirds_obs.csv to a shape file
    * Helpful tutorial – [https://docs.geopard.tech/geopard-tutorials/gis-quick-hints/qgis-convert-csv-to-shp](https://docs.geopard.tech/geopard-tutorials/gis-quick-hints/qgis-convert-csv-to-shp) 
    * Export the shape file if desired
* Load the wdpa_ap.shp
* Crop bird observation data to AP polygons and export selected features to a new layer
    * Vector > Geoprocessing tools > Clip
* Export the clipped layer as a shape file
* Export the attribute table of the clipped layer as a csv
    * Helpful tutorial – [https://mapscaping.com/attribute-table-to-excel-in-qgis/](https://mapscaping.com/attribute-table-to-excel-in-qgis/) 


## **GBIF Data Cont. & BirdLife Bird Species List Data**



* **Goals:** 
    * Create a list of all recorded bird species that occur in AP
    * Add migration status, IUCN status, and common names to the list of AP birds
* Download species list from BirdLife using their data request form ([https://datazone.birdlife.org/contact-us/request-our-data](https://datazone.birdlife.org/contact-us/request-our-data))
* **Run ap_birds_list R script:**
* Ingests data
* Examine data for number of occurrences for each species
* Remove species with only one occurrence
* Add BirdLife data
    * Scientific name
    * Family
    * RL Category
    * Migratory status
    * Current population trend
* Export ap_bird_list.csv
* **Manually finish data entry for missing info:**
    * Enter data for rows where the join failed
        * This is likely due to a synonymous or an old version of a scientific name being used
    * Add common name synonym and scientific name synonym columns
    * Add notes column
* **Species were selected for study based on their their migratory status and Redlist category:**
    * Rüppell's Vulture (*Gyps rueppellii*) – Critically Endangered
    * Egyptian Vulture (*Neophron percnopterus*) – Endangered
    * Malagasy Pond Heron (*Ardeola idae*) – Endangered
    * Steppe Eagle (*Aquila nipalensis*) – Endangered


## **AP Bird Species List Analysis**



* **Goals:**
    * Calculate basic stats and create visualizations for the species that occur w/in African Parks
* **Run bird_data_analysis R script:**
* Calculates species count
* Calculates how many species fall in each migration status category and percentages
* Generates a bar plot to visualize the migratory status data
* Calculates how many species fall in each redlist category and percentages
* Separates out species with concern level near threatened and above and percentages
* Generates a bar plot to visualize the redlist status data
* Calculates redlist status counts and percentage for migratory species
* Generates a bar plot to visualize redlist status data for the migratory species


## **Important Bird Areas (IBAs) Data**



* Load the IBA dataset in qGIS
* Select IBA sites that intersect with AP polygons
    * Vector → Geoprocessing tools → Intersection
* Export selection to a new layer
* Save the new layer as a geopackage or shapefile


## **BirdLife Range Data**



* **Goals:** 
    * Extract the range data for study species from the BirdLife Range dataset
* Load the BirdLife Range dataset in qGIS
* Export the dataset as an ESRI Shapefile
    * Right click on layer > export > save features as… > ESRI Shapefile
* **Run range_data_manip R script:**
* Ingests BirdLife Range ESRI Shapefile
* Removes range entries that have a presence value of 4, 5, or 6 (Possibly Extinct, Extinct, or Presence Uncertain)
* Selects the study species
* Exports the range data for each study species as a separate shapefile


## **Protected Land & Range Data**



* **Goals:**
    * Calculate what percentage of each species’ African range is protected
    * Calculate what percentage of each species’ African range is managed by African Parks
    * Calculate what percentage of each species’ protected range w/in Africa is managed by African Parks
* Load afr_g2014_2013_0.shp, wdpa_africa.shp, wdpa_ap.shp, and study species shapefiles in qGIS
* Ensure distance and area units for the project are in kilometers/square kilometers
    * Project > properties > measurements
* For each species in the range dataset complete the following processes:
    * Create a separate layer that merges all range subsections (seasonal ranges) into one
        * Vector > geoprocessing tools > dissolve
        * If this process throws an “invalid geometry” error, fix the geometry and then complete the process
            * Processing > toolbox > fix geometries
        * Save as an ESRI shapefile
* Create new layers by clipping dissolved ranges for each species to the African continent shapefile (creates African range shapefiles)
    * Vector > geoprocessing tools > clip
    * Save as an ESRI shapefile
* Calculate the area of the African range of each species
    * Open the attribute table > open field character > name the field > set output field type to “decimal number (real)” > put $area in the expression box
        * Gives area in square kilometers
    * Save as an ESRI shapefile
* Clip the African range of each species to wdpa_africa.shp
    * Vector > geoprocessing tools > clip
    * Open the attribute table of the new layer
        * Toggle editing mode > delete the area column (this column is not automatically updated during the clip process)
        * Recalculate the area and export the attribute table using the steps above
    * Save as an ESRI shapefile
* Clip the African range of each species to wdpa_ap.shp
    *  Vector > geoprocessing tools > clip
    * Open the attribute table of the new layer
        * Toggle editing mode > delete the area column (this column is not automatically updated during the clip process)
        * Recalculate the area and export the attribute table using the steps above
    * Save as an ESRI shapefile
* **Run range_analysis R script:**
* Conducts this sequence of steps for each species
* Ingests data
* Calculates what percentage of the species’ African range is protected
* Calculate what percentage of the species’ African range is managed by African Parks
* Calculate what percentage of the species’ protected range w/in Africa is managed by African Parks
* Adds necessary info to a data frame


## **Occurrence Density Visualization**



* **Goals:**
    * Visualize how each of the four study species move across Africa, Europe, and Asia over the course of the year
* Download GBIF occurrence data for each species according to the parameters outlined in the Data Sources section
* **Run the occ R script for each species (a_idae_occ, a_nipalensis_occ, g_rueppellii_occ, n_percnopterus_occ):**
* Ingests data
* Examines data
* Filters for needed columns to make the size of the dataset more manageable
* Filters out observations where scientific name was not determined
* Filters out observations where date is not recorded
* Investigates cleaned dataset for missing values
* Remove observations with unwanted issues in R
    * RECORDED_DATE_INVALID
    * CONTINENT_COORDINATE_MISMATCH
    * TAXON_MATCH_HIGHERRANK
* Exports a cleaned csv w/ all remaining observations of the given species
* Splits observations by month to help with spatial analysis
* Exports a csv for each month
* **Continue analysis is QGIS (process must be completed for each species):**
* Load all CSVs exported from R script as point files
    * Helpful tutorial – [https://docs.geopard.tech/geopard-tutorials/gis-quick-hints/qgis-convert-csv-to-shp](https://docs.geopard.tech/geopard-tutorials/gis-quick-hints/qgis-convert-csv-to-shp) 
* Load the af_asia_eur_diss.shp, wdpa_eu.shp, wdpa_asia_pacific.shp, and wdpa_africa.shp files
* Using the seasonal point file, ensure all points are w/in the canvas extent
* Create a grid
    * Processing > toolbox > create grid > grid type = hexagon > grid extent = set to current map canvas extent
* For each month point file, run the “Count Points in Polygon” function
    * Processing > toolbox > count points in polygon
* For each resulting layer, conduct the following process:
    * Open attribute table > toggle editing mode > select features using an expression
        * Fields and Values > NUMPOINTS
        * "NUMPOINTS" = 0
        * Select features
        * Delete selected features
* Identify the layer with the largest NUMPOINTS value
* For the identified layer, open the properties window
    * Symbology > graduated > value = NUMPOINTS > choose desired color ramp > mode = natural breaks (jenks) > classes = 10 (this number can be adjusted as needed to ensure the lower classes aren’t just 1-1)
    * Right click on the layer > styles > copy style > all style categories
* For all other layers:
    * Right click on the layer > styles > paste style > all style categories
* Properties of the other layers were adjusted to produce the desired visuals
* A map was exported for each month as well as the legend for the density layer
* These maps were labeled with the legend, scientific name, and corresponding month and then used to create a GIF to show the change in observation density over the course of the year


# **<span style="text-decoration:underline;">Sources</span>**



1. [https://www.africanparks.org/about-us/our-story](https://www.africanparks.org/about-us/our-story)
2. [https://unu.edu/ehs/series/5-key-findings-about-current-state-worlds-migratory-species](https://unu.edu/ehs/series/5-key-findings-about-current-state-worlds-migratory-species)
3. Michael T. Hallworth, Erin Bayne, Emily McKinnon, Oliver Love, Junior A. Tremblay, Bruno Drolet, Jacques Ibarzabal, Steven Van Wilgenburg, Peter P. Marra; Habitat loss on the breeding grounds is a major contributor to population declines in a long-distance migratory songbird. Proc Biol Sci 1 April 2021; 288 (1949): 20203164. [https://doi.org/10.1098/rspb.2020.3164](https://doi.org/10.1098/rspb.2020.3164)
4. [https://nationalzoo.si.edu/migratory-birds/news/travel-alert-migratory-birds-stopover-sites-decline](https://nationalzoo.si.edu/migratory-birds/news/travel-alert-migratory-birds-stopover-sites-decline) 
5. [https://www.fws.gov/story/threats-birds-habitat-impacts](https://www.fws.gov/story/threats-birds-habitat-impacts)
