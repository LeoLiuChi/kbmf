# Mehmet Gonen (mehmet.gonen@gmail.com)

kbmf1k1mkl_supervised_classification_variational_test <- function(Kx, Kz, state) {
  Nz <- dim(Kz)[2]
  Pz <- dim(Kz)[3]
  R <- dim(state$Ax$mu)[2]

  Gx <- list(mu = crossprod(state$Ax$mu, Kx))

  Gz <- list(mu = array(0, c(R, Nz, Pz)))
  for (n in 1:Pz) {
    Gz$mu[,,n] <- crossprod(state$Az$mu, Kz[,,n])
  }
  Hz <- list(mu = matrix(0, R, Nz))
  for (n in 1:Pz) {
    Hz$mu <- Hz$mu + state$ez$mu[n] * Gz$mu[,,n]
  }

  F <- list(mu = crossprod(Gx$mu, Hz$mu))

  prediction <- list(Gx = Gx, Gz = Gz, Hz = Hz, F = F)
}