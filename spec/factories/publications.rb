# frozen_string_literal: true

require 'faker'

# Una factory nos permitirá crear de manera sencilla instancias de una clase con diferentes valores
# y sin la necesidad de que nosotros le asignemos los parámetros al momento de crearla.
places = ['San Joaquín', 'Casa Central', 'Lo Contador', 'Oriente', 'Villarica', 'Providencia',
          'Puente Alto', 'La Reina', 'San Bernardo', 'Ñuñoa']
FactoryBot.define do
  factory :publication do
    title { Faker::Lorem.words(number: rand(10..20)) }
    content { Faker::Lorem.paragraph }
    day { Faker::Date.forward(days: rand(1..30)) }
    departure_time { Faker::Time.forward(days: rand(1..24)) }
    person_limit { rand(1..9) }
    origin { places.sample }
    destination { places.sample }
    association :user, factory: :user
  end
end
