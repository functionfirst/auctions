auctions = Auction.create([
  {
    name: 'Tall Cross Body Bag in Yellow',
    start_date: DateTime.now,
    end_date: 3.days.from_now,
    start_amount: 46.0
  },
  {
    name: 'Chinese Green Ground Vase',
    start_date: DateTime.now,
    end_date: 5.days.from_now,
    start_amount: 100.0
  }
])

user = User.create(email: 'test@test.com', password: 'apassword', password_confirmation: 'apassword')

Bid.create(value: 48, auction: auctions.first, user_id: user.id)
