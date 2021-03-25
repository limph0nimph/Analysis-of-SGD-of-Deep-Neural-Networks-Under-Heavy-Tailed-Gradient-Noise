          library(alphastable)
          library(readr)
          
          set.seed(1984)# for reproducibility 
          
          sgn <- read.csv("/home/dimitry/studies/Master/курсач/Experiments/exp_storage/width_32_depth_2_batch_40/sgn_5_samples.csv")
          draw = sgn[1:1500, 47]
          
          # Estimating the parameters of skewed stable distribution with EM-algorithm
          # initial guess about params
          alpha0 = 1.03
          beta0 = 0.17
          sigma0 = 0.008
          mu0 = 0.001
          param=1
          alpha_stable_params <- ufitstab.skew(draw, alpha0, beta0, sigma0, mu0, param)
          
          x <- seq(-0.05, 0.05, 0.001)
          
          # Plotting dists
          hist(draw, breaks=100, freq=FALSE, col="lightblue")
          lines(x, dnorm(x, mean = mean(draw), sd = sd(draw)), col='forestgreen', lwd = 2)
          lines(x, udstab(x, alpha_stable_params$alpha, alpha_stable_params$beta,
                          alpha_stable_params$sigma, alpha_stable_params$mu, 1),
                col = "red3", lwd = 2)
          
          # Определим положение, названия и цвета:
          main = "distributions"
          location = "topright"
          labels = c("Empirical", "Gaussian", "Alpha-stable")
          colors = c("lightblue", "forestgreen", "red3")
          legend(location, labels, title = main, fill=colors, cex = 0.6)
          
          
          # Plotting dists (log scale)
          plot(density(draw, n=50), lwd = 1, type='p', col='black', log='y')
          lines(x, dnorm(x, mean = mean(draw), sd = sd(draw)), col='forestgreen', lwd = 2, log='y')
          lines(x, udstab(x, alpha_stable_params$alpha, alpha_stable_params$beta,
                          alpha_stable_params$sigma, alpha_stable_params$mu, 1), col = "red3", lwd = 2, log='y')
          
          main = "distributions"
          location = "bottom"
          labels = c("Empirical", "Gaussian", "Alpha-stable")
          colors = c("black", "forestgreen", "red3")
          legend(location, labels, title = main, fill=colors, cex = 0.6)
          
          
          # Plotting dists (log-log scale)
          plot(density(draw, n=50), lwd = 1, type='p', log='xy', col='black')
          lines(x, dnorm(x, mean = mean(draw), sd = sd(draw)), col='forestgreen', lwd = 2, log='xy')
          lines(x, udstab(x, alpha_stable_params$alpha, alpha_stable_params$beta,
                          alpha_stable_params$sigma, alpha_stable_params$mu, 1), col = "red3", lwd = 2, log='xy')
          
          # Определим положение, названия и цвета:
          main = "distributions"
          location = "bottomleft"
          labels = c("Empirical", "Gaussian", "Alpha-stable")
          colors = c("black", "forestgreen", "red3")
          
          legend(location, labels, title = main, fill=colors, cex = 0.6)