#V3.30
#C fishing mortality uses the hybrid method
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
3 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
4 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	1	1	0	#_recr_dist_pattern1
1	1	2	0	#_recr_dist_pattern2
1	1	3	0	#_recr_dist_pattern3
1	1	4	0	#_recr_dist_pattern4
#
6 #_N_movement_definitions goes here if N_areas > 1
2 #_first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_move definition for seas, morph, source, dest, age1, age2
1	1	1	2	8	9	#_moveDef1
1	1	1	4	8	9	#_moveDef2
1	1	2	1	8	9	#_moveDef3
1	1	3	4	8	9	#_moveDef4
1	1	4	1	8	9	#_moveDef5
1	1	4	3	8	9	#_moveDef6
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern
# begin and end years of blocks
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_ #_Age_natmort_by sex x growthpattern
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10	Age_11	Age_12	Age_13	Age_14	Age_15	Age_16	Age_17	Age_18	Age_19	Age_20	Age_21	Age_22	Age_23	Age_24	Age_25	Age_26	Age_27	Age_28
1.3432	1.3432	1.182	1.0208	0.8596	0.6984	0.5372	0.5372	0.5372	0.5372	0.5372	0.564	0.6424	0.712	0.766	0.7976	0.8036	0.7848	0.746	0.6972	0.6492	0.6088	0.5796	0.5604	0.5492	0.5428	0.5396	0.5384	0.5376	#_natM1
3 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
28 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
12 # number of K multipliers to read
2 3 4 5 6 7 8 9 10 11 12 13 # ages for K multiplier
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
# Age Maturity or Age fecundity:
#_Age_0	Age_1	Age_2	Age_3	Age_4	Age_5	Age_6	Age_7	Age_8	Age_9	Age_10	Age_11	Age_12	Age_13	Age_14	Age_15	Age_16	Age_17	Age_18	Age_19	Age_20	Age_21	Age_22	Age_23	Age_24	Age_25	Age_26	Age_27	Age_28
0	0	0	0	0	0.1	0.15	0.2	0.3	0.5	0.7	0.9	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	#_Age_Maturity1
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
 1.0e+00	 45.000000	 22.00000000	 2.2000e+01	10.0	6.00	 -2	0	0	0	0	0.5	0	0	#_L_at_Amin_Fem_GP_1                
 1.2e+02	170.000000	145.00000000	 1.4500e+02	10.0	6.00	 -4	0	0	0	0	0.5	0	0	#_L_at_Amax_Fem_GP_1                
 5.0e-02	  0.500000	  0.45500000	 4.5500e-01	 0.8	6.00	 -4	0	0	0	0	0.5	0	0	#_VonBert_K_Fem_GP_1                
-5.0e+00	  5.000000	  0.50000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_2_Fem_GP_1                  
-1.5e+01	  5.000000	  0.75000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_3_Fem_GP_1                  
-1.5e+01	  5.000000	  1.00000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_4_Fem_GP_1                  
-1.5e+01	  5.000000	  1.00000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_5_Fem_GP_1                  
-1.5e+01	  5.000000	  1.00000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_6_Fem_GP_1                  
-1.5e+01	  5.000000	  1.80000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_7_Fem_GP_1                  
-1.5e+01	  5.000000	  1.80000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_8_Fem_GP_1                  
-1.5e+01	  5.000000	  1.20000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_9_Fem_GP_1                  
-1.5e+01	  5.000000	  1.20000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_10_Fem_GP_1                 
-1.5e+01	  5.000000	  1.00000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_11_Fem_GP_1                 
-1.5e+01	  5.000000	  1.00000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_12_Fem_GP_1                 
-1.5e+01	  5.000000	  1.00000000	 1.0000e+00	 1.0	0.00	 -1	0	0	0	0	0.0	0	0	#_Age_K_13_Fem_GP_1                 
 5.0e-02	  0.250000	  0.10000000	 1.0000e-01	 0.1	6.00	 -3	0	0	0	0	0.5	0	0	#_CV_young_Fem_GP_1                 
 5.0e-02	  0.250000	  0.10000000	 1.0000e-01	 0.1	6.00	 -3	0	0	0	0	0.5	0	0	#_CV_old_Fem_GP_1                   
