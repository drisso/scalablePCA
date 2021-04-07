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
#caricare il dataset 

time <- Output_time_tempo3metodi_ila
sub_time_table <- temp_table




fig1_time <- sub_time_table %>% 
  #dplyr::filter(method == "BiocSingular") %>% 
  dplyr::group_by(method, ncells) %>%
  dplyr::summarize(elapsed_mean = mean(elapsed_time/60), elapsed_sd = sd(elapsed_time/60))
# readr::write_csv(fig1_time, path = here("main", "csv-tables", "fig1-time.csv"))


sub_time_plot <- sub_time_table %>% 
  #dplyr::filter(method == "BiocSingular") %>%
  dplyr::group_by(method, ncells) %>%
  dplyr::summarize(mean_elapsed = mean(elapsed_time/60), sd = sd(elapsed_time/60)) %>%
  ggplot(aes(x = ncells, y = mean_elapsed, color = method)) +
  geom_line() +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin=mean_elapsed-sd, ymax=mean_elapsed+sd), width=.2,
                position=position_dodge(0.05)) +
  labs(title = "Elapsed time for increasing number of cells") + 
  xlab("Number of cells") + 
  ylab("Elapsed time (mins)") + 
  theme(legend.position = "top", legend.justification= "center")
 
sub_time_plot



p1 <- ggdraw() +
  draw_plot(as_ggplot(my_legend), x = 0, y = 0.96, width = 1, height = 0.05) + 
  draw_plot(sub_mem_plot, x = 0, y = 0.48, width = 1, height = .48) +
  draw_plot(sub_time_plot, x = 0, y = 0, width = 1, height = .48) +
  draw_plot_label(label = LETTERS[1:2], size = 25,
                  x = c(0, 0), y = c(0.98, 0.51))

p1
pdf(here::here("main", "figs", "fig-real-timeandmemory-bs500.pdf"), 
    width = 6, height =8)
print(p1)
dev.off()