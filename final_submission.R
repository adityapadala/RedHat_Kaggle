

#ensembing the xgboost and extrapolation method

cat(Sys.time())
cat("Combining two submissions on targeted observations (NAs)\n")

submit1 <- fread("Submission.csv")
submit2 <- fread("model_sub.csv")
submit3 <- merge(submit1[is.na(submit1$filled), ], submit2, by = "activity_id", all.x = T)
submit4 <- merge(submit1, submit3, by = "activity_id", all.x = T)
submit4$filled.x[is.na(submit4$filled.x)] <- submit4$outcome[is.na(submit4$filled.x)]
submit5 <- data.frame(activity_id = submit4$activity_id, outcome = submit4$filled.x, stringsAsFactors = FALSE)
write.csv(submit5, file="mod2908Kaggle_01.csv", row.names=FALSE)
#0.990946