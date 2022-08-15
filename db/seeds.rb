# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
salesforce = Topic.find_or_initialize_by(title: 'Salesforce')
salesforce.description = 'Salesforce is a multi-tenant cloud platform that delivers CRM services. With its many Cloud addons (Experience Cloud, Marketing Cloud, Commerce Cloud, etc.), it can be tailored to fit many different kinds of business needs. Learn more at <a href="https://www.salesforce.com">https://www.salesforce.com</a>.'
salesforce.banner = 'salesforce_banner.jpg'
salesforce.move = '-25'
salesforce.save!

devOps = Topic.find_or_initialize_by(title: 'DevOps')
devOps.description = 'DevOps is more than just source control and CI/CD. DevOps encompasses everything from how and where stories are written and stored, to how tasking is managed, the approach to source control (ie. branching strategies), development practices, environment management, to deployment strategies and more!'
devOps.banner = 'devOps_banner.jpg'
devOps.move = '-22'
devOps.save!

leadership = Topic.find_or_initialize_by(title: 'Leadership')
leadership.description = 'Leadership can take many forms, but the concept at its innermost core is enabling those around oneself to be successful. We will dive deeper into this subject to explore what makes a great leader and some pitfalls to avoid.'
leadership.banner = 'leadership_banner.jpg'
leadership.move = '-38'
leadership.save!

tech = Topic.find_or_initialize_by(title: 'Tech')
tech.description = 'This category is quite broad and may cover product reviews, Android vs Apple discussions, IDEs, other software reviews, and much more.'
tech.banner = 'tech_banner.jpg'
tech.move = '-38'
tech.save!

fitness = Topic.find_or_initialize_by(title: 'Fitness')
fitness.description = 'Fitness may look different to each individual. I will share the knowledge and experiences I’ve gained on my own fitness journey.'
fitness.banner = 'fitness_banner.jpg'
fitness.move = '-38'
fitness.save!

travel = Topic.find_or_initialize_by(title: 'Travel')
travel.description = 'Planning trips can be a nightmare and getting tips for traveling to certain places can be the difference between a fun trip or a plethora of headaches. I will give reviews and share lessons learned and tips on traveling to the places I have visited.'
travel.banner = 'travel_banner.jpg'
travel.move = '-49'
travel.save!

lifestyle = Topic.find_or_initialize_by(title: 'Lifestyle')
lifestyle.description = 'Lifestyle is my catch-all category where I can stash reflections, ideas, goals, book reviews, and other things I’ve learned about that don’t fall into another category.'
lifestyle.banner = 'lifestyle_banner.jpg'
lifestyle.move = '-38'
lifestyle.save!