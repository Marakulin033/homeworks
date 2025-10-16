
motifs2 <- matrix(c(
  "a", "C", "g", "G", "T", "A", "A", "t", "t", "C", "a", "G",
  "t", "G", "G", "G", "C", "A", "A", "T", "t", "C", "C", "a",
  "A", "C", "G", "t", "t", "A", "A", "t", "t", "C", "G", "G",
  "T", "G", "C", "G", "G", "G", "A", "t", "t", "C", "C", "C",
  "t", "C", "G", "a", "A", "A", "A", "t", "t", "C", "a", "G",
  "A", "C", "G", "G", "C", "G", "A", "a", "t", "T", "C", "C",
  "T", "C", "G", "t", "G", "A", "A", "t", "t", "a", "C", "G",
  "t", "C", "G", "G", "G", "A", "A", "t", "t", "C", "a", "C",
  "A", "G", "G", "G", "T", "A", "A", "t", "t", "C", "C", "G",
  "t", "C", "G", "G", "A", "A", "A", "a", "t", "C", "a", "C"
), nrow = 10, byrow = TRUE)
motifs2

motifs2_up <- apply(motifs2, 2, toupper)
motifs2_up

count_matrix <- apply(motifs2_up,2,function(col) table(factor(col, levels=c("A", "C", "T", "G"))))
count_matrix


profile <- apply(count_matrix,2,function(col) col/sum(col))
profile

scoreMotifs <- sum(apply(motifs2_up,2,function(col) length(col) - max(table(col))))
scoreMotifs

consensus <- apply(profile, 2, function(col) {
  nucleotides <- c("A", "C", "G", "T")
  nucleotides[which.max(col)]
})
consensus_string <- paste(consensus, collapse = "")
consensus_string


barplot(count_matrix[,1], col = "skyblue", main = "Частоты нуклеотидов в 1-м столбце")
