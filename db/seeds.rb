# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# TODO: drop tables first
u = User.create(first_name: "thea", last_name: "harvey-brown", password: "Welcome1", email: "tharveybrown@gmail.com")
ent = Entity.create(name: "EJI")
exp = Expense.create(user: u, entity: ent, amount: 10.5, recurring: false)


r1 = ResourceOrg.create(name:"Room to Read", description:"Room to Read seeks to transform the lives of millions of children in low-income communities by focusing on literacy and gender equality in education. Working in collaboration with local communities, partner organizations and governments, we develop literacy skills and a habit of reading among primary school children, and support girls to complete secondary school with the relevant life skills to succeed in school and beyond.", website:"https://www.roomtoread.org/", image:"https://pbs.twimg.com/profile_images/769217849470619648/hHeKiLwY_400x400.jpg", category:"education", donate:"https://give.roomtoread.org/give/278379/#!/donation/checkout?c_src=General-Fundraising&c_src2=COVID19-Website-Header-Education-Endures", location:"San Francisco, USA", scope:"Global")
r2 = ResourceOrg.create(name:"Eden Reforestation Projects", description:"Eden Reforestation projects reduces extreme poverty and restores healthy forests by employing local villagers to plant millions of trees every year.", website:"https://edenprojects.org/", image:"https://eralytics.com/wp-content/uploads/Eden.org_RGB-620x176.jpg", category:"Climate Change", donate:"https://edenprojects.org/donate/", location:"Glendora, USA", scope:"Nepal, Madagascar, Haiti, Indonesia, Mozambique and Kenya")
r3 = ResourceOrg.create(name:"Sightsavers Inc.", description:"We treat and prevent eye conditions such as cataracts, trachoma and refractive error. We help to fight five debilitating diseases that affect more than a billion people around the world. We campaign for disability rights so people with disabilities can participate equally in society.", website:"https://www.sightsavers.org/", image:"https://www.raffleplayer.com/uploads/68/sightsavers_logo_1_resized.png", category:"Health", donate:"https://donate.sightsavers.org/countries/us/appeals/web2020us?_ga=2.42821541.1660755381.1594240396-435872379.1594240396", location:"Boston, USA", scope:"India")
r4 = ResourceOrg.create(name:"Veterans of Foreign Wars of the United States", description:"Assisting needy veterans, military personnel and their families, advocacy for veterans and active duty personnel, historical education and commemoration, promoting patriotism, youth activities and community service.", website:"https://www.vfw.org/", image:"https://wgxa.tv/resources/media/db051077-1944-4a4e-b1e2-f50ac559a20b-large16x9_vfw.PNG?1588254713378", category:"Veterans", donate:"https://heroes.vfw.org/page/21776/donate/1?ea.tracking.id=homepage", location:"Kansas City, USA", scope:"USA")
r5 = ResourceOrg.create(name:"", description:"", website:"", image:"", category:"", donate:"", location:"", scope:"")
r6 = 
r7 = 
