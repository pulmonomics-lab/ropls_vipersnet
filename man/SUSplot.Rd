% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SUSplot.R
\name{SUSplot}
\alias{SUSplot}
\title{Share and unique structures plot}
\usage{
SUSplot(
  directory_output_reports_modelX,
  projectname_modelX,
  projectname_in_plot_modelX,
  date_of_analysis_modelX,
  group1_modelX,
  group2_modelX,
  secID_modelX,
  result_modelX_name,
  directory_output_reports_modelY,
  projectname_modelY,
  projectname_in_plot_modelY,
  date_of_analysis_modelY,
  group1_modelY,
  group2_modelY,
  secID_modelY,
  result_modelY_name,
  variable_names_position,
  variable_names_length,
  title_length,
  change_name_list_df
)
}
\arguments{
\item{directory_output_reports_modelX}{"path" Path to "outputR" where "output_reports" are created for model X .}

\item{projectname_modelX}{"projectname" as written in the Configure_Get_Strarted.R for model X}

\item{projectname_in_plot_modelX}{"projectname" as desired in the plot for model X}

\item{date_of_analysis_modelX}{date_of_analysis as given in Configure_Get_Started.R for model X}

\item{group1_modelX}{Diseased group of model X}

\item{group2_modelX}{Control group of model X}

\item{secID_modelX}{stratification group of model X. If no stratification write "joint"}

\item{result_modelX_name}{Name of model to be compared for model X. Either "result_Model1", "result_Model2", "result_Model3", "result_Model4" or "result_iterationmodel"}

\item{directory_output_reports_modelY}{"path" Path to "outputR" where "output_reports" are created for model Y .}

\item{projectname_modelY}{"projectname" as written in the Configure_Get_Started.R for model Y}

\item{projectname_in_plot_modelY}{"projectname" as desired in the plot for model Y}

\item{date_of_analysis_modelY}{date_of_analysis as given in Configure_Get_Strarted.R for model Y}

\item{group1_modelY}{Diseased group of model Y}

\item{group2_modelY}{Control group of model Y}

\item{secID_modelY}{stratification group of model Y. If no stratification write "joint"}

\item{result_modelY_name}{Name of model to be compared for model Y. Either "result_Model1", "result_Model2", "result_Model3", "result_Model4" or "result_iterationmodel"}

\item{variable_names_position}{part of variablenames shown "beginning", "end" or "all"}

\item{variable_names_length}{Number of characters of variablenames shown in loadingplot or "all"}

\item{title_length}{"long"  to write group comparison in title, "short" to write no comparison in title or FALSE to have no title}

\item{change_name_list_df}{list for changing names of variables in susplot in format c(c(change from,change to)), "edit" to change " " and "_" to "." or FALSE to not change}
}
\value{
Outputs a SUSplot figure
}
\description{
Compares two models from roplspvs package using p(corr) of the variables
}
\details{
After the workflow using the function oplspvs has been run. THe resulting models may be compared using this function
A new model is fitted using the variables from both models. P(corr) from the original model is used for variables that were alo in the original models
and the refitted p(corr) is used for the variables that were uniquely in the other model. P(corr) is the correlation
between the scores of the model and the raw data.
}
\examples{

## To compare two models from oplspvs:
SUSplot(directory_output_reports_modelX, projectname_modelX, projectname_in_plot_modelX,
date_of_analysis_modelX, group1_modelX, group2_modelX, secID_modelX, result_modelX_name,
directory_output_reports_modelY, projectname_modelY, projectname_in_plot_modelY,
date_of_analysis_modelY, group1_modelY, group2_modelY, secID_modelY, result_modelY_name,
variable_names_position, variable_names_length, title_length,change_name_list_df)
}