-3.0e+00	  3.000000	  0.00002459	 2.4590e-05	 0.8	6.00	 -3	0	0	0	0	0.5	0	0	#_Wtlen_1_Fem_GP_1                  
-3.0e+00	  4.000000	  2.96670000	 2.9667e+00	 0.8	6.00	 -3	0	0	0	0	0.5	0	0	#_Wtlen_2_Fem_GP_1                  
-3.0e+00	  3.000000	  1.00000000	 1.0000e+00	 0.8	0.00	 -3	0	0	0	0	0.0	0	0	#_Mat50%_Fem_GP_1                   
-3.0e+00	  3.000000	 -0.25000000	-2.5000e-01	 0.8	6.00	 -3	0	0	0	0	0.0	0	0	#_Mat_slope_Fem_GP_1                
-3.0e+00	  3.000000	  1.00000000	 1.0000e+00	 0.8	6.00	 -3	0	0	0	0	0.5	0	0	#_Eggs_scalar_Fem_GP_1              
-3.0e+00	  3.000000	  0.00000000	 0.0000e+00	 0.8	6.00	 -3	0	0	0	0	0.5	0	0	#_Eggs_exp_wt_Fem_GP_1              
-5.0e+00	  5.000000	  0.00000000	 0.0000e+00	 0.0	0.25	 -3	0	0	0	0	0.0	0	0	#_RecrDist_GP_1_area_1_month_1      
-5.0e+00	  5.000000	 -0.31926800	 5.0000e-01	 0.0	0.25	  1	0	0	0	0	0.0	0	0	#_RecrDist_GP_1_area_2_month_1      
-5.0e+00	  5.000000	 -0.31926800	 5.0000e-01	 0.0	0.25	  1	0	0	0	0	0.0	0	0	#_RecrDist_GP_1_area_3_month_1      
-5.0e+00	  5.000000	 -0.31926800	 5.0000e-01	 0.0	0.25	  1	0	0	0	0	0.0	0	0	#_RecrDist_GP_1_area_4_month_1      
 1.0e-01	 10.000000	  1.00000000	 1.0000e+00	 1.0	6.00	 -1	0	0	0	0	0.0	0	0	#_CohortGrowDev                     
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_1_to_2
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_1_to_2
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_1_to_4
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_1_to_4
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_2_to_1
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_2_to_1
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_3_to_4
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_3_to_4
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_4_to_1
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_4_to_1
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_A_seas_1_GP_1_from_4_to_3
-1.5e+01	 15.000000	-10.00000000	 0.0000e+00	 4.0	6.00	  3	0	0	0	0	0.0	0	0	#_MoveParm_B_seas_1_GP_1_from_4_to_3
 1.0e-06	  0.999999	  0.50000000	 5.0000e-01	 0.5	0.00	-99	0	0	0	0	0.0	0	0	#_FracFemale_GP_1                   
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; 2=Ricker; 3=std_B-H; 4=SCAA;5=Hockey; 6=B-H_flattop; 7=survival_3Parm;8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
-2.0	25	10.0	10.0	5.0	6	  1	0	0	0	0	0	0	0	#_SR_LN(R0)  
 0.2	 1	 0.8	 0.8	0.2	6	 -1	0	0	0	0	0	0	0	#_SR_BH_steep
 0.0	 2	 0.6	 0.6	0.8	6	 -4	0	0	0	0	0	0	0	#_SR_sigmaR  
-5.0	 5	 0.0	 0.0	1.0	6	 -4	0	0	0	0	0	0	0	#_SR_regime  
 0.0	 0	 0.0	 0.0	0.0	0	-99	0	0	0	0	0	0	0	#_SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1969 # first year of main recr_devs; early devs can preceed this era
2010 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase
0 # (0/1) to read 13 advanced options
#
#Fishing Mortality info
0.1 # F ballpark
1998 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
2.9 # max F or harvest rate, depends on F_Method
4 # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
   17	1	 0	0	0	0	#_llcpue1   
   18	2	17	0	1	0	#_llcpue2   
   19	2	17	0	1	0	#_llcpue3   
   20	2	17	0	1	0	#_llcpue4   
-9999	0	 0	0	0	0	#_terminator
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
-25	25	4.01817	0	1	0	 1	0	0	0	0	0	0	0	#_LnQ_base_llcpue1(17)
-25	25	4.01817	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_llcpue2(18)
-25	25	4.01817	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_llcpue3(19)
-25	25	4.01817	0	1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_llcpue4(20)
#_no timevary Q parameters
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
0	0	0	0	#_1 fishing_gi_1   
0	0	0	0	#_2 fishing_gi_4   
0	0	0	0	#_3 fishing_hd_1   
0	0	0	0	#_4 fishing_ll_1   
0	0	0	0	#_5 fishing_ll_2   
0	0	0	0	#_6 fishing_ll_3   
0	0	0	0	#_7 fishing_ll_4   
0	0	0	0	#_8 fishing_other_1
0	0	0	0	#_9 fishing_other_4
0	0	0	0	#_10 fishing_bb_1  
0	0	0	0	#_11 fishing_ps_1  
0	0	0	0	#_12 fishing_ps_2  
0	0	0	0	#_13 fishing_ps_4  
0	0	0	0	#_14 fishing_trol_1
0	0	0	0	#_15 fishing_trol_2
0	0	0	0	#_16 fishing_trol_4
0	0	0	0	#_17 llcpue1       
0	0	0	0	#_18 llcpue2       
0	0	0	0	#_19 llcpue3       
0	0	0	0	#_20 llcpue4       
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
20	0	0	0	#_1 fishing_gi_1   
20	0	0	0	#_2 fishing_gi_4   
12	0	0	0	#_3 fishing_hd_1   
12	0	0	0	#_4 fishing_ll_1   
12	0	0	0	#_5 fishing_ll_2   
12	0	0	0	#_6 fishing_ll_3   
12	0	0	0	#_7 fishing_ll_4   
20	0	0	0	#_8 fishing_other_1
20	0	0	0	#_9 fishing_other_4
20	0	0	0	#_10 fishing_bb_1  
20	0	0	0	#_11 fishing_ps_1  
20	0	0	0	#_12 fishing_ps_2  
20	0	0	0	#_13 fishing_ps_4  
20	0	0	0	#_14 fishing_trol_1
20	0	0	0	#_15 fishing_trol_2
20	0	0	0	#_16 fishing_trol_4
15	0	0	4	#_17 llcpue1       
15	0	0	5	#_18 llcpue2       
15	0	0	6	#_19 llcpue3       
15	0	0	7	#_20 llcpue4       
#
#_SizeSelex
#_No size_selex_parm
#_AgeSelex
  1	12	 7.00000	 7	   3	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_gi_1(1)   
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_gi_1(1)   
-10	 9	-1.00000	-1	   3	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_gi_1(1)   
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_gi_1(1)   
-10	 9	-6.00000	-6	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_gi_1(1)   
 -9	 5	-2.00000	-2	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_gi_1(1)   
  1	40	10.00000	10	   5	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_gi_4(2)   
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_gi_4(2)   
-10	 9	-1.00000	-1	   3	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_gi_4(2)   
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_gi_4(2)   
-10	 9	-6.00000	-6	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_gi_4(2)   
 -9	 5	-2.00000	-2	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_gi_4(2)   
  8	18	14.00000	14	   2	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_hd_1(3)   
  2	 6	 4.00000	 4	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_hd_1(3)   
  8	18	14.00000	14	   2	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_ll_1(4)   
  2	 6	 4.00000	 4	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_ll_1(4)   
  8	18	14.00000	14	   2	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_ll_2(5)   
  2	 6	 4.00000	 4	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_ll_2(5)   
  8	18	14.00000	14	   2	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_ll_3(6)   
  2	 6	 4.00000	 4	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_ll_3(6)   
  8	18	14.00000	14	   2	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_ll_4(7)   
  2	 6	 4.00000	 4	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_ll_4(7)   
  1	10	 3.00000	 3	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_other_1(8)
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_other_1(8)
 -7	 5	-2.00000	-2	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_other_1(8)
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_other_1(8)
-10	 9	-6.00000	-6	   1	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_other_1(8)
 -9	 9	-3.00000	-3	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_other_1(8)
  1	10	 3.00000	 3	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_other_4(9)
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_other_4(9)
 -7	 5	-2.00000	-2	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_other_4(9)
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_other_4(9)
-10	 9	-6.00000	-6	   1	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_other_4(9)
 -9	 9	-3.00000	-3	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_other_4(9)
  1	10	 3.00000	 3	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_bb_1(10)  
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_bb_1(10)  
 -7	 5	-2.00000	-2	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_bb_1(10)  
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_bb_1(10)  
-10	 9	-6.00000	-6	   1	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_bb_1(10)  
 -9	 9	-3.00000	-3	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_bb_1(10)  
  1	12	 7.00000	 7	   3	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_ps_1(11)  
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_ps_1(11)  
-10	 9	-1.00000	-1	   3	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_ps_1(11)  
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_ps_1(11)  
-10	 9	-6.00000	-6	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_ps_1(11)  
 -9	 5	-2.00000	-2	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_ps_1(11)  
  1	12	 7.00000	 7	   3	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_ps_2(12)  
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_ps_2(12)  
-10	 9	-1.00000	-1	   3	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_ps_2(12)  
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_ps_2(12)  
-10	 9	-6.00000	-6	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_ps_2(12)  
 -9	 5	-2.00000	-2	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_ps_2(12)  
  1	12	 7.00000	 7	   3	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_ps_4(13)  
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_ps_4(13)  
-10	 9	-1.00000	-1	   3	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_ps_4(13)  
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_ps_4(13)  
-10	 9	-6.00000	-6	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_ps_4(13)  
 -9	 5	-2.00000	-2	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_ps_4(13)  
  1	10	 3.00000	 3	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_trol_1(14)
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_trol_1(14)
 -7	 5	-2.00000	-2	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_trol_1(14)
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_trol_1(14)
-10	 9	-6.00000	-6	   1	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_trol_1(14)
 -9	 9	-3.00000	-3	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_trol_1(14)
  1	10	 3.00000	 3	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_trol_2(15)
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_trol_2(15)
 -7	 5	-2.00000	-2	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_trol_2(15)
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_trol_2(15)
-10	 9	-6.00000	-6	   1	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_trol_2(15)
 -9	 9	-3.00000	-3	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_trol_2(15)
  1	10	 3.00000	 3	   1	6	 3	0	0	0	0	0	0	0	#_AgeSel_P_1_fishing_trol_4(16)
