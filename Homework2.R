# Monte Carlo Simulation
d = 5
mu = 0 
s = 0.005 
num.of.sim = N
num.of.days = 100

data = matrix(rnorm(num.of.sim*num.of.days, mean = mu, sd = s), nrow = num.of.days)
data[1,] = 0L 
for (N in seq(10, num.of.days, 10)) {
  select.data = data[1:N, ]
  cumret = select.data + 1L
  cumretpath = apply(cumret, 2, cumprod)
  plot(
    x = 1:N, 
    y = cumretpath[,1],
    main = paste0("Monte Carlo Simulation", "\nMean = ", mu, "SD = ", s),
    type = "l",
    col = 1,
    xlim = c(1, num.of.days), 
    ylim = c(min(cumretpath), max(cumretpath)) )
  for (i in 2:num.of.sim) {lines(x = 1:N, y = cumretpath[, i], type = "l", col = i)}
}

