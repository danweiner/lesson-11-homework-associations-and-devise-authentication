# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




articles = Article.create!([
    {
      title: "Hillary Clinton Pleasantly Surprised After Finding Old $20,000 Donation Check In Coat Pocket", 
      body: "Smiling at her good fortune following the unexpected discovery, Democratic presidential candidate Hillary Clinton was reportedly pleasantly surprised Friday upon finding an old $20,000 donation check in her coat pocket."
    },
    {
      title: "GOP Leaders Assure Sobbing Rubio It Not His Fault Party Splitting Up",
      body: "In an effort to comfort the distraught former presidential candidate, top GOP leaders reportedly sat down next to a sobbing Marco Rubio Thursday and assured him that it wasn’t his fault the Republican Party was splitting up."
    },
    {
      title: "Obama Receives Classified Briefing On Likelihood Of ‘Krull’ Reboot",
      body: "Shortly after arriving in the Oval Office early Thursday morning, President Obama reportedly met with key advisors to receive his daily classified briefing on the likelihood of a reboot of the 1983 science-fiction film Krull."
    }
  ])