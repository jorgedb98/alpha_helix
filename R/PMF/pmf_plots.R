
library(ggplot2)

c <- scan("c_vacuum.out")
w <- scan("w_vacuum.out")
c_dis <- abs(c - 7) # Transform to distances
w_20 <- w[1:20001]
c_20 <- c_dis[1:20001]
pmf_vacuum <- data.frame("Extension" = c_20, "PMF" = w_20, "Environment" = "Vacuum")

c <- scan("c_water.out")
w <- scan("w_water.out")
c_dis <- abs(c - 7) # Transform to distances
w_20 <- w[1:20001]
c_20 <- c_dis[1:20001]
pmf_water <- data.frame("Extension" = c_20, "PMF" = w_20, "Environment" = "Water")

pmf <- rbind(pmf_water, pmf_vacuum)
pmf$Environment <- factor(pmf$Environment, levels = c("Water", "Vacuum"))

ggplot(pmf) +
  geom_line(aes(Extension,PMF, group=1))+ facet_grid(Environment~.) +
  theme_bw()+
  labs(title = "PMF for unfolding in different environments",
       subtitle = "At 25 ºC") +
  theme(title = element_text(face = "bold"), plot.subtitle = element_text(face = "italic"))+
  xlab("end-to-end distance (Å)") + ylab("PMF (kcal/mol)") +
  theme(axis.title=element_text(size=14,face="bold")) +
  ggsave(filename = "plot.png", width = 6.5, height = 5.5, dpi=2000)
