Readme for ROPLS-ViPerSNet

ROPLS-ViPerSNet: R Orthogonal Projections of Latent Structures with Variable Permutation Selection and Elastic Net

This script utilizes the Bioconductor package ropls to generate OPLS models. It conducts variable selection using p(corr) and optionally VIP. Additionally, it includes permutations pre-variable selection with subsequent variable selection for each permutation, resulting in p-values for R2 and Q2, incorporating the variable selection procedure. The script generates tables for all group comparisons, with optional stratification by metadata.
Input:
	•	One matrix with sample ID as first column and variables
	•	One metafile with sampleID (initial column matching exactly the initial column  of the previous matrix) including the groups to be compared
	•	Two configuration files with desired settings
Output:
	•	One HTML file per comparison of groups, containing models using five different model strategies
	•	One summary HTML file
	•	.Rdata files for all comparisons
	•	.txt files with tables displaying loadings showing p(corr)
	•	One  HTML file for the optional OPLS model build using the Elastic Net variable selection approach

#####################

Installation and running instructions:

Clone the repo using git:

apt-get install git (only if you don’t already have git installed).


git clone https://github.com/pulmonomics-lab/ropls_vipers-net.git

if it’s the first time running the program, build the conda environment using the yml file that is in the git repo that you installed:

conda env create -n vipersnet -f vipersnet.yml 
  
This conda environment will contain all the packages that you need to run this program. In future runs, you can start here below:

conda activate vipersnet

You must be in the correct directory before you run the program. All analyses are done from within the vipersnet folder that was installed using GitHub.    

cd vipersnet

Two input files, one variable matrix and one metadata, are required. Build these files following the instructions below the hash line. Please make sure you follow them carefully. Place your two files into the data folder. The formatting of the files is very important for the program to be able to build the model based on them. You can build your files based on the example data files provided.

Now, make sure you are back in the vipersnet folder where the data folder is located with the files inside formatted accordingly. Make sure all the column names and sample info are formatted according to the information provided below.

Ok, now the next fun step you have to fix the two configuration files before you go ahead.
You can change the configuration files based on what you want. There is an example file that is actually handy.

If you want to do a test run, use the roplspvs_Configure_Get_Started_example_data.R configuration file. Otherwise use the 
roplspvs_Configure_Get_Started.R file. You need to change this in the roplspvs_Run.R file, by the way. Because which config files are to be read are noted in that folder. 

After activating the conda environment and having placed your two files in the data folder and fixing up the config files, and making sure that you are in the vipersnet directory. Now, from here, you can then start R by just typing R into the command line.

Then run the following in your terminal directly. Highly recommend to do this in a tmux or a screen session.  

$ R


> install.packages("BiocManager")
> BiocManager::install("ropls")

If this is your first time running the program run the following two lines first. You only need to do this once. Then fun the command below. After you first time, you can begin here when you start R.

> source("scripts/roplspvs_Run.R")

Do not change the names of input (data) and output (outputR) folders in the config files.

The outputs will be placed in the outputR folder at the end of the run. The combined output from the 5 models is a single html file. There is a separate html file generated for the OPLS model built using the elastic net viariable selection, if the user chooses that option.

Now, to tell you more about the model and how it works.  

##########################

Instructions for Data Preparation and Analysis with ropls-ViPerSNet
	1	Prepare the datamatrix with subjectID in the first column and variable names in the first row. Make sure the first column of the two files are identical and in the same order.
	2	Ensure all names are unique. Avoid using the following symbols in subjectID or variable names (rownames and colnmaes of both input files): ?, $, %, ^, &, *, (, ), -, #, ?, ,, <, >, /, |, , [, ], {, and } (in addition to space and tab). Pretty much only use periods (.) or underscores (_) in the names besides alphanumeric characters.
	3	Indicate missing values with "", "NA", or "Inf".
	4	The datamatrix may contain numeric data, integers, or categorical data as characters. Original categorical variables will be replaced with dummy variables.
	5	Provide a sampleID file with sampleID in the first column, containing one column with the groups to be compared, and optionally, one column with secondaryID (e.g., gender) for stratification. Ensure this file does not contain the symbols mentioned above, and sampleID's should match the subjectID's in the datamatrix.
	6	Save both the datamatrix and sampleID files as Tab-delimited ("*.txt") files.
	7	Manually create a project folder for the analysis. Within this folder, create a subdirectory named "outputR" to store the results and tables, including model_table_to_analyse and reordered_model_table_to_analyse.
	8	Save your datamatrix and sampleID files in the "data" folder. Alternatively, specify the path and folder name to your own input data folder.
	9	Save the files roplspvs_Configure_Get_Started.R and roplspvs_Configure_Advanced.R in your project folder. 
	10	Edit basic settings of parameters in the file "roplspvs_Configure_Get_Started.R", which contains mandatory parameters such as file names, folder names, and column names describing the groups to be compared. Advanced parameters and default settings can be modified in the file "roplspvs_Configure_Advanced.R".

###############

The ropls-ViPerSNet pipeline:

	1	Execute roplspvs_Run.R to load data from the Configure files and run the workflow using the steps described earlier in this file.
	3	The function oplspvs generates output sent to the file "roplspvs_Models_of_each_comparison.Rmd".
	4	For each comparison, "roplspvs_Models_of_each_comparison.Rmd" renders an HTML file containing score plots, loading plots, permutation pre-, post-, and over-variable selection plots, and model statistics.
	5	After completing all comparisons, "roplspvs_Summary_of_models.Rmd" renders a summary HTML file of all models. This file includes tables of all selected models and all significant models.
	6	Final section to run, if the user has chosen the option, is the variable selection using Elastic Net. This will generate a separate output file from the rest which HTML file containing a p(corr) and VIP table for the variables, a table for the OPLS model statistics, along with figures for both the OPLS model and the final variables and their role in the model. Keep in mind that this is a more computationally intensive step so it is recommended that you only try this if you are using a server system.

################

Features
Preprocessing
Preprocessing includes optional replacement of 0 with NA or the lower limit of detection (LLD), and NA with LLD. Users can set the value for LLD. Data filtering is performed, allowing for a user-set missing value tolerance for each group in each comparison. The data is optionally log-transformed. Character data is replaced with dummy variables. If NA remains in the dataset, Nonlinear Iterative Partial Least Squares (NIPAL) is used to impute values for missing data. Mean centering and Unit Variance scaling are performed using the ropls package.
Variable Selection and the Models Generated
Variables contributing most to the model are selected using p(corr) and optionally VIP. P(corr) of a variable is the Pearson correlation between the raw data and the scores of the model, i.e., a measure of how well a variable correlates with the model. The cutoff for p(corr) can be set by the user either to a numeric value or to correspond to a p-value for the Pearson correlation. VIP is a relative measure of how much the variable contributes to the model.
The script generates five models using different strategies for selecting variables:
	•	Model Strategy 0 shows models pre-variable selection.
	•	Model Strategy 1 uses a p(corr) cutoff, which is user-set either to a numeric value or corresponding to a user-set p[Pearson_pcorr_cutoff], along with a user-set number of orthogonals (default 0).
	•	Model Strategy 2 uses a p(corr) cutoff corresponding to a user-set p[Pearson_pcorr_cutoff], resulting in the best performing model after variable selection.
	•	Model Strategy 3 uses both p(corr) cutoffs, resulting in the best performing model after variable selection. Only pcorr cutoffs higher than p[Pearson_pcorr_cutoff] are used.
	•	Model Strategy 4 sets a p(corr) cutoff and number of orthogonals, creating the best performing model after variable selection while keeping the number of variables to a minimum. Variables are limited by only adding variables if a decrease in p(corr) cutoff less than the user-set delta-p(corr) cutoff results in an increase in Q2 of more than 1%. The minimum p(corr) cutoff for model strategy 3 and 4 is set by variable p[Pearson_pcorr_cutoff].
	•	Model Strategy 5 is an iteration model using increasing p(corr) cutoff stepwise as long as Q2 of the model post-variable selection is increased by more than 1%.

An additional Elastic Net Regression narrowed variable selection can be used if the user chooses to.

	•	Elastic Net regression based on user set hyperparameters and repeated cross validation for optimal penalization strength
	•	OPLS based on the chosen variable with 0, 1 and 2 orthogonal.

Best Performing Model during Selection (among the initial 5 models) of Amount of Orthogonal Variables and p(corr) Cutoff
Best performing models are defined as models that, after variable selection, give high Q2, low difference between R2 and Q2, low p[Q2_perm_post_vs], and low p[R2_perm_post_vs]. The weight between low difference and low p[Q2_perm_post_vs] is given by the user-set preferred_pR2_and_pQ2_permutated_post_vs, with lower values giving more weight to p[Q2_perm_post_vs] compared to high Q2 and low difference between R2 and Q2.
Detailed Description of Method for Selecting Amount of Orthogonal Variables
	1	Maximum number of orthogonals is user-set by variable max_no_of_ortho with a default setting of 5 for Model2-4 and by setting no_of_ortho with a default of 0 for Model1.
	2	The number of orthogonals is set using the ropls default method, adding orthogonals as long as Q2 is increased by 1%.
	3	It is checked if there is a model with higher Q2 using fewer orthogonals using the following procedure:
	◦	Selects models with p[R2_perm_post_vs] and p[Q2_perm_post_vs] < preferred_pR2_and_pQ2_permutated_post_vs and a difference between R2 and Q2 < 0.2.
	◦	Selects models with the maximum Q2 as long as adding an orthogonal increases Q2 more than 1%.
	◦	If no model is found, the p[R2_perm_post_vs] and p[Q2_perm_post_vs] limit is increased by preferred_pR2_and_pQ2_permutated_post_vs, and the difference between R2 and Q2 is increased by 0.1, and the selection is rerun.
	◦	If there is more than one model with the same number of orthogonals and the same Q2, the model with the lowest number of orthogonals after variable selection is chosen.

Detailed Description of Method for Selecting p(corr) Cutoff
	1	From the start, all variables with |p(corr)| < p[Pearson_pcorr_cutoff] are removed.
	2	Model Strategy 2: p(corr) cutoff set to correspond to p[Pearson_pcorr_cutoff] set by the user.
	3	Model Strategy 3 and 4: Selects a p(corr) cutoff resulting in models with p[R2_perm_post_vs] and p[Q2_perm_post_vs] < preferred_pR2_and_pQ2_permutated_post_vs, a difference between R2 and Q2 < 0.2, and maximum Q2.
	4	Model Strategy 3: Decreases Q2 by a maximum of 1% if fewer features or fewer orthogonals may be used.
	5	Model Strategy 4: Decreases Q2 as long as increasing p(corr) cutoff more than the user-set pcorr_diff increases Q2 more than 1% for each pcorr_diff step, resulting in fewer variables.
	6	If no model is found, the p[R2_perm_post_vs] and p[Q2_perm_post_vs] limit is increased by preferred_pR2_and_pQ2_permutated_post_vs, and the difference between R2 and Q2 is increased by 0.1, searching again for the model with the highest Q2.

Elastic Net option

If you choose for this option, you will have to choice between a balanced combined Lasso and Ridge regression functions together. You can choose either or a combination.You need to set both alpha and lambda options here. There are three options for lambda and one option for alpha. Lambda tells you about the penalization strength or in other words how harshly do you want the noise removal to be. The smaller the lambda, the less harsh the penalization. The recommendation is to base this on your predictor variables. If your predictors are correlated then using lasso (alpha = 1) will discard most of them and get rid of collinearity. If your objective is to keep the correlated variable, then setting a lower value for penalization is preferable, since this would add power to the ridge regression and discard fewer predictors. You can adjust this as needed if your model is not to your liking. The output of the model can be judged by pQ2, Q2 and the difference between Q2 and R2, which account for the model’s ability to predict an outside dataset instead of just fitting to the current model and the difference between P2 and Q2 can be an indicator of overfitting.

SUS Plots of Models Post Variable Selection using the SUSplot Function
To compare two models from roplspvs, correlation plots of p(corr) for each variable in each model are plotted in a so-called shared and unique structure (SUS) plot, Wiklund et al in Analytical Chemistry 2008. These are easy to create for models pre-variable selection where all variables are present in both models. Models post-variable selection are trickier to compare, as the variables selected in the models differ. Therefore, to compare models post-variable selection in a SUS plot, the variables from both models were used to fit a new model. For the visualization in the SUS plot, p(corr) is selected firstly from the original model and secondly from the newly fitted model. The variables are colored for being shared or unique to each model. 
Model Statistics
R2 and Q2
R2 is derived from the ropls package and is a measure of the fitness of the model, showing how much of the variation is explained by the model with a maximum value of 1. Q2 is a measure of the predictability of the model determined by 7-fold cross-validation, which is the default in the ropls package. The package gives R2 and Q2 pre and post-variable selection.
Permutations
In addition to the permutations pre and post-variable selection, which is calculated by default by the ropls package resulting in p[R2_perm_sans_vs], p[Q2_perm_sans_vs], p[R2_perm_post_vs], and p[Q2_perm_post_vs], this package also calculates p-values for permutations over variable selection p[R2_perm_over_vs] and p[Q2_perm_over_vs]. Permutations over variable selection are performed by randomization of subject labels followed by variable selection and fitting of the model post-variable selection to obtain R2 and Q2 for permuted models. R2 and Q2 for the permuted models are compared to R2 and Q2 for the unpermuted models to generate p[R2_perm_over_vs] and p[Q2_perm_over_vs]. The number of orthogonals is set by ropls default for permuted models as well as in the unpermuted model under investigation. The number of permutations performed is user-set by setting parameter no_permutations_sans_vs, no_permutations_post_vs, no_permutations_post_vs_selected_models, and no_permutations_over_vs with default 20.
Establishing the Size of Overestimate in Models
As suggested by Lindgren et al. in Journal of Chemometrics 1996, the overfit may be established for a specific dataset by the difference between the average Q2 of the permuted models over variable selection and the average Q2 of the permutated models pre-variable selection. This difference establishes the average increase in Q2 during variable selection in the specific dataset. This difference in Q2 is a measure of the overfit of the model but may also contain an actual enhancement of the model by removing unrelated variance.
Adjusting Q2 to Not Include the Overestimate of the Model
By removing the calculated overfit from the Q2 post-variable selection, we create an adjusted Q2 which should represent a prediction without overfit. If this adjusted Q2 is negative, the model should be rejected and considered insignificant. A limit for how low it can be and still represent a model remains to be evaluated.
RMSE
RMSE is derived using the ropls package and is the square root of the mean error between actual and predicted responses.
