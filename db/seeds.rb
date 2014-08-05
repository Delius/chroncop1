# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

condition_names = ["Fibromyalgia", "Arthritis"]
condition_names.each{ |d| ConditionName.where(:name => d).first_or_create }

symptom_names = ["Widespread pain", "Extreme sensitivity", "Stiffness","Fatigue","Poor sleep quality","fibro-fog", "Headaches","IBS","dizziness","restless legs","anxiety","depression"]
symptom_names.each{ |d| SymptomName.where(:name => d).first_or_create }

tip_types = ["Exercise", "Resistance exercises","Pacing","Relaxation","Sleeping Habits"]
tip_types.each{ |d| TipType.where(:name => d).first_or_create }