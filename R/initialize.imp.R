initialize.imp <- function(data, m, ignore, where, blocks, visitSequence,
                           method, nmis, data.init) {
  imp <- vector("list", ncol(data))
  names(imp) <- names(data)
  r <- !is.na(data)
  for (h in visitSequence) {
    for (j in blocks[[h]]) {
      y <- data[, j]
      ry <- r[, j] & !ignore
      wy <- where[, j]
      imp[[j]] <- as.data.frame(matrix(NA, nrow = sum(wy), ncol = m))
      dimnames(imp[[j]]) <- list(row.names(data)[wy], 1:m)
      if (method[h] != "") {
        for (i in seq_len(m)) {
          if (nmis[j] < nrow(data) && is.null(data.init)) {
            imp[[j]][, i] <- mice.impute.sample(y, ry, wy = wy)
          } else if (!is.null(data.init)) {
            imp[[j]][, i] <- data.init[wy, j]
          } else {
            if (is.factor(y)) {
              imp[[j]][, i] <- sample(levels(y), nrow(data), replace = TRUE)
            } else {
              imp[[j]][, i] <- rnorm(nrow(data))
            }
          }
        }
      }
    }
  }
  imp
}