-20	-3	-9.70313	-3	1000	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_2_fishing_trol_4(16)
 -7	 5	-2.00000	-2	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_3_fishing_trol_4(16)
 -5	 9	 3.00000	 3	   1	6	 4	0	0	0	0	0	0	0	#_AgeSel_P_4_fishing_trol_4(16)
-10	 9	-6.00000	-6	   1	6	-5	0	0	0	0	0	0	0	#_AgeSel_P_5_fishing_trol_4(16)
 -9	 9	-3.00000	-3	   1	6	 5	0	0	0	0	0	0	0	#_AgeSel_P_6_fishing_trol_4(16)
#_no timevary selex parameters
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
1 # TG_custom:  0=no read; 1=read if tags exist
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_1  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_2  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_3  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_4  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_5  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_6  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_7  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_8  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_9  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_10 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_11 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_12 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_13 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_14 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_15 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_16 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_17 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_18 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_19 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_20 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_21 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_22 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_23 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_24 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_25 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_26 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_27 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_28 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_29 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_30 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_31 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_32 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_33 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_34 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_35 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_36 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_37 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_38 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_39 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_40 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_41 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_42 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_43 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_44 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_45 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_46 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_47 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_48 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_49 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_50 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_51 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_52 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_53 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_54 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_55 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_56 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_57 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_58 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_59 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_60 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_61 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_62 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_63 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_64 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_65 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_66 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_67 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_68 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_69 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_70 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_71 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_72 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_73 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_74 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_75 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_76 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_77 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_78 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_79 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_80 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_81 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_82 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_83 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_84 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_85 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_86 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_87 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_88 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_89 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_90 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_91 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_92 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_93 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_94 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_95 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_96 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_97 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_98 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_99 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_100
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_101
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_102
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_103
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_104
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_105
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_106
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_107
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_108
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_109
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_110
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_111
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_112
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_113
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_114
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_115
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_116
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_117
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_118
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_119
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_120
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#__TG_Loss_init_121
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_1  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_2  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_3  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_4  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_5  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_6  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_7  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_8  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_9  
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_10 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_11 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_12 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_13 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_14 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_15 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_16 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_17 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_18 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_19 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_20 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_21 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_22 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_23 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_24 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_25 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_26 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_27 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_28 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_29 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_30 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_31 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_32 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_33 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_34 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_35 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_36 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_37 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_38 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_39 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_40 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_41 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_42 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_43 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_44 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_45 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_46 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_47 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_48 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_49 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_50 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_51 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_52 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_53 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_54 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_55 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_56 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_57 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_58 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_59 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_60 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_61 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_62 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_63 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_64 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_65 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_66 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_67 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_68 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_69 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_70 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_71 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_72 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_73 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_74 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_75 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_76 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_77 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_78 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_79 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_80 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_81 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_82 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_83 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_84 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_85 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_86 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_87 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_88 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_89 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_90 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_91 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_92 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_93 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_94 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_95 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_96 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_97 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_98 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_99 
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_100
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_101
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_102
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_103
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_104
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_105
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_106
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_107
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_108
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_109
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_110
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_111
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_112
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_113
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_114
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_115
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_116
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_117
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_118
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_119
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_120
-15	10	-10	-10	0.001	1	-4	0	0	0	0	0	0	0	#_TG_Loss_chronic_121
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_1  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_2  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_3  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_4  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_5  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_6  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_7  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_8  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_9  
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_10 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_11 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_12 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_13 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_14 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_15 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_16 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_17 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_18 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_19 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_20 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_21 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_22 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_23 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_24 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_25 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_26 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_27 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_28 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_29 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_30 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_31 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_32 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_33 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_34 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_35 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_36 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_37 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_38 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_39 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_40 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_41 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_42 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_43 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_44 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_45 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_46 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_47 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_48 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_49 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_50 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_51 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_52 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_53 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_54 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_55 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_56 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_57 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_58 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_59 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_60 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_61 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_62 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_63 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_64 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_65 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_66 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_67 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_68 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_69 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_70 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_71 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_72 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_73 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_74 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_75 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_76 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_77 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_78 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_79 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_80 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_81 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_82 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_83 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_84 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_85 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_86 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_87 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_88 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_89 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_90 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_91 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_92 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_93 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_94 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_95 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_96 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_97 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_98 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_99 
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_100
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_101
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_102
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_103
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_104
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_105
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_106
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_107
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_108
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_109
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_110
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_111
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_112
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_113
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_114
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_115
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_116
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_117
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_118
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_119
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_120
1	10	7	7	0.001	1	-4	0	0	0	0	0	0	0	#_TG_overdispersion_121
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_1 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_2 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_3 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_4 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_5 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_6 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_7 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_8 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_9 
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_10
-20	20	 10	 10	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_11
-20	20	 10	 10	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_12
-20	20	 10	 10	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_13
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_14
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_15
-20	20	-20	-20	2	6	-6	0	0	0	0	0	0	0	#_TG_report_fleet_par_16
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_1 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_2 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_3 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_4 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_5 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_6 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_7 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_8 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_9 
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_10
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_11
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_12
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_13
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_14
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_15
-4	0	0	0	2	6	-4	0	0	0	0	0	0	0	#_TG_report_decay_par_16
# Input variance adjustments factors: 
#_Factor Fleet Value
-9999 1 0 # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 2 changes to default Lambdas (default value is 1.0)
#_like_comp	fleet	phase	value	sizefreq_method
   17	1	1	1.00	1	#_F-ballpark_fishing_gi_1_Phz1
   17	1	4	0.01	1	#_F-ballpark_fishing_gi_1_Phz4
-9999	0	0	0.00	0	#_terminator                  
#
0 # 0/1 read specs for more stddev reporting
#
999
