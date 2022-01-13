# Neutrophil-kinetics_genetic-algorithm

Parameters in the model are optimized, minimizing chisquared value 

Genetic algorithm available in optimization toolbox in matlab is used for this optimization procedure.

run "runga.m" to run the optimization.

"runga.m" repeats(in the while loop) optimization process untill specified number(k)of parameter sets has been generated.(k=2500 in the code)

The parameter sets are stored in the "parameters" variable (2500X8), where each parameter set contains 8 parameters of the model.

At the end of the run, "parameters" variable in the workspace is the output file to be used for further analysis of parameter distributions.

If the user has a different set of data,to get new estimates of parameter distributions, change the neutrophil percentage data in "errorfile.m" (line 3 to 19). Follow the data structure as specified in comments. After updating the data, run the "runga.m" and access outputs as described above.

Note: Make sure global optimization toolbox and parallel computing toolbox are installed in matlab. If the user wishes to not use parallel computing, the option for parallel should be changed from "True" to "False" in "runga.m" script.  
