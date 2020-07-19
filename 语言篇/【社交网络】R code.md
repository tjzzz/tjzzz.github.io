# 【社交网络】R code
```


setwd("~/Desktop/wangluo")

#friends.whole <- read.table("facebook-wosn-links/facebook-wosn-links-clean.txt",  header=FALSE, sep=" ", col.names=c("from","to"))
dat <- read.table("friends_sample", header=F, sep=" ")


friends.whole <- dat[,c(1,2)]
colnames(friends.whole)=c("from","to")


library(igraph)

######## -------------------------------------
# # 将所有用户按照好友数量倒序排序
# sort(table(c(friends.whole$from, friends.whole$to)), dec=T)
# # 选定拥有合适好友数量的用户
# uid <- 196513
# # 好友ID
# friends.connected <- unique(c(friends.whole$to[friends.whole$from == uid], 
#                               friends.whole$from[friends.whole$to == uid]))
# # 选取该用户所有好友
# friends.sample <- friends.whole[
#   ((friends.whole$from %in% friends.connected) & 
#      (friends.whole$to %in% friends.connected)), c(1,2)]

#### ---------------------------------------

friends.sample <- friends.whole
# 创建graph对象，并去除循环
friends.graph <- graph.data.frame(d = friends.sample, 
                                  directed = T, vertices = unique(c(friends.sample$from, 
                                                                    friends.sample$to)))

friends.graph <- simplify(friends.graph)
is.simple(friends.graph)

# 去除孤立的点，其实本例中并不存在孤立点，但作为标准化操作保留
dg <- degree(friends.graph)
friends.graph <- induced.subgraph(friends.graph, 
                                  which(dg > 0))


#
plot(friends.graph, layout = layout.fruchterman.reingold, 
     vertex.size = 2.5, vertex.label = NA, edge.color = 
       grey(0.5), edge.arrow.mode = "-")





# 子群分割
friends.com = walktrap.community(friends.graph, steps=100)
# 返回每个节点的分组结果
V(friends.graph)$sg = friends.com$membership
# 按照分组结果赋予节点不同的颜色
V(friends.graph)$color = NA
V(friends.graph)$color = rainbow(max(V(friends.graph)$sg))[V(friends.graph)$sg]

plot(friends.graph, layout = layout.fruchterman.reingold, 
     vertex.size = 3, vertex.color = V(friends.graph)$color, 
     vertex.label = NA, edge.color = grey(0.5), edge.arrow.mode = "-")


communities(friends.com)



#
# V(friends.graph)$btn = betweenness(friends.graph, directed = F)
# plot(V(friends.graph)$btn, xlab="Vertex", ylab="Betweenness")
# 
# V(friends.graph)$size = 5
# V(friends.graph)[btn>=500]$size = 15
# V(friends.graph)$label = NA
# V(friends.graph)[btn>=500]$label = V(friends.graph)[btn>=500]$name
# 
# plot(friends.graph, layout = layout.fruchterman.reingold, 
#      vertex.size = V(friends.graph)$size, 
#      vertex.color = V(friends.graph)$color, 
#      vertex.label = V(friends.graph)$label, 
#      edge.color = grey(0.5),
#      edge.arrow.mode = "-")

graph <- make_graph(~ 26609-90509,
                    26564-90509,
                    26579-90509,
                    222007-90509,
                    477268-90509,
                    90555-90509,
                    477227-90509,
                    364487-347924,
                    90556-347924,
                    347921-347924,
                    90507-347924,
                    412547-90556,
                    90555-90556,
                    90526-90556,
                    384748-347924,
                    381115-347924,
                    449268-219419,
                    154837-219419,
                    412488-219419,
                    90556-219419,
                    26579-347924,
                    283491-347924,
                    477255-219419,
                    26553-219419,
                    154867-90556,
                    412486-219419,
                    26602-90556,
                    283529-90556,
                    477227-347924,
                    26609-219419,
                    26564-219419,
                    255754-90556,
                    477226-219419)

plot(graph)


```

