# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
nonprofit1 = Nonprofit.create(name: "Nonprofit 1", address: "123 Fake St", stripe_acct: nil)
nonprofit2 = Nonprofit.create(name: "Nonprofit 2", address: "456 Fake St", stripe_acct: "123")
nonprofit3 = Nonprofit.create(name: "Nonprofit 3", address: "789 Fake St", stripe_acct: nil)
nonprofit4 = Nonprofit.create(name: "Nonprofit 4", address: "123 Real St", stripe_acct: "456")

sent_check1 = Check.create(amount: 200, sent_at: 1.day.ago, nonprofit: nonprofit1)
sent_check2 = Check.create(amount: 300, sent_at: 1.day.ago, nonprofit: nonprofit3)
unsent_check1 = Check.create(amount: 110, nonprofit: nonprofit1)
unsent_check2 = Check.create(amount: 150, nonprofit: nonprofit3)

donation_with_no_check1 = Donation.create(amount: 50, nonprofit: nonprofit1, check: nil)
donation_with_no_check2 = Donation.create(amount: 60, nonprofit: nonprofit2, check: nil)
donation_with_no_check3 = Donation.create(amount: 70, nonprofit: nonprofit3, check: nil)
donation_with_no_check4 = Donation.create(amount: 80, nonprofit: nonprofit3, check: nil)
donation_with_unsent_check1 = Donation.create(amount: 50, nonprofit: nonprofit1, check: unsent_check1)
donation_with_unsent_check2 = Donation.create(amount: 60, nonprofit: nonprofit1, check: unsent_check1)
donation_with_unsent_check3 = Donation.create(amount: 70, nonprofit: nonprofit3, check: unsent_check2)
donation_with_unsent_check4 = Donation.create(amount: 80, nonprofit: nonprofit3, check: unsent_check2)
donation_with_sent_check1 = Donation.create(amount: 200, nonprofit: nonprofit1, check: sent_check1)
donation_with_sent_check2 = Donation.create(amount: 300, nonprofit: nonprofit3, check: sent_check2)
