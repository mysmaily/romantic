puts 'Resets'
Category.delete_all
User.delete_all
Product.delete_all
Photo.delete_all

puts 'Create category'
10.times do 
  category = Category.create!(:name => Settings.category.name.sample, 
                   :name_vn => Settings.category.name_vn.sample, 
                   :update_at => Time.now, :created_at => Time.now)
  6.times do
    category.products << Product.create(title: Settings.category.name.sample,
                                        description: Settings.category.name_vn.sample,
                                        price: rand(1000..10000),
                                        price_sale: rand(500..5000),
                                        image: File.open("#{Rails.root}/app/assets/images/product/#{rand(1..6)}.jpg"))
    3.times do
      Photo.create(:photo => File.open("#{Rails.root}/app/assets/images/product/#{rand(1..6)}.jpg"))
    end
  end
end
puts 'Create User'
User.create!(first_name: "Hoang", last_name: "Nguyen", 
             email: "hoangnt@hus.edu.vn", password: 'handoichantinh', 
             password_confirmation: 'handoichantinh', role: 'admin')