FactoryBot.define do
  factory :portfolio do
    text { 'techcampの最終課題です' }
    url { 'http://test.com' }
    title { 'furima' }
    language { 'ruby' }
    association :user
  end
end
