# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
shay = User.create(username:"Shay", password: "abc123")
todd = User.create(username:"Todd", password: "abc123")

Place.create(user_id: User.first.id, name:"Camp Tejas", address:"4224 Lake Lane Georgetown, TX 78654", price:"$", category:"Park", notes:"Very cool place to stay!  Great lake with views. Stayed in spot 2", image:"https://tpwd.texas.gov/fishboat/fish/recreational/lakes/images/georgetown.gif")

Place.create(name:"Mandolas", address:"12100 W Parmer Ln #200, Cedar Park, TX 78613", price:"$$", category:"Restaurant", notes:"Best chicken parm, EVER!", image:"https://20i9ea3qmneuwphgwbjhfu16-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/mandolascp-124-copy.jpg", user_id: User.last.id)

Place.create(name:"Main Street Social", address:"1651 TX-332 Loop, Liberty Hill, TX 78642", price:"$", category:"Restaurant", notes:"This place has 5 restaurants, and a cool arcade. The burgers were amazing, but the pizza was not very good.", image:"https://images.squarespace-cdn.com/content/v1/5c0193e73917eeb5b9220dd7/1544132116142-TQDCRF1FUPXCSMVRG7P5/Render-camera-1-update-2.jpg?format=2500w", user_id: User.first.id)


Place.create(name:"Camp Longhorn at Inks Lake", address:"Camp Longhorn Rd, Burnet, TX 78611", price:"$$", category:"Park", notes:"This place has waterfront camping, but you have to book very early.", image:"https://res.cloudinary.com/sagacity/image/upload/c_crop,h_2000,w_3000,x_0,y_0/c_limit,dpr_auto,f_auto,fl_lossy,q_80,w_1080/inks-late-1_cqlfft.jpg", user_id: User.first.id)


Place.create(name:"Chuys", address:"4911 183A, Cedar Park, TX 78613", price:"$$", category:"Restaurant", notes:"The jalepeno dip is amazing", image:"https://patch.com/img/cdn20/users/22021430/20170602/075603/styles/raw/public/article_images/chuys_tex-mex_exterior-1496404247-3625.jpg", user_id: User.last.id)