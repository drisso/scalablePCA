#csv time
#carico file RData per ogni metodo 

# m01 BiocSingularRandom

data100_m01<- data.frame(dataset = "TENxBrain_100k",
                     ncells = 100000,
                     method = "BiocSingular_Random",
                     user_time = time100k_01[1],
                     system_time = time100k_01[2],
                     elapsed_time = time100k_01[3])

data500_m01<- data.frame(dataset = "TENxBrain_500k",
                     ncells = 500000,
                     method = "BiocSingular_Random",
                     user_time = time500k_01[1],
                     system_time = time500k_01[2],
                     elapsed_time = time500k_01[3])

data1000_m01<- data.frame(dataset = "TENxBrain_1000k",
                      ncells = 1000000,
                      method = "BiocSingular_Random",
                      user_time = time1000k_01[1],
                      system_time = time1000k_01[2],
                      elapsed_time = time1000k_01[3])

data1300_m01<- data.frame(dataset = "TENxBrain_1.3M",
                          ncells = 1300000,
                          method = "BiocSingular_Random",
                          user_time = time1.3M_01[1],
                          system_time = time1.3M_01[2],
                          elapsed_time = time1.3M_01[3])

data_m01 <- rbind(data100_m01, data500_m01, data1000_m01, data1300_m01)

# m02 BiocSingularIrlba

data100_m02<- data.frame(dataset = "TENxBrain_100k",
                         ncells = 100000,
                         method = "BiocSingular_Irlba",
                         user_time = time100k_02[1],
                         system_time = time100k_02[2],
                         elapsed_time = time100k_02[3])

data500_m02<- data.frame(dataset = "TENxBrain_500k",
                         ncells = 500000,
                         method = "BiocSingular_Irlba",
                         user_time = time500k_02[1],
                         system_time = time500k_02[2],
                         elapsed_time = time500k_02[3])

data1000_m02<- data.frame(dataset = "TENxBrain_1000k",
                          ncells = 1000000,
                          method = "BiocSingular_Irlba",
                          user_time = time1000k_02[1],
                          system_time = time1000k_02[2],
                          elapsed_time = time1000k_02[3])

data1300_m02<- data.frame(dataset = "TENxBrain_1.3M",
                          ncells = 1300000,
                          method = "BiocSingular_Irlba",
                          user_time = time1.3M_02[1],
                          system_time = time1.3M_02[2],
                          elapsed_time = time1.3M_02[3])

data_m02 <- rbind(data100_m02, data500_m02, data1000_m02, data1300_m02)

# m03 BiocSingularExact

data100_m03<- data.frame(dataset = "TENxBrain_100k",
                         ncells = 100000,
                         method = "BiocSingular_Exact",
                         user_time = time100k_03[1],
                         system_time = time100k_03[2],
                         elapsed_time = time100k_03[3])

data500_m03<- data.frame(dataset = "TENxBrain_500k",
                         ncells = 500000,
                         method = "BiocSingular_Exact",
                         user_time = time500k_03[1],
                         system_time = time500k_03[2],
                         elapsed_time = time500k_03[3])

data1000_m03<- data.frame(dataset = "TENxBrain_1000k",
                          ncells = 1000000,
                          method = "BiocSingular_Exact",
                          user_time = time1000k_03[1],
                          system_time = time1000k_03[2],
                          elapsed_time = time1000k_03[3])

data1300_m03<- data.frame(dataset = "TENxBrain_1.3M",
                          ncells = 1300000,
                          method = "BiocSingular_Exact",
                          user_time = time1.3M_03[1],
                          system_time = time1.3M_03[2],
                          elapsed_time = time1.3M_03[3])

data_m03 <- rbind(data100_m03, data500_m03, data1000_m03, data1300_m03)

# m04 Scanpy_in_R

data100_m04<- data.frame(dataset = "TENxBrain_100k",
                         ncells = 100000,
                         method = "Scanpy_in_R",
                         user_time = time100k_04[1],
                         system_time = time100k_04[2],
                         elapsed_time = time100k_04[3])

data500_m04<- data.frame(dataset = "TENxBrain_500k",
                         ncells = 500000,
                         method = "Scanpy_in_R",
                         user_time = time500k_04[1],
                         system_time = time500k_04[2],
                         elapsed_time = time500k_04[3])

data1000_m04<- data.frame(dataset = "TENxBrain_1000k",
                          ncells = 1000000,
                          method = "Scanpy_in_R",
                          user_time = time1000k_04[1],
                          system_time = time1000k_04[2],
                          elapsed_time = time1000k_04[3])

data1300_m04<- data.frame(dataset = "TENxBrain_1.3M",
                          ncells = 1300000,
                          method = "Scanpy_in_R",
                          user_time = time1.3M_04[1],
                          system_time = time1.3M_04[2],
                          elapsed_time = time1.3M_04[3])

data_m04 <- rbind(data100_m04, data500_m04, data1000_m04, data1300_m04)

# m05 Scanpy_in_Python

data100_m05<- data.frame(dataset = "TENxBrain_100k",
                         ncells = 100000,
                         method = "Scanpy_in_Python",
                         user_time = 1,
                         system_time = 1,
                         elapsed_time = time100k_05)

data500_m05<- data.frame(dataset = "TENxBrain_500k",
                         ncells = 500000,
                         method = "Scanpy_in_Python",
                         user_time = 1,
                         system_time = 1,
                         elapsed_time = time500k_05)

data1000_m05<- data.frame(dataset = "TENxBrain_1000k",
                          ncells = 1000000,
                          method = "Scanpy_in_Python",
                          user_time = 1,
                          system_time = 1,
                          elapsed_time = time1000k_05)

data1300_m05<- data.frame(dataset = "TENxBrain_1.3M",
                          ncells = 1300000,
                          method = "Scanpy_in_Python",
                          user_time = 1,
                          system_time = 1,
                          elapsed_time = time1.3M_05)

data_m05 <- rbind(data100_m05, data500_m05, data1000_m05, data1300_m05)

# m06 BiocSklearn_in_R

data100_m06<- data.frame(dataset = "TENxBrain_100k",
                         ncells = 100000,
                         method = "BiocSklearn_in_R",
                         user_time = time100k_06[1],
                         system_time = time100k_06[2],
                         elapsed_time = time100k_06[3])

data500_m06<- data.frame(dataset = "TENxBrain_500k",
                         ncells = 500000,
                         method = "BiocSklearn_in_R",
                         user_time = time500k_06[1],
                         system_time = time500k_06[2],
                         elapsed_time = time500k_06[3])

data1000_m06<- data.frame(dataset = "TENxBrain_1000k",
                          ncells = 1000000,
                          method = "BiocSklearn_in_R",
                          user_time = time1000k_06[1],
                          system_time = time1000k_06[2],
                          elapsed_time = time1000k_06[3])

data1300_m06<- data.frame(dataset = "TENxBrain_1.3M",
                          ncells = 1300000,
                          method = "BiocSklearn_in_R",
                          user_time = time1.3M_06[1],
                          system_time = time1.3M_06[2],
                          elapsed_time = time1.3M_06[3])

data_m06 <- rbind(data100_m06, data500_m06, data1000_m06, data1300_m06)


# m07 BiocSklearn_in_Python

data100_m07<- data.frame(dataset = "TENxBrain_100k",
                         ncells = 100000,
                         method = "BiocSklearn_in_Python",
                         user_time = 1,
                         system_time = 1,
                         elapsed_time = time100k_07)

data500_m07<- data.frame(dataset = "TENxBrain_500k",
                         ncells = 500000,
                         method = "BiocSklearn_in_Python",
                         user_time = 1,
                         system_time = 1,
                         elapsed_time = time500k_07)

data1000_m07<- data.frame(dataset = "TENxBrain_1000k",
                          ncells = 1000000,
                          method = "BiocSklearn_in_Python",
                          user_time = 1,
                          system_time = 1,
                          elapsed_time = time1000k_07)

data1300_m07<- data.frame(dataset = "TENxBrain_1.3M",
                          ncells = 1300000,
                          method = "BiocSklearn_in_Python",
                          user_time = 1,
                          system_time = 1,
                          elapsed_time = time1.3M_07)

data_m07 <- rbind(data100_m07, data500_m07, data1000_m07, data1300_m07)

time_table <- rbind(data_m01,
                    #data_m02,
                    data_m03,
                    data_m04,
                    data_m05,
                    data_m06,
                    data_m07)

time_table2 <- rbind(data_m01,
                    #data_m02,
                    #data_m03,
                    data_m04,
                    data_m05,
                    data_m06,
                    data_m07)

#write.table(temp_table, file = here(paste0("main/case_studies/output/Output_time_",
                                           #"tempo3metodi", "_", "ila", ".csv")), sep=",",
            #append = TRUE, quote = FALSE, col.names = FALSE, row.names = TRUE, eol = "\n")
