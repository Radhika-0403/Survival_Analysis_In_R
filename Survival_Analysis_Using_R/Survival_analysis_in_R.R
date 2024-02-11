install.packages(c("survival","ranger","ggplot",
                   "dplyr","ggfortify"))

library(survival)
library(ranger)
library(ggplot2)
library(dplyr)
library(ggfortify)
library(tidyverse)
library(survminer)
install.packages(c("survival","ranger","ggplot",
                   "dplyr","ggfortify"))
df=read.csv(file.choose(),header = TRUE)
mod.df=survfit(Surv(cv$DIFFERENCE.TIME.1,cv$Status == 1)~1)
mod.df
autoplot(mod.df)
summary(mod.df, times = c(0,5,10,15,20,25,30,60,90*(1:10)))
km_trt_fit <- survfit(Surv(cv$DIFFERENCE.TIME.1,cv$Status) ~ Location, data=df)
autoplot(km_trt_fit)
ggsurvplot(mod.df, fun = function(y) -log(y),data = df)
ggsurvplot(mod.df,data=df)
