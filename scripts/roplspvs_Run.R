require(tools)
#directory_of_roplspvs <- file_path_as_absolute(dirname(sys.frame(1)$ofile))
#directory_of_analysis <- getwd()

#if (length(paste(list.files(directory_of_analysis, pattern = "Get_Started"), sep = "")) != 0) {
#  source(paste(list.files(directory_of_analysis, pattern = "Get_Started"), sep = ""))
#} else {
#  source(paste(directory_of_roplspvs,
#               "/roplspvs_Configure_Get_Started_example_data.R", sep = ""))
#}
#
#if (length(paste(list.files(directory_of_analysis, pattern = "\\Advanced.R"), sep = "")) != 0) {
#  source(paste(list.files(directory_of_analysis, pattern = "\\Advanced.R"), sep = ""))
#} else {
#  source(paste(directory_of_roplspvs,
#               "/roplspvs_Configure_Advanced.R", sep = ""))
#}


# Get the path of the current script
#directory_of_roplspvs <- path.expand(commandArgs(trailingOnly = TRUE)[[1]])

#current_script <- commandArgs(trailingOnly = TRUE)[1]

#if (!is.na(current_script)) {
  # Get the directory containing the current script
#  directory_of_roplspvs <- dirname(normalizePath(current_script))
#} else {
  # Handle the case where the path of the script could not be determined
#  warning("Unable to determine the path of the current script. Setting to current directory.")
#  directory_of_roplspvs <- "."  # or any other default value
#}


source("scripts/roplspvs_Configure_Get_Started_example_data.R")
source("scripts/roplspvs_Configure_Advanced.R")
source("scripts/oplspvs.R")
source("scripts/roplspvs_Functions.R")
directory_of_roplspvs <- "."
directory_of_analysis <- "."

oplspvs(directory_of_roplspvs, directory_of_analysis,
        projectname, date_of_analysis, filename_matrix, decimal_separator, filename_sampleID, colname_groupID, groupsnumeric,
        colname_secID, no_permutations_sans_vs, no_permutations_post_vs, no_permutations_post_vs_selected_models, no_permutations_over_vs,
        p_pearson_of_pcorr_cutoff, setseedfirstmodel, order_of_groups, comparisons_to_run,
        foldername_Rmarkdownfiles, foldername_of_input_matrix_and_sampleID, foldername_output_reports,
        directory_input_matrix_sampleID, directory_output_reports, filename_Rmarkdownfile_each_model, filename_Rmarkdownfile_summary,
        filename_function_file, replace_0,  filter_percent_in_each_group,  replace_NA, log_transform, pcorr_cutoff_Model1_joint_models, pcorr_cutoff_Model1_stratified_models,
        variable_selection_using_VIP, no_of_ortho_pre_vs_Model1_joint_models, no_of_ortho_pre_vs_Model1_stratified_models,
        no_of_ortho_post_vs_Model1_joint_models, no_of_ortho_post_vs_Model1_stratified_models, max_no_of_ortho_pre_vs,  max_no_of_ortho_post_vs,
        prefered_pR2_and_pQ2_permutated_post_vs, pcorr_diff, variable_names_length, variable_names_position,
        cluster, name_intermediate_dir, each_model_or_summary, model_strategies_to_run,filename_elstic,elastic,alpha_val,lambda_min,lambda_max,lambda_iter)

