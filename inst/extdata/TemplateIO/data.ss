#V3.30
#C data file created using the SS_writedat function in the R package r4ss
#C should work with SS version:
#C file write time: 2019-09-16 00:37:36
#
1 #_styr
256 #_endyr
1 #_nseas
3 #_months_per_seas
2 #_Nsubseasons
1 #_spawn_month
1 #_Nsexes
28 #_Nages
1 #_N_areas
8 #_Nfleets
#_fleetinfo
#_type	surveytiming	area	units	need_catch_mult	fleetname
1	0.5	1	2	0	fishing_gi   	#_1
1	0.5	1	2	0	fishing_hd   	#_2
1	0.5	1	2	0	fishing_ll   	#_3
1	0.5	1	2	0	fishing_other	#_4
1	0.5	1	2	0	fishing_bb   	#_5
1	0.5	1	2	0	fishing_ps   	#_6
1	0.5	1	2	0	fishing_trol 	#_7
3	0.5	1	2	0	llcpue       	#_8
#_Catch data
#_year	season	fleet	catch	catch_se
    1	1	1	  27.050278	0.01	#_1             
-9999	0	0	   0.000000	0.00	#_terminator
#_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; >=30 for special types
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet	Units	Errtype	SD_Report
1	0	0	0	#_fishing_gi   
2	0	0	0	#_fishing_hd   
3	0	0	0	#_fishing_ll   
4	0	0	0	#_fishing_other
5	0	0	0	#_fishing_bb   
6	0	0	0	#_fishing_ps   
7	0	0	0	#_fishing_trol 
8	0	0	0	#_llcpue       
#
#_CPUE_data
#_year	seas	index	obs	se_log
81 	1	8	1.441462	0.2	#_1         
-9999	0	0	   0.000000	0.00	#_terminator
0 #_N_discard_fleets
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal
#
#_discard_fleet_info
#
#_discard_data
#
#_meanbodywt
0 #_use_meanbodywt
 #_DF_for_meanbodywt_T-distribution_like
#
#_population_length_bins
3 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
39 #_N_lbinspop
#_lbin_vector_pop
10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 105 110 115 120 125 130 135 140 145 150 155 160 165 170 175 180 185 190 195 200 #_lbin_vector_pop
1 #_use_lencomp
#
#_len_info
#_mintailcomp	addtocomp	combine_M_F	CompressBins	CompError	ParmSelect	minsamplesize
1e-05	1e-07	0	0	0	0	1	#_fishing_gi   
1e-05	1e-07	0	0	0	0	1	#_fishing_hd   
1e-05	1e-07	0	0	0	0	1	#_fishing_ll   
1e-05	1e-07	0	0	0	0	1	#_fishing_other
1e-05	1e-07	0	0	0	0	1	#_fishing_bb   
1e-05	1e-07	0	0	0	0	1	#_fishing_ps   
1e-05	1e-07	0	0	0	0	1	#_fishing_trol 
1e-05	1e-07	0	0	0	0	1	#_llcpue       
39 #_N_lbins
#_lbin_vector
10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 105 110 115 120 125 130 135 140 145 150 155 160 165 170 175 180 185 190 195 200 #_lbin_vector
#
#_lencomp
#_Yr	Seas	FltSvy	Gender	Part	Nsamp	l10	l15	l20	l25	l30	l35	l40	l45	l50	l55	l60	l65	l70	l75	l80	l85	l90	l95	l100	l105	l110	l115	l120	l125	l130	l135	l140	l145	l150	l155	l160	l165	l170	l175	l180	l185	l190	l195	l200
   93	1	1	0	0	5	0	0	  0.00000	 0.00000	  0.00000	    0.0	     0.00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	     0.0000	6.31640e+03	3.15820e+03	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	3.15820e+03	3.15820e+03	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	     0.00	    0.00000	    0.0	    0.00	    0.0	    0.0	 0.0	0	0	#_1         
-9999	0	0	0	0	0	0	0	  0.00000	 0.00000	  0.00000	    0.0	     0.00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	     0.0000	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	0.00000e+00	     0.00	    0.00000	    0.0	    0.00	    0.0	    0.0	 0.0	0	0	#_terminator
0 #_N_agebins
#
#_MeanSize_at_Age_obs
0 #_use_MeanSize_at_Age_obs
0 #_N_environ_variables
0 #_N_sizefreq_methods
1 #_do_tags
1 #_N_tag_groups
1 #_N_recap_events
4 #_mixing_latency_period
16 #_max_periods
#_TG	Area	Yr	Season	tfill	Gender	Age	Nrelease
  1	1	214	1	214	0	 2	   2.7	#_1  
#_TG	Yr	Season	Fleet	Nrecap
  1	219	1	11	  1	#_1  
0 #_morphcomp_data
0 #_use_selectivity_priors
#
999
