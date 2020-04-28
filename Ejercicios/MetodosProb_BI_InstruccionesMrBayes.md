## Para utilizar MrBayes: primero instalen Beagle para mayor eficiencia (en la liga de programas en la página principal)
### En Windows, dar doble click al ejecutable mb.3.2.7-win64.exe
### En Mac, abrir la terminal y navegar a la carpeta de la clase en el Escritorio usando los siguients comandos:
```
cd ~/Desktop/Sist2020/R
```
Revisar que sí estén en esa carpeta
```
pwd
```
Debe de mostrar algo así, donde Odontodactylus es mi nombre de usuario
```
/Users/Odontodactylus/Desktop/Sist2020/R
```
para entrar a MrBayes, pongan el siguiente comando:
```
./mb
```
### Les debe de mostrar una pantalla en la terminal (Mac) o DOS (Windows) que se ve así:
```
                            MrBayes v3.2.2 x64

                      (Bayesian Analysis of Phylogeny)

              Distributed under the GNU General Public License


               Type "help" or "help <command>" for information
                     on the commands that are available.

                   Type "about" for authorship and general
                       information about the program.


MrBayes > 
```
### Ahora los comandos en MrBayes son idénticos para Windows y Mac
Para ejecutar el archivo
```
execute  /Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex 
```
Y le dan Enter
Les debe de aparecer lo siguiente
```
   Executing file "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex"
   UNIX line termination
   Longest line length = 673
   Parsing file
   Expecting NEXUS formatted file
   Reading data block
      Allocated taxon set
      Allocated matrix
      Defining new matrix with 7 taxa and 657 characters
      Data is Dna
      Missing data coded as ?
      Gaps coded as -
      Taxon 1 -> Nautilus
      Taxon 2 -> Argonauta
      Taxon 3 -> Opisthoteuthis
      Taxon 4 -> Vampyroteuthis
      Taxon 5 -> Sepia
      Taxon 6 -> Dosidicus
      Taxon 7 -> Octopus
      Successfully read matrix
      Setting default partition (does not divide up characters)
      Setting model defaults
      Seed (for generating default start values) = 1588086991
      Setting output file names to "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run<i>.<p|t>"
   Exiting data block
   Reading mrbayes block
      Logging screen output to file "coi_ceph.log"
      Setting outgroup to taxon "Nautilus"
      Defining charset called COI
      Defining partition called by_gene
      Setting by_gene as the partition (does not divide up characters).
      Setting model defaults
      Seed (for generating default start values) = 837934789
      Setting Nst to 6 for partition 1
      Setting Rates to Invgamma for partition 1
      Successfully set likelihood model parameters
      Unlinking
      Setting Revmatpr to Fixed(0.01,10.42,0.01,3.85,37.14,1.00) for partition 1
      Setting Statefreqpr to Fixed(0.26,0.17,0.21,0.36) for partition 1
      Setting Pinvarpr to Fixed(0.35) for partition 1
      Setting Shapepr to Exponential(0.76) for partition 1
      Successfully set prior model parameters
      Setting number of chains to 4
      Setting number of generations to 1000000
      Setting sample frequency to 100
      Setting print frequency to 1000
      Successfully set chain parameters
   Exiting mrbayes block
   Reached end of file

MrBayes > 
```
Quiere decir que MrBayes ya tiene la matriz, las probabilidades previas como son el modelo de sustitución, 
la frecuencia de las bases, y las correcciones gamma. Está listo para empeza el análisis con el comando para las cadenas de Markov:
```
mcmc
```
Y le dan Enter.
Tiene que arrojarles varias líneas en la pantalla que se vean así:
```
Chain results (1000000 generations requested):

       0 -- [-4141.789] (-4063.340) (-4080.822) (-4115.788) * [-4049.275] (-4034.798) (-4026.151) (-4044.521) 
    1000 -- (-3272.418) (-3264.969) (-3289.505) [-3231.961] * (-3265.669) (-3288.738) [-3211.220] (-3215.160) -- 0:00:00
    2000 -- (-3182.647) (-3188.600) [-3173.728] (-3188.861) * (-3189.309) (-3201.154) (-3183.939) [-3184.186] -- 0:00:00
    3000 -- (-3182.875) (-3177.723) (-3180.691) [-3177.971] * (-3186.814) (-3179.461) [-3181.840] (-3188.301) -- 0:00:00
    4000 -- [-3188.049] (-3182.185) (-3194.713) (-3175.475) * (-3185.522) (-3189.104) [-3189.527] (-3179.161) -- 0:00:00
    5000 -- (-3183.798) (-3178.025) (-3180.700) [-3187.948] * [-3181.590] (-3184.536) (-3192.552) (-3183.647) -- 0:03:19
```
Va a correr un millón de pasos/ generaciones, y cuando acabe les preguntará si quieren continuar o no; pongan no
```
Continue with analysis? (yes/no): no
```
Entonces les arrojará información de la búsqueda de cadenas
```
 Analysis completed in 3 mins 13 seconds
   Analysis used 188.12 seconds of CPU time
   Likelihood of best state for "cold" chain of run 1 was -3165.77
   Likelihood of best state for "cold" chain of run 2 was -3166.09

   Acceptance rates for the moves in the "cold" chain of run 1:
      With prob.   (last 100)   chain accepted proposals by move
         27.6 %     ( 22 %)     Multiplier(Alpha)
         31.5 %     ( 39 %)     ExtSPR(Tau,V)
         13.8 %     ( 17 %)     ExtTBR(Tau,V)
         33.8 %     ( 42 %)     NNI(Tau,V)
         24.4 %     ( 33 %)     ParsSPR(Tau,V)
         26.1 %     ( 26 %)     Multiplier(V)
         33.4 %     ( 38 %)     Nodeslider(V)
         25.0 %     ( 19 %)     TLMultiplier(V)

   Acceptance rates for the moves in the "cold" chain of run 2:
      With prob.   (last 100)   chain accepted proposals by move
         27.6 %     ( 19 %)     Multiplier(Alpha)
         31.0 %     ( 30 %)     ExtSPR(Tau,V)
         13.8 %     ( 19 %)     ExtTBR(Tau,V)
         33.7 %     ( 40 %)     NNI(Tau,V)
         24.3 %     ( 22 %)     ParsSPR(Tau,V)
         25.9 %     ( 21 %)     Multiplier(V)
         33.7 %     ( 29 %)     Nodeslider(V)
         24.8 %     ( 32 %)     TLMultiplier(V)

   Chain swap information for run 1:

                1       2       3       4 
        ----------------------------------
      1 |            0.85    0.72    0.60 
      2 |  166943            0.86    0.74 
      3 |  167133  166564            0.87 
      4 |  165945  166699  166716         

   Chain swap information for run 2:

                1       2       3       4 
        ----------------------------------
      1 |            0.85    0.72    0.60 
      2 |  167383            0.86    0.74 
      3 |  166912  166002            0.87 
      4 |  166589  167069  166045         

   Upper diagonal: Proportion of successful state exchanges between chains
   Lower diagonal: Number of attempted state exchanges between chains

   Chain information:

     ID -- Heat 
    -----------
      1 -- 1.00  (cold chain)
      2 -- 0.91 
      3 -- 0.83 
      4 -- 0.77 

   Heat = 1 / (1 + T * (ID - 1))
      (where T = 0.10 is the temperature and ID is the chain number)
```
Y ahora hay que resumir/sumarizar los procedimientos (las probabilidades del modelo) quitando las primeras generaciones feas (burnin) con el comando:
```
sump
```
Donde sump les da toda esta información con los datos del resumen
```
Summarizing parameters in files /Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run1.p and /Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run2.p
   Writing summary statistics to file /Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.pstat
   Using relative burnin ('relburnin=yes'), discarding the first 25 % of samples

   Below are rough plots of the generation (x-axis) versus the log   
   probability of observing the data (y-axis). You can use these     
   graphs to determine what the burn in for your analysis should be. 
   When the log probability starts to plateau you may be at station- 
   arity. Sample trees and parameters after the log probability      
   plateaus. Of course, this is not a guarantee that you are at sta- 
   tionarity. Also examine the convergence diagnostics provided by   
   the 'sump' and 'sumt' commands for all the parameters in your     
   model. Remember that the burn in is the number of samples to dis- 
   card. There are a total of ngen / samplefreq samples taken during 
   a MCMC analysis.                                                  

   Overlay plot for both runs:
   (1 = Run number 1; 2 = Run number 2; * = Both runs)

   +------------------------------------------------------------+ -3182.33
   |                                      2      2              |
   |   1               2                                        |
   |    2                                                 2     |
   |        1           *2   1   1    12        2        2    12|
   |2    21        1 2     1       1          *           1  1  |
   |11 2      2  1          *      2         2 2 1      21 2   1|
   |  2         2         2                12   1 2  2      2   |
   |  1               1  112 22  2  1221  1 1     1   22    1   |
   | 2  1 22 1   22   2       1   1            1   2  1 1       |
   |        22 1    1                    2                   2  |
   |          1 1 1 2          1             1      2  1        |
   |     1 1   2   2   1        1          2       1 1          |
   |                                21  *1          1      1    |
   |                           22                             2 |
   |                 1            2                             |
   +------+-----+-----+-----+-----+-----+-----+-----+-----+-----+ -3184.75
   ^                                                            ^
   250000                                                       1000000


   Estimated marginal likelihoods for runs sampled in files
      "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run1.p" and "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run2.p":
      (Use the harmonic mean for Bayes factor comparisons of models)

      (Values are saved to the file /Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.lstat)

   Run   Arithmetic mean   Harmonic mean
   --------------------------------------
     1      -3176.10         -3196.16
     2      -3176.17         -3196.91
   --------------------------------------
   TOTAL    -3176.14         -3196.60
   --------------------------------------


   Model parameter summaries over the runs sampled in files
      "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run1.p" and "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run2.p":
      Summaries are based on a total of 15002 samples from 2 runs.
      Each run produced 10001 samples of which 7501 samples were included.
      Parameter summaries saved to file "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.pstat".

                                         95% HPD Interval
                                       --------------------
   Parameter      Mean      Variance     Lower       Upper       Median    min ESS*  avg ESS    PSRF+ 
   --------------------------------------------------------------------------------------------------
   TL          7.303718    0.283466    6.278724    8.345419    7.279898   6275.57   6449.35    1.000
   alpha       0.199487    0.000441    0.160384    0.241340    0.197949   4869.89   5136.55    1.000
   --------------------------------------------------------------------------------------------------
   * Convergence diagnostic (ESS = Estimated Sample Size); min and avg values
     correspond to minimal and average ESS among runs. 
     ESS value below 100 may indicate that the parameter is undersampled. 
   + Convergence diagnostic (PSRF = Potential Scale Reduction Factor; Gelman
     and Rubin, 1992) should approach 1.0 as runs converge.
```
Y ahora tenemos que resumir/sumarizar la información de los árboles quitando las primeras generaciones feas (burnin) en la distribución de probabilidades posteriores
```
sumt
```
El resumen de árboles nos general el consenso del Intervalo de Credibilidad (IC) 95% y toda esta información
```
Summarizing trees in files "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run1.t" and "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run2.t"
   Using relative burnin ('relburnin=yes'), discarding the first 25 % of sampled trees
   Writing statistics to files /Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.<parts|tstat|vstat|trprobs|con>
   Examining first file ...
   Found one tree block in file "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.run1.t" with 10001 trees in last block
   Expecting the same number of trees in the last tree block of all files

   Tree reading status:

   0      10      20      30      40      50      60      70      80      90     100
   v-------v-------v-------v-------v-------v-------v-------v-------v-------v-------v
   *********************************************************************************

   Read a total of 20002 trees in 2 files (sampling 15002 of them)
      (Each file contained 10001 trees of which 7501 were sampled)
                                                                                   
   General explanation:                                                          
                                                                                   
   In an unrooted tree, a taxon bipartition (split) is specified by removing a   
   branch, thereby dividing the species into those to the left and those to the  
   right of the branch. Here, taxa to one side of the removed branch are denoted 
   '.' and those to the other side are denoted '*'. Specifically, the '.' symbol 
   is used for the taxa on the same side as the outgroup.                        
                                                                                   
   In a rooted or clock tree, the tree is rooted using the model and not by      
   reference to an outgroup. Each bipartition therefore corresponds to a clade,  
   that is, a group that includes all the descendants of a particular branch in  
   the tree.  Taxa that are included in each clade are denoted using '*', and    
   taxa that are not included are denoted using the '.' symbol.                  
                                                                                   
   The output first includes a key to all the bipartitions with frequency larger 
   or equual to (Minpartfreq) in at least one run. Minpartfreq is a paramiter to 
   sumt command and currently it is set to 0.10.  This is followed by a table  
   with statistics for the informative bipartitions (those including at least    
   two taxa), sorted from highest to lowest probability. For each bipartition,   
   the table gives the number of times the partition or split was observed in all
   runs (#obs) and the posterior probability of the bipartition (Probab.), which 
   is the same as the split frequency. If several runs are summarized, this is   
   followed by the minimum split frequency (Min(s)), the maximum frequency       
   (Max(s)), and the standard deviation of frequencies (Stddev(s)) across runs.  
   The latter value should approach 0 for all bipartitions as MCMC runs converge.
                                                                                   
   This is followed by a table summarizing branch lengths, node heights (if a    
   clock model was used) and relaxed clock parameters (if a relaxed clock model  
   was used). The mean, variance, and 95 % credible interval are given for each 
   of these parameters. If several runs are summarized, the potential scale      
   reduction factor (PSRF) is also given; it should approach 1 as runs converge. 
   Node heights will take calibration points into account, if such points were   
   used in the analysis.                                                         
                                                                                 
   Note that Stddev may be unreliable if the partition is not present in all     
   runs (the last column indicates the number of runs that sampled the partition 
   if more than one run is summarized). The PSRF is not calculated at all if     
   the partition is not present in all runs.The PSRF is also sensitive to small  
   sample sizes and it should only be considered a rough guide to convergence    
   since some of the assumptions allowing one to interpret it as a true potential
   scale reduction factor are violated in MrBayes.                               
                                                                                 
   List of taxa in bipartitions:                                                 
                                                                                   
      1 -- Nautilus
      2 -- Argonauta
      3 -- Opisthoteuthis
      4 -- Vampyroteuthis
      5 -- Sepia
      6 -- Dosidicus
      7 -- Octopus

   Key to taxon bipartitions (saved to file "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.parts"):

   ID -- Partition
   -------------
    1 -- .******
    2 -- .*.....
    3 -- ..*....
    4 -- ...*...
    5 -- ....*..
    6 -- .....*.
    7 -- ......*
    8 -- ....**.
    9 -- .**...*
   10 -- ..*...*
   11 -- .***..*
   12 -- ...***.
   13 -- .**.***
   14 -- .**....
   15 -- ...*..*
   16 -- .*.****
   -------------

   Summary statistics for informative taxon bipartitions
      (saved to file "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.tstat"):

   ID   #obs     Probab.     Sd(s)+      Min(s)      Max(s)   Nruns 
   -----------------------------------------------------------------
    8  14881    0.991934    0.001603    0.990801    0.993068    2
    9   8320    0.554593    0.001131    0.553793    0.555393    2
   10   7212    0.480736    0.001508    0.479669    0.481802    2
   11   6178    0.411812    0.005279    0.408079    0.415545    2
   12   3282    0.218771    0.005468    0.214905    0.222637    2
   13   3054    0.203573    0.003582    0.201040    0.206106    2
   14   2872    0.191441    0.004148    0.188508    0.194374    2
   15   2795    0.186308    0.006882    0.181442    0.191175    2
   16   1687    0.112452    0.006127    0.108119    0.116784    2
   -----------------------------------------------------------------
   + Convergence diagnostic (standard deviation of split frequencies)
     should approach 0.0 as runs converge.


   Summary statistics for branch and node parameters
      (saved to file "/Users/Odontodactylus/Desktop/Sist2020/R/cephalopoda_COIp_aln_mb.nex.vstat"):

                                           95% HPD Interval
                                         --------------------
   Parameter      Mean       Variance     Lower       Upper       Median     PSRF+  Nruns
   --------------------------------------------------------------------------------------
   length[1]     1.803325    0.078737    1.264867    2.359823    1.783371    1.000    2
   length[2]     0.546411    0.014999    0.316718    0.795767    0.537177    1.000    2
   length[3]     0.476348    0.016112    0.236325    0.736965    0.472422    1.000    2
   length[4]     0.829672    0.028706    0.508288    1.164564    0.821278    1.000    2
   length[5]     0.572563    0.031895    0.222755    0.923834    0.565843    1.000    2
   length[6]     1.333336    0.057292    0.896033    1.818129    1.314943    1.000    2
   length[7]     0.795069    0.022736    0.500271    1.089771    0.786398    1.000    2
   length[8]     0.440553    0.031290    0.102868    0.783123    0.427544    1.000    2
   length[9]     0.223258    0.014737    0.000680    0.447535    0.213589    1.000    2
   length[10]    0.184970    0.010896    0.000031    0.370104    0.172164    1.000    2
   length[11]    0.183127    0.017230    0.000159    0.430666    0.158305    1.001    2
   length[12]    0.134051    0.010484    0.000044    0.335058    0.112288    1.000    2
   length[13]    0.147414    0.013424    0.000013    0.374524    0.121776    1.000    2
   length[14]    0.137879    0.009019    0.000198    0.319437    0.122070    1.000    2
   length[15]    0.211620    0.015200    0.000143    0.433457    0.199947    1.000    2
   length[16]    0.191961    0.016461    0.000321    0.440187    0.175188    1.000    2
   --------------------------------------------------------------------------------------
   + Convergence diagnostic (PSRF = Potential Scale Reduction Factor; Gelman
     and Rubin, 1992) should approach 1.0 as runs converge. NA is reported when
     deviation of parameter values within all runs is 0 or when a parameter
     value (a branch length, for instance) is not sampled in all runs.


   Summary statistics for partitions with frequency >= 0.10 in at least one run:
       Average standard deviation of split frequencies = 0.003970
       Maximum standard deviation of split frequencies = 0.006882
       Average PSRF for parameter values ( excluding NA and >10.0 ) = 1.000
       Maximum PSRF for parameter values = 1.001


   Clade credibility values:

   /------------------------------------------------------------ Nautilus (1)
   |                                                                               
   |------------------------------------------------------------ Vampyroteuthis (4)
   |                                                                               
   |                             /------------------------------ Sepia (5)
   +--------------99-------------+                                                 
   |                             \------------------------------ Dosidicus (6)
   |                                                                               
   |                             /------------------------------ Argonauta (2)
   |                             |                                                 
   \--------------55-------------+------------------------------ Opisthoteuthis (3)
                                 |                                                 
                                 \------------------------------ Octopus (7)
                                                                                   

   Phylogram (based on average branch lengths):

   /------------------------------------------------------------------ Nautilus (1)
   |                                                                               
   |------------------------------ Vampyroteuthis (4)
   |                                                                               
   |               /--------------------- Sepia (5)
   +---------------+                                                               
   |               \------------------------------------------------ Dosidicus (6)
   |                                                                               
   |       /-------------------- Argonauta (2)
   |       |                                                                       
   \-------+----------------- Opisthoteuthis (3)
           |                                                                       
           \----------------------------- Octopus (7)
                                                                                   
   |-----------------| 0.500 expected changes per site

                                             Calculating tree probabilities...

   Credible sets of trees (151 trees sampled):
      50 % credible set contains 7 trees
      90 % credible set contains 37 trees
      95 % credible set contains 50 trees
      99 % credible set contains 83 trees
```
Ahora solo tenemos que buscar el árbol consenso con las probabilidades posteriores de cada nodo/clado llamado cephalopoda_COIp_aln_mb.nex.con.tre
Ese archivo lo abrimos en FigTree donde le podemos cambiar los tamaños de los nombres, grosor de ramas, enraizarlo con Nautilus y colocar las prob. posteriores.
```
```
Finalmente, salimos de MrBayes con el siguiente comando:
```
quit
```
