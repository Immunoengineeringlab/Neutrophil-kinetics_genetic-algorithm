# Neutrophil-kinetics_genetic-algorithm

Parameters in the model are optimized, minimizing chisquared value 

Genetic algorithm available in optimization toolbox in matlab is used for this optimization procedure.

run "runga.m" to run the optimization.

"runga.m" repeats(in the while loop) optimization process untill specified number(k)of parameter sets has been generated.(k=2500 in the code)

The parameter sets are stored in the "parameters" variable (2500X8), where each parameter set contains 8 parameters of the model.

At the end of the run, "parameters" variable in the workspace is the output file to be used for further analysis of parameter distributions.

To change the neutrophil percentage data, goto "errorfile.m" and follow the data structure as specified in comments. (line 3 to 19)
