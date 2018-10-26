# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "User 1")

Game.create(start_time: DateTime.now, updated_time: DateTime.now, user_id: 1)
# Producer.create(name: "Producer 1", amount: 1, base_rate: 5, price: 100, game_id: 1)
# Producer.create(name: "Producer 2", amount: 1, base_rate: 25, price: 1000, game_id: 1)
# Producer.create(name: "Producer 3", amount: 1, base_rate: 10, price: 500, game_id: 1)

# Upgrade.create(name: "2x Upgrade 3", price: 10, function_name:"2x", amount: 1)
# Upgrade.create(name: "5x Upgrade 1", price: 10, function_name: "5x", amount: 1)

# UpgradePurchase.create(upgrade_id: 1, game_id: 1)
# UpgradePurchase.create(upgrade_id: 2, game_id: 1)

# Stock.create(resource_name: "Resource 1", amount: 1, game_id: 1)
