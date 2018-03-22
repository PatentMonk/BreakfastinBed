class Factories
  def Factories.user
    u = User.new({
      email: Faker::Internet.email
    })
    u.skip_confirmation!
    u
  end

  def Factories.purchaser
    u = Purchaser.new({
      email: Faker::Internet.email
    })
    u.skip_confirmation!
    u
  end

  def Factories.address
    Address.new({
      address_one: Faker::Address.street_address,
      address_two: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      postal: Faker::Address.zip
    })
  end

  def Factories.restaurant
    Restaurant.new({
      name: Faker::Lorem.word
    })
  end

  def Factories.description
    Description.new({
      content: Faker::Lorem.paragraph
    })
  end

  def Factories.schedule
    Schedule.new({
      monday_opens_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      monday_closes_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      tuesday_opens_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      tuesday_closes_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      wednesday_opens_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      wednesday_closes_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      thursday_opens_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      thursday_closes_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      friday_opens_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      friday_closes_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      saturday_opens_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      saturday_closes_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      sunday_opens_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
      sunday_closes_at: Faker::Time.between(DateTime.now - 1, DateTime.now)
    })
  end

  def Factories.order_food_item
    OrderFoodItem.new({
      name: Faker::Lorem.word,
      price: Faker::Number.decimal(2),
      image_url: Faker::Internet.url
    })
  end

  def Factories.restaurant_food_item
    RestaurantFoodItem.new({
      name: Faker::Lorem.word,
      price: Faker::Number.decimal(2),
      image_url: Faker::Internet.url
    })
  end

  def Factories.payment
    Payment.new
  end

  def Factories.order
    Order.new
  end

  def Factories.credit_card
    CreditCard.new
  end
end
