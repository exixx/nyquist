require(ggplot2)
require(reshape2)
require(dplyr)


make_config <- function (rows, cols) { #}, row_names, col_names) {
  a <- array(0, 
            dim = c(rows, cols),
            #dimnames = list(c(row_names), c(col_names))
  )
  b <- data.frame(a)
  return(b)
}

num_samp <- 5000
num_freq <- 1024

a_frame <- make_config(num_samp, num_freq)

az_deg <- seq(0, 359.5, length.out = num_samp)
az_rad <- seq(0, 2 * pi, length.out = num_samp)

drive_func <- function (amp, omega, ttt) {
  a_line <-  amp *cos((omega* pi/85)* ttt )
}

amps <- 1:num_freq
#amps <- amps[amps %% 100==0]




for( ii in 1:num_freq) {
  a_frame[ii] <- drive_func(ii,5, az_deg)
  
}
jj <- 1:num_freq 
#jj <- jj[jj %% 10==0]

a_frame[jj,] <- a_frame[jj,] *jj/200

plot_frame <- a_frame[amps %% 100 == 0]
n.f <- length(plot_frame)

plot_frame <- cbind(az_rad, plot_frame)


names(plot_frame) <- c("Az", paste0('F', seq(1,n.f)))

colrs <- rainbow(n.f)

file_name <- "Lots 'o Sines"


plot_frame.melt <- melt(plot_frame, id.vars = "Az", variable.name = "Freq", value.name = "Amplitude")

p<- ggplot(plot_frame.melt) +
  aes(x = Az, y = Amplitude, group = Freq, colour = Freq) +
  labs(x = "Azimuth (degrees or something)", y = "Some Bullshit Magnitude (dB Bullshit)", title = paste("Test Plot", file_name, sep = ' - ')) +
  theme(plot.title = element_text(hjust = 0.5), legend.position = 'none') +
  scale_alpha_identity() +
  geom_line()
show(p)
# 
# 
# plotaline <- function(xx) {plot(1:num_samp,a_frame[,xx], 
#                                 type = "l",
#                                 col = colrs[xx],
#                                 ylim = range(a_frame[,xx]),#*(3/5),
#                                 ylab = "Some Bullshit Magnitude (dB Bullshit)",
#                                 xlab = "Azimuth (degrees or something))",
#                                 main = paste("Test Plot", file_name),
#                                 bg = "white",
#                                 axes = FALSE
# )}
# 
# add_a_line <- function(xx) {lines(1:num_samp,a_frame[,xx], 
#                               type = "l",
#                               col = colrs[xx],
#                               #ylim = range(a_frame[,xx]),
#                               ylab = "Some Bullshit Magnitude (dB Bullshit)",
#                               xlab = "Azimuth (degrees or something))",
#                               main = paste("Test Plot", file_name),
#                               bg = "white"
# )}
# 
# divisor <- 300
# 
# 
# 
# plotaline(num_freq)
# 
# for (i in seq(num_freq, 1, by = -100)) {
#   add_a_line(i)
# }
# 

#cols <- colors(distinct = TRUE)
