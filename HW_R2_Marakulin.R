library(readxl)
patients <- read_excel("./Пациенты.xlsx")
# 1                                                                                             
str(patients$Возраст)
str(patients$глюкоза)

# 2
patients$Пол <- toupper(patients$Пол)
patients$Пол <- factor(patients$Пол, levels=c("М", "Ж"))
levels(patients$Пол)

# 3
patients$возраст_группа_2 <- cut(patients$Возраст, 
                                 breaks = c(min(patients$Возраст-1), 60, max(patients$Возраст)),
                                 labels = c("Молодые", "Старшие"))

# 4
patients[patients$Возраст > 75,]

# 5
head(patients$лейкоциты)
summary(patients$лейкоциты)
head(patients$глюкоза)
summary(patients$глюкоза)

# 6
aggregate(глюкоза ~ Пол, data=patients, mean)

# 7
aggregate(лейкоциты ~ Пол + возраст_группа_2, data=patients, mean)

# 8/9
res_ag <- aggregate(глюкоза ~ Пол, data=patients, FUN = function(x) 
  c(mean = mean(x), sd = sd(x), n = length(x)))
res <- data.frame(Пол = res_ag$Пол, Mean = res_ag$глюкоза[, "mean"],
                  SD = res_ag$глюкоза[, "sd"], N = res_ag$глюкоза[, "n"])
res

# 10
library(ggplot2)
ggplot(patients, aes(x = Пол, y = глюкоза)) + geom_boxplot() + 
  labs(title = "Уровень глюкозы") + theme(plot.title = element_text(hjust = 0.5))

# 11
t.test(лейкоциты ~ Пол, data = patients)
# H0: нет различий по уровню лейкоцитов в зависимости от пола
# H1: уровни лейкоцитов у мужчин и женщин различаются
# p-value=0,09 (>0,05) -> Н0 не отвергается, 
# т.е. статистически значимых различий по уровню лейкоцитов в зависимости от пола нет

# Симуляция пропусков
patients_task <- patients
patients_task$глюкоза[c(3, 15, 45)] <- NA

# 12
sum(is.na(patients_task))

# 13
which(is.na(patients_task$глюкоза))

# 14
patients_no_na <- na.omit(patients_task)
dim(patients_no_na)
dim(patients_task)

# 15
patients_task$глюкоза[is.na(patients_task$глюкоза)] <- median(patients_task$глюкоза, na.rm = TRUE)
                                                            
# 16
aggregate(лейкоциты ~ Пол, data = patients_task, mean, na.rm = TRUE)
aggregate(лейкоциты ~ Пол, data = patients_no_na, mean, na.rm = TRUE)
#Результаты отличаются для групп по полу "Ж", т.к. в случае patients_no_na
#были удалены все строки с NA, в т.ч. и в столбце лейкоциты, 
#в котором исходно NA не было

# 17
final_result <- aggregate(гемоглобин ~ возраст_группа_2, data = patients_task, 
                          FUN = function(x) c(mean = mean(x, na.rm = TRUE), 
                                              sd = sd(x, na.rm = TRUE)))
final_result <- data.frame(Возраст_группа = final_result$возраст_группа_2,
                           Средний_гемоглобин = final_result$гемоглобин[, "mean"],
                           Станд_откл = final_result$гемоглобин[, "sd"])
final_result

# 18
write.csv(final_result, "анализ гемоглобина.csv")


