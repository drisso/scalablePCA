#csv time
#carico file RData per ogni metodo 

#BiocSingular

data100<- data.frame(dataset = "TENXBrain_100k",
                  ncells = "100k",
                  method = "BiocSingular",
                  user_time = time100k[1],
                  system_time = time100k[2],
                  elapsed_time = time100k[3])

data500<- data.frame(dataset = "TENXBrain_500k",
                     ncells = "500k",
                     method = "BiocSingular",
                     user_time = time500k[1],
                     system_time = time500k[2],
                     elapsed_time = time500k[3])

data1000<- data.frame(dataset = "TENXBrain_1000k",
                     ncells = "1000k",
                     method = "BiocSingular",
                     user_time = time1000k[1],
                     system_time = time1000k[2],
                     elapsed_time = time1000k[3])

data<- rbind(data100, data500, data1000)

#Scanpy

data100<- data.frame(dataset = "TENXBrain_100k",
                     ncells = "100k",
                     method = "Scanpy",
                     user_time = time100k[1],
                     system_time = time100k[2],
                     elapsed_time = time100k[3])

data500<- data.frame(dataset = "TENXBrain_500k",
                     ncells = "500k",
                     method = "Scanpy",
                     user_time = time500k[1],
                     system_time = time500k[2],
                     elapsed_time = time500k[3])

data1000<- data.frame(dataset = "TENXBrain_1000k",
                      ncells = "1000k",
                      method = "Scanpy",
                      user_time = time1000k[1],
                      system_time = time1000k[2],
                      elapsed_time = time1000k[3])

data1<- rbind(data100, data500, data1000)


#BiocSklearn

data100<- data.frame(dataset = "TENXBrain_100k",
                     ncells = "100k",
                     method = "BiocSklearn",
                     user_time = time100k[1],
                     system_time = time100k[2],
                     elapsed_time = time100k[3])

data500<- data.frame(dataset = "TENXBrain_500k",
                     ncells = "500k",
                     method = "BiocSklearn",
                     user_time = time500k[1],
                     system_time = time500k[2],
                     elapsed_time = time500k[3])

data1000<- data.frame(dataset = "TENXBrain_1000k",
                      ncells = "1000k",
                      method = "BiocSklearn",
                      user_time = time1000k[1],
                      system_time = time1000k[2],
                      elapsed_time = time1000k[3])

data2<- rbind(data100, data500, data1000)

temp_table <- rbind(data, data1, data2)

write.table(temp_table, file = here(paste0("main/case_studies/output/Output_time_",
                                           "tempo3metodi", "_", "ila", ".csv")), sep=",",
            append = TRUE, quote = FALSE, col.names = FALSE, row.names = TRUE, eol = "\n")
