# db/seeds.rb
Category.create(name: 'Beverages')
Category.create(name: 'Fresh Produce')
Category.create(name: 'Dairy')
Category.create(name: 'Snacks')
Category.create(name: 'Bakery')


# db/seeds.rb
beverages_category = Category.find_by(name: 'Beverages')
fresh_produce_category = Category.find_by(name: 'Fresh Produce')
dairy_category = Category.find_by(name: 'Dairy')
snacks_category = Category.find_by(name: 'Snacks')
bakery_category = Category.find_by(name: 'Bakery')

beverages_category.articles.create(name: 'Tea', description: 'Hot tea', price: 2.5, quantity: 100)
fresh_produce_category.articles.create(name: 'Apples', description: 'Fresh apples', price: 1.0, quantity: 50)
dairy_category.articles.create(name: 'Milk', description: 'Fresh milk', price: 3.0, quantity: 20)
snacks_category.articles.create(name: 'Chips', description: 'Crunchy chips', price: 1.5, quantity: 30)
bakery_category.articles.create(name: 'Bread', description: 'Fresh bread', price: 2.0, quantity: 40)
