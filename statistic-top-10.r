#install.packages("arules")

library(arules)

filename <- "transaksi_retail.tsv"
top_rank <- 10


transaksi_tabular <- read.transactions(
  file="transaksi_retail.tsv",
  format="single",
  sep="\t",
  cols=c(1,2),
  skip=1
)

summary(transaksi_tabular)

data_item <- itemFrequency(
  transaksi_tabular, type="absolute"
)

data_item <- sort(
  data_item, decreasing = TRUE
)[1:top_rank]

data_item <- data.frame(
  "Nama.Produk" = names(
    data_item
  ),
  "Jumlah" = data_item,
  row.names = NULL 
)

summary(data_item)

write.csv(
  data_item, file = "top10_item_retail.txt"
)
