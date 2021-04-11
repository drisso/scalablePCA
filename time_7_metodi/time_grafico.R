# grafico time

library(here)
library(tidyr)
library(dplyr)
library(ggplot2)
library(cowplot)
library(ggpubr)
library(gridExtra)
library(grid)
library(here)
theme_set(theme_cowplot())
#caricare il dataset time_table

#grafico completo
sub_time_table <- time_table

sub_time_plot <- sub_time_table %>% 
  #dplyr::filter(method == "BiocSingular") %>%
  dplyr::group_by(method, ncells) %>%
  dplyr::summarize(mean_elapsed = mean(elapsed_time/60), sd = sd(elapsed_time/60)) %>%
  ggplot(aes(x = ncells, y = mean_elapsed, color = method)) +
  scale_x_continuous(breaks=c(100000,500000,1000000,1300000), labels=c("100k", "500k", "1M", "1.3M"))+
  geom_line() +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin=mean_elapsed-sd, ymax=mean_elapsed+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(title = "Elapsed time for increasing number of cells") + 
  xlab("Number of cells") + 
  ylab("Elapsed time (mins)") + 
  theme(legend.position = "top", legend.justification= "center")

sub_time_plot

#grafico senza BiocSingular_Exact

sub_time_table2 <- time_table2

sub_time_plot2 <- sub_time_table2 %>% 
  #dplyr::filter(method == "BiocSingular") %>%
  dplyr::group_by(method, ncells) %>%
  dplyr::summarize(mean_elapsed = mean(elapsed_time/60), sd = sd(elapsed_time/60)) %>%
  ggplot(aes(x = ncells, y = mean_elapsed, color = method)) +
  scale_x_continuous(breaks=c(100000,500000,1000000,1300000), labels=c("100k", "500k", "1M", "1.3M"))+
  geom_line() +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin=mean_elapsed-sd, ymax=mean_elapsed+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(title = "Elapsed time for increasing number of cells") + 
  xlab("Number of cells") + 
  ylab("Elapsed time (mins)") + 
  theme(legend.position = "top", legend.justification= "center")
X11()
sub_time_plot2


