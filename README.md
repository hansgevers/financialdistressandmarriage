# financialdistressandmarriage
Code and materials for the paper "The Impact of Marriage and Cohabitation on Financial Distress: Evidence from SHARE 2015 to 2022 for 16 European Countries"

To support reproducibility of the study, following do-files are available:

"preprocessing base.do" for combining SHARE datafiles
"preprocessing.do" to match the datasets with the tailor-made calibrated longitudinal weights
"nuts1 preprocessing.do" for combining Eurostat data with updated demographic information for processing in the tuned SHARE-ERIC do-files for calibrating the longitudinal weights
"do.do" as the main analysis file for data preparation, descriptives, and analysis
The calculation of calibrated longitudinal weights is completed with tuned do-files provided by SHARE-ERIC. As the latter are included in the SHARE-package, for which registration is required, they are not made available. However, the calibrated weights plotted against the design weights (being designVersusCalibratedWeights_ for 16 countries) as coded in the do-files of SHARE-ERIC are available.
Additionally, descrip_ files refer to the images included in the paper.

Relevant hyperlinks: www.share-eric.eu www.stata.com

Author: Hans Gevers - https://orcid.org/0009-0001-0249-4142
