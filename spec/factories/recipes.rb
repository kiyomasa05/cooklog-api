FactoryBot.define do
  factory :recipe do
    user_id{FactoryBot.create(:user).id}
    title { Faker::Games::Pokemon.name }
    # image {Faker::Name.name}
    time_required { 30 }
    food { Faker::JapaneseMedia::OnePiece.akuma_no_mi  }
    process { Faker::JapaneseMedia::SwordArtOnline.game_name }
    association :user
  end
  # after(:build) do |image|
  #   image.attached = fixture_file_upload("/files/test_image.jpg")
  # end
end


