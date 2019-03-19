#plot of AQI to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=users_Street30, y=AQI))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ylim(0,500)+
ggtitle("Users street 30 to AQI")
#plot of PM10 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=users_Street30, y=PM10))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to PM10")
#plot of PM2.5 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=users_Street30, y=PM2.5))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to PM2.5")
#plot of AQI to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=avg_Speed, y=AQI))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ylim(0,500)+
ggtitle("Average speed to AQI")
#plot of NO2 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=users_Street30, y=NO2))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
#plot of AQI to average T
ggplot(data = Total) +
geom_point(mapping = aes(x=Avg_T, y=AQI))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ylim(0,500)+
ggtitle("Avg T to AQI")
#plot of NO2 to average T
ggplot(data = Total) +
geom_point(mapping = aes(x=Avg_T, y=NO2))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Avg T to NO2")
#plot of NO2 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=users_Street30, y=NO2, color=Daytype))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
#plot of NO2 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=users_Street30, y=log(NO2), color=Daytype))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
#plot of NO2 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=users_Street30, y=log(NO2), color=Season))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
#plot of NO2 to users street 30
ggplot(data = head(Total,10)) +
geom_point(mapping = aes(x=users_Street30, y=log(NO2), color=Season))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
#plot of NO2 to users street 30
ggplot(data = head(Total,100)) +
geom_point(mapping = aes(x=users_Street30, y=log(NO2), color=Season))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
#plot of NO2 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=users_Street30, y=O3, color=Season))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
#plot of NO2 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=T_max, y=O3, color=Season))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
#plot of NO2 to users street 30
ggplot(data = Total) +
geom_point(mapping = aes(x=Date, y=O3, color=Season))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
# ylim(0,500)+
ggtitle("Users street 30 to NO2")
mod = lm(Total$O3~Total$T_max)
summary(mod)
res = mod$residuals
plot(x=Total$Date, y=res)
plot(x=na.omit(Total$Date), y=res)
plot(x=na.omit(Total)$Date, y=res)
dim(na.omit(Total))
dim(res)
length(res)
dim(Total)
df <- Total[!is.na(Total$T_max)]
df <- Total[!is.na(Total$T_max),]
dim(df)
summary(Total$Date)
df <- na.omit(Total)
mod = lm(df$O3~df$T_max)
res = mod$residuals
dim(df)
length(res)
plot(x=df$Date, y=res)
#plot of AQI to average T
ggplot(data = Total) +
geom_point(mapping = aes(x=Avg_T, y=O3))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ggtitle("Avg T to AQI")
#plot of AQI to average T
ggplot(data = Total) +
geom_point(mapping = aes(x=Avg_T, y=T_max))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ggtitle("Avg T to AQI")
plot(x=df$Date, y=df$users_Street30)
#plot of AQI to average T
ggplot(data = Total) +
geom_point(mapping = aes(x=Date, y=users_Street30, color=Daytype))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ggtitle("Avg T to AQI")
#plot of AQI to average T
ggplot(data = Total) +
geom_point(mapping = aes(x=Date, y=users_Street30, color=Season))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ggtitle("Avg T to AQI")
df <- df %>% mutate(res)
#plot of AQI to average T
ggplot(data = df) +
geom_point(mapping = aes(x=Date, y=res, color=Season))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ggtitle("Avg T to AQI")
#plot of AQI to average T
ggplot(data = df) +
geom_point(mapping = aes(x=Date, y=res, color=Daytype))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ggtitle("Avg T to AQI")
#plot of AQI to average T
ggplot(data = df) +
geom_line(mapping = aes(x=Date, y=res, color=Daytype))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ggtitle("Avg T to AQI")
#plot of AQI to average T
ggplot(data = head(df,1000)) +
geom_line(mapping = aes(x=Date, y=res, color=Daytype))+
# geom_smooth(mapping = aes(x= Date, y=AQI))+
ggtitle("Avg T to AQI")
mod = gam(O3~T_max+s(Date,k=40), data=df)
library(mgcv)
mod = gam(O3~T_max+s(Date,k=40), data=df)
mod = gam(O3~T_max+s(1:nrow(df),k=40), data=df)
nrow(df)
mod = gam(O3~T_max+s(1:1889,k=40), data=df)
mod = gam(O3~T_max, data=df)
mod = gam(O3~T_max+s(1:1889,k=40,bs="ps"), data=df)
d = 1:1889
mod = gam(O3~T_max+s(d,k=40,bs="ps"), data=df)
plot(mod)
summary(mod)
mod = gam(O3~s(T_max,k=40,bs="ps"), data=df)
summary(mod)
plot(mod)
mod = gam(O3~T_max+s(T_max,k=40,bs="ps"), data=df)
plot(mod)
mod = gam(O3~T_max+s(d,k=5,bs="ps"), data=df)
summary(mod)
plot(mod)
mod = gam(O3~T_max+s(d,k=10,bs="ps"), data=df)
summary(mod)
plot(mod)
mod2 = gam(res~s(d,k=10,bs="ps"), data=df)
plot(x=d,y=res)
lines(x=d,y=mod2$fitted.values)
mod2 = gam(res~s(d,k=20,bs="ps"), data=df)
lines(x=d,y=mod2$fitted.values)
mod = gam(O3~T_max+s(d,k=20,bs="ps"), data=df)
summary(mod)
plot(mod)
mod = gam(O3~s(T_max,k=10,bs="ps")+s(d,k=20,bs="ps"), data=df)
summary(mod)
plot(mod)
