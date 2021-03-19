# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  email: "test_admin@gmail.com",
  password: "test_admin",
  password_confirmation: "test_admin"
  )

Member.create(
  full_name: "test_user",
  full_name_kana: "テストユーザー",
  email: "test_user@gmail.com",
  password: "test_user",
  password_confirmation: "test_user",
  withdrawal_status: true
  )

Pizza.create(
  [
    {pizza_name: "マルゲリータ", price: 2000, pizza_size: 0, sales_status: 0, image: File.open("./app/assets/images/aoki_malgerita.jpg")},
    {pizza_name: "マルゲリータ", price: 2400, pizza_size: 1, sales_status: 0, image: File.open("./app/assets/images/aoki_malgerita.jpg")},
    {pizza_name: "マルゲリータ", price: 2800, pizza_size: 2, sales_status: 0, image: File.open("./app/assets/images/aoki_malgerita.jpg")},
    {pizza_name: "マリナーラ", price: 1600, pizza_size: 0, sales_status: 0 , image: File.open("./app/assets/images/marinara.jpg")},
    {pizza_name: "ペスカトーレ", price: 2300, pizza_size: 2, sales_status: 0, image: File.open("./app/assets/images/pescatole.jpeg")},
    {pizza_name: "オルトナーラ", price: 1800, pizza_size: 1, sales_status: 0, image: File.open("./app/assets/images/ortolana.jpeg")},
    {pizza_name: "パルマ", price: 1500, pizza_size: 0, sales_status: 0, image: File.open("./app/assets/images/parma.jpeg")},
    {pizza_name: "サルモーネ", price: 3000, pizza_size: 1, sales_status: 0, image: File.open("./app/assets/images/salmone.jpg")},
    {pizza_name: "クアトロ・フォルマッジ", price: 3000, pizza_size: 0, sales_status: 0, image: File.open("./app/assets/images/folmazzi.jpeg")},
    {pizza_name: "バンビーノ", price: 2400, pizza_size: 2, sales_status: 0, image: File.open("./app/assets/images/bambino.jpg")},
    {pizza_name: "ビスマルク", price: 2200, pizza_size: 1, sales_status: 0, image: File.open("./app/assets/images/bismalc_pizza.jpg")},
    {pizza_name: "ボスカイオーラ", price: 2700, pizza_size: 2, sales_status: 0, image: File.open("./app/assets/images/boscayolla.jpg")},
    {pizza_name: "ビアンカ", price: 1200, pizza_size: 0, sales_status: 0, image: File.open("./app/assets/images/bianca.jpg")},
    {pizza_name: "ビアンカ", price: 1550, pizza_size: 1, sales_status: 0, image: File.open("./app/assets/images/bianca.jpg")},
    {pizza_name: "ビアンカ", price: 1800, pizza_size: 2, sales_status: 0, image: File.open("./app/assets/images/bianca.jpg")},
    {pizza_name: "クアトロ・スタジーニ", price: 1800, pizza_size: 1, sales_status: 0, image: File.open("./app/assets/images/kuatoro_stajini.jpg")}
  ]
  )  