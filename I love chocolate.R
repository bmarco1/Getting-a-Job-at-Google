
colnames(Chocolate) <- c("company", "bean.bar.origin", "ref", "date", "percent", "location", "rating", "beantype", "origin")
loca <- group_by(Chocolate, location)
good <- summarise(loca, count=n(), rate1 = mean(rating))
good1 <- arrange(good, desc(rate1))

ggplot(good1, aes(x= reorder(location,rate1), y=rate1)) +
 geom_point(aes(size = count, color = factor(rate1)), alpha=1/2) +
 theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none") +
 labs(x= "Country", "Chocolate Rating", "Chocolate Rating Vs Country")

orig <- group_by(Chocolate, origin, location)
orig1 <- summarise(orig, count=n(), rate4 = mean(rating))
orig2 <- filter(orig1, count >=20)

ggplot(orig2, aes(location, origin, fill=rate4)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low="green", high="red")+
  labs(x="Country", "Bean Origin", title="Chocolate Bar Heatmap", subtitle= "Country vs bean Origin", fill="Rating")

