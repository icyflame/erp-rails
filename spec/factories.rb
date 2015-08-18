FactoryGirl.define do
  factory :StudentMember do
      email "aabb@hh.de"
      name "AA BB"
      rollnum "13TH12345"
      password "ruby12345"
  end
  factory :Coordinator do
      email "aabb@hh.de"
      name "AA BB"
      rollnum "13TH12345"
      password "ruby12345"
  end
  factory :Sponsor do
    company "some_string_value"
    type_of_sponsorship "some_string_value"
    person "some_string_value"
    mobile_phone "some_string_value"
    office_phone "some_string_value"
    email1 "some_string_value"
    email2 "some_string_value"
    designation "some_string_value"
    alumnus "some_string_value"
    batch "some_string_value"
    dept "some_string_value"
    hall "some_string_value"
    first_date "some_string_value"
    comments "some_string_value"
    next_date "some_string_value"
    proposal_sent "some_string_value"
    remarks "some_string_value"
    status "some_string_value"
  end
  factory :Alumni do
    name 'some value!'
    year '2015'
    hall 'some value!'
    department 'some value!'
  end
end
