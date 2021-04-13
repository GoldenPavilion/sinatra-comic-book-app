#Create Users

bebop = User.create(username: "Bebop", email: "bebop@technodrome.com", password: "password") 
rocksteady = User.create(username: "Rocksteady", email: "rocksteady@technodrome.com", password: "password")

#Create Comics

tmnt76 = Comic.create(title: "Teenage Mutant Ninja Turtles", issue: 76, arc: "Invasion of the Triceratons", writer: "Kevin Eastman", artist: "Damien Courciero", rating: 8, user_id: bebop.id)
tmnt82 = Comic.create(title: "Teenage Mutant Ninja Turtles", issue: 82, arc: "The Rat King", writer: "Kevin Eastman", artist: "David Wachter", rating: 6, user_id: bebop.id)
aphra26 = Comic.create(title: "Doctor Aphra", issue: 26, arc: "N/A", writer: "Simon Spurrier", artist: "Emilio Laiso", rating: 4, user_id: bebop.id)
vader18 = Comic.create(title: "Darth Vader", issue: 18, arc: "Bad Ground", writer: "Charles Soule", artist: "Giuseppe Camuncoli", rating: 9, user_id: rocksteady.id)
batman48 = Comic.create(title: "Batman", issue: 48, arc: "The Best Man", writer: "Tom King", artist: "Mikel Janin", rating: 8, user_id: rocksteady.id)