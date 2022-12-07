heart=data.frame(name=c("동길","하이","오류"), age=c("23","22",NA))
heart$name=ifelse(heart$name=="오류","정상",heart$name)