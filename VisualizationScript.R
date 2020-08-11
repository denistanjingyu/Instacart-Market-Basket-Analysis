products <- fread('products.csv')
order_products <- fread('order_products__train.csv')

popularprod <- order_products %>% 
  group_by(product_id) %>% 
  summarize(count = n()) %>% 
  top_n(10, wt = count) %>%
  inner_join(select(products, product_id, product_name), by = "product_id") %>%
  arrange(desc(count)) 

ggplot(data = popularprod, aes(x = reorder(product_name, -count), y = count)) +
  geom_bar(stat = "identity", fill = "maroon") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), axis.title.x = element_blank()) +
  labs(title = "Most popular products")

reorderedprod <- order_products %>% 
  group_by(product_id) %>% 
  summarize(proportion_reordered = mean(reordered), n = n()) %>% 
  filter(n > 40) %>% 
  top_n(10, wt = proportion_reordered) %>% 
  arrange(desc(proportion_reordered)) %>% 
  inner_join(products, by = "product_id")

ggplot(data = reorderedprod, aes(x = reorder(product_name, -proportion_reordered), y = proportion_reordered)) +
  geom_bar(stat = "identity",fill = "dark blue") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), axis.title.x = element_blank()) + coord_cartesian(ylim = c(0.85, 0.95)) +
  labs(title = "Probablility of products being reordered")
