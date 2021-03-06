# Mehmet Gonen (mehmet.gonen@gmail.com)

kbmf1k1k_semisupervised_classification_variational_test <- function(Kx, Kz, state) {
  Gx <- list(mu = crossprod(state$Ax$mu, Kx))

  Gz <- list(mu = crossprod(state$Az$mu, Kz))

  F <- list(mu = crossprod(Gx$mu, Gz$mu))

  prediction <- list(Gx = Gx, Gz = Gz, F = F)
}