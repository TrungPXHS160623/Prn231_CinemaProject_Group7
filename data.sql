INSERT INTO [dbo].[Customers] ([FirstName], [LastName], [Email], [Phone], [City], [IsActive])
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Hanoi', 1);

INSERT INTO [dbo].[Employees] ([FullName], [Email], [Phone], [Address], [JobTitle], [Salary], [IsActive], [HireDate])
VALUES 
('Jane Smith', 'jane.smith@example.com', '098-765-4321', '123 Elm Street, Hanoi', 'Manager', 50000.00, 1, '2024-10-01');

INSERT INTO [dbo].[Categories] ([CategoryName], [Description], [IsActive])
VALUES 
('Action', 'High-energy scenes with physical stunts and chases', 1),
('Adventure', 'Exciting stories with new experiences or exotic locales', 1),
('Animation', 'Movies created using animation techniques', 1),
('Biography', 'Films based on the lives of real people', 1),
('Comedy', 'Light-hearted and humorous content', 1),
('Crime', 'Stories about criminal activities and their consequences', 1),
('Documentary', 'Non-fiction films that document reality', 1),
('Drama', 'Serious, plot-driven stories with realistic characters', 1),
('Family', 'Movies suitable for all ages', 1),
('Fantasy', 'Stories set in imaginary worlds with magical elements', 1),
('History', 'Films based on historical events', 1),
('Horror', 'Movies designed to scare and thrill', 1),
('Musical', 'Films that feature songs sung by the characters', 1),
('Mystery', 'Stories focused on solving a puzzle or crime', 1),
('Romance', 'Love stories', 1),
('Sci-Fi', 'Science fiction films with futuristic elements', 1),
('Sport', 'Movies centered around sports and athletes', 1),
('Thriller', 'Films designed to keep you on the edge of your seat', 1),
('War', 'Movies about warfare and military conflicts', 1);

INSERT INTO [dbo].[Concessions] ([ProductName], [Description], [Price], [StockQuantity], [CategoryId], [IsActive])
VALUES 
('Popcorn', 'Classic buttered popcorn', 5000, 100, 1, 1),
('Soda', 'Refreshing carbonated drink', 30000, 200, 1, 1),
('Nachos', 'Crispy nachos with cheese dip', 4500, 50, 1, 1),
('Hot Dog', 'Grilled hot dog with condiments', 6000, 75, 1, 1),
('Candy', 'Assorted candy selection', 2500, 150, 1, 1),
('Ice Cream', 'Various flavors of ice cream', 3500, 80, 1, 1),
('Pretzel', 'Soft pretzel with salt', 4000, 60, 1, 1),
('Water', 'Bottled water', 2000, 100, 1, 1),
('Coffee', 'Hot brewed coffee', 2500, 50, 1, 1),
('Tea', 'Hot brewed tea', 2500, 50, 1, 1),
('Combo 1', 'Popcorn and Soda', 7000, 50, 1, 1),
('Combo 2', 'Nachos and Soda', 6500, 50, 1, 1),
('Combo 3', 'Hot Dog and Soda', 8000, 50, 1, 1),
('Combo 4', 'Popcorn, Soda, and Candy', 9000, 50, 1, 1),
('Combo 5', 'Nachos, Soda, and Candy', 8500, 50, 1, 1);

INSERT INTO [dbo].[Coupons] ([Code], [Discount], [ExpirationDate], [IsActive])
VALUES 
('DISCOUNT10', 10.00, '2025-12-31', 1),
('SAVE20', 20.00, '2025-12-31', 1),
('WEEKDAY15', 15.00, '2025-12-31', 1),
('KIDSPECIAL5', 5.00, '2025-12-31', 1),
('WELCOME10', 10.00, '2025-12-31', 1),
('MOVIE20', 20.00, '2025-11-30', 1),
('HOLIDAY25', 25.00, '2025-12-25', 1),
('WINTER20', 20.00, '2025-12-31', 1);


INSERT INTO [dbo].[GiftCards] ([Code], [Balance], [ExpirationDate], [IsActive])
VALUES 
('GIFT100', 100000.00, '2025-12-31', 1),
('GIFT50', 50000.00, '2025-12-31', 1),
('GIFT25', 25000.00, '2025-12-31', 1),
('GIFT200', 200000.00, '2025-12-31', 1),
('GIFT150', 150000.00, '2025-12-31', 1),
('GIFT75', 750000.00, '2025-12-31', 1),
('GIFT300', 300000.00, '2025-12-31', 1),
('GIFT500', 500000.00, '2025-12-31', 1),
('GIFT10', 10000.00, '2025-12-31', 1),
('GIFT20', 20000.00, '2025-12-31', 1);

INSERT INTO [dbo].[Movies] ([Title], [Description], [Duration], [ReleaseDate], [Language], [Director], [Cast], [AgeRating], [TrailerUrl], [PosterUrl], [IsActive])
VALUES 
('Venom: Let There Be Carnage', 'Eddie Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage and escapes prison after a failed execution.', 109, '2024-10-25', 'English', 'Andy Serkis', 'Tom Hardy, Woody Harrelson, Michelle Williams', 'PG-13', 'https://www.youtube.com/watch?v=-ezfi6FQ8Ds', 'https://image.tmdb.org/t/p/original//rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg', 1),
('A Quiet Place Part II', 'Following the events at home, the Abbott family now face the terrors of the outside world. Forced to venture into the unknown, they realize that the creatures that hunt by sound are not the only threats lurking beyond the sand path.', 97, '2024-10-25', 'English', 'John Krasinski', 'Emily Blunt, Millicent Simmonds, Cillian Murphy', 'PG-13', 'https://www.youtube.com/watch?v=BpdDN9d9Jio', 'https://image.tmdb.org/t/p/original//4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg', 1),
('Black Widow', 'Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.', 134, '2024-10-25', 'English', 'Cate Shortland', 'Scarlett Johansson, Florence Pugh, David Harbour', 'PG-13', 'https://www.youtube.com/watch?v=Fp9pNPdNwjI', 'https://image.tmdb.org/t/p/original//qAZ0pzat24kLdO3o8ejmbLxyOac.jpg', 1),
('No Time to Die', 'James Bond has left active service. His peace is short-lived when Felix Leiter, an old friend from the CIA, turns up asking for help, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.', 163, '2024-10-25', 'English', 'Cary Joji Fukunaga', 'Daniel Craig, Rami Malek, Léa Seydoux', 'PG-13', 'https://www.youtube.com/watch?v=BIhNsAtPbPI', 'https://image.tmdb.org/t/p/original//iUgygt3fscRoKWCV1d0C7FbM9TP.jpg', 1),
('Dune', 'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people.', 155, '2024-10-25', 'English', 'Denis Villeneuve', 'Timothée Chalamet, Rebecca Ferguson, Zendaya', 'PG-13', 'https://www.youtube.com/watch?v=n9xhJrPXop4', 'https://image.tmdb.org/t/p/original//d5NXSklXo0qyIYkgV94XAgMIckC.jpg', 1),
('Shang-Chi and the Legend of the Ten Rings', 'Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.', 132, '2024-10-25', 'English', 'Destin Daniel Cretton', 'Simu Liu, Awkwafina, Tony Leung', 'PG-13', 'https://www.youtube.com/watch?v=8YjFbMbfXaQ', 'https://image.tmdb.org/t/p/original//1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg', 1),
('The Suicide Squad', 'Supervillains Harley Quinn, Bloodsport, Peacemaker, and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.', 132, '2024-10-25', 'English', 'James Gunn', 'Margot Robbie, Idris Elba, John Cena', 'R', 'https://www.youtube.com/watch?v=JuDLepNa7hw', 'https://image.tmdb.org/t/p/original//kb4s0ML0iVZlG6wAKbbs9NAm6X.jpg', 1),
('Free Guy', 'A bank teller discovers that he is actually an NPC inside a brutal, open world video game.', 115, '2024-10-25', 'English', 'Shawn Levy', 'Ryan Reynolds, Jodie Comer, Taika Waititi', 'PG-13', 'https://www.youtube.com/watch?v=cttnRmcr_ME', 'https://image.tmdb.org/t/p/original//xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg', 0),
('Jungle Cruise', 'Dr. Lily Houghton enlists the aid of wisecracking skipper Frank Wolff to take her down the Amazon in his dilapidated boat. Together, they search for an ancient tree that holds the power to heal – a discovery that will change the future of medicine.', 127, '2024-10-25', 'English', 'Jaume Collet-Serra', 'Dwayne Johnson, Emily Blunt, Edgar Ramírez', 'PG-13', 'https://www.youtube.com/watch?v=f_HvoipFcA8', 'https://image.tmdb.org/t/p/original//9dKCd55IuTT5QRs989m9Qlb7d2B.jpg', 0),
('The Green Knight', 'A fantasy re-telling of the medieval story of Sir Gawain and the Green Knight.', 130, '2024-10-25', 'English', 'David Lowery', 'Dev Patel, Alicia Vikander, Joel Edgerton', 'R', 'https://www.youtube.com/watch?v=sS6ksY8xWCY', 'https://image.tmdb.org/t/p/original//xZ2KER2gOHbuHP2GJoODuXDSZCb.jpg', 0);

INSERT INTO [dbo].[Movie_Categories] ([MovieId], [CategoryId])
VALUES 
(1, 1), -- Venom: Let There Be Carnage - Action
(1, 2), -- Venom: Let There Be Carnage - Adventure
(1, 16), -- Venom: Let There Be Carnage - Sci-Fi
(2, 8), -- A Quiet Place Part II - Drama
(2, 12), -- A Quiet Place Part II - Horror
(3, 1), -- Black Widow - Action
(3, 2), -- Black Widow - Adventure
(3, 16), -- Black Widow - Sci-Fi
(4, 1), -- No Time to Die - Action
(4, 2), -- No Time to Die - Adventure
(4, 8), -- No Time to Die - Drama
(5, 2), -- Dune - Adventure
(5, 10), -- Dune - Fantasy
(5, 16), -- Dune - Sci-Fi
(6, 1), -- Shang-Chi and the Legend of the Ten Rings - Action
(6, 2), -- Shang-Chi and the Legend of the Ten Rings - Adventure
(6, 16), -- Shang-Chi and the Legend of the Ten Rings - Sci-Fi
(7, 1), -- The Suicide Squad - Action
(7, 5), -- The Suicide Squad - Comedy
(7, 18), -- The Suicide Squad - Thriller
(8, 5), -- Free Guy - Comedy
(8, 16), -- Free Guy - Sci-Fi
(9, 2), -- Jungle Cruise - Adventure
(9, 8), -- Jungle Cruise - Drama
(10, 2), -- The Green Knight - Adventure
(10, 10), -- The Green Knight - Fantasy
(10, 8); -- The Green Knight - Drama

INSERT INTO [dbo].[Theaters] ([Name], [Address], [Phone], [OpeningHour], [ClosingHour], [IsActive])
VALUES 
('CGV Vincom Center', '191 Bà Triệu, Hai Bà Trưng, Hà Nội', '024-3974-9350', '9:00 AM', '11:00 PM', 1),
('Lotte Cinema', '229 Tây Sơn, Đống Đa, Hà Nội', '024-3562-3535', '10:00 AM', '12:00 AM', 1),
('Galaxy Cinema', '116 Nguyễn Du, Quận 1, TP. Hồ Chí Minh', '028-3822-8533', '9:30 AM', '11:30 PM', 1);

INSERT INTO [dbo].[Rooms] ([TheaterId], [Name], [SeatCapacity], [IsActive])
VALUES 
(1, 'Room A', 56, 1),
(1, 'Room B IMAX', 56, 1),
(1, 'Room C 4D', 56, 1),
(1, 'Room D Dolby Atmos', 25, 1),
(1, 'Room E D-Box', 25, 1),
(2, 'Room A', 56, 1),
(2, 'Room B 4D', 56, 1),
(2, 'Room C IMAX', 56, 1),
(2, 'Room D VIP', 25, 1),
(2, 'Room E Laser Projection', 100, 1),
(3, 'Room A', 56, 1),
(3, 'Room B', 56, 1),
(3, 'Room C IMAX', 56, 1),
(3, 'Room D ScreenX', 25, 1);

INSERT INTO [dbo].[SeatTypes] ([TypeName], [Description], [Price], [IsActive])
VALUES 
('Economic', 'Cheaper seating option', 50000, 1),
('Standard', 'Regular seating', 100000, 1),
('Premium', 'Comfortable seating with extra legroom', 150000, 1),
('IMAX Economic', 'Cheaper seating option in IMAX room', 100000, 1),
('IMAX Standard', 'Regular seating in IMAX room', 150000, 1),
('IMAX Premium', 'Comfortable seating with extra legroom in IMAX room', 200000, 1),
('4D Economic', 'Cheaper seating option in 4D room', 150000, 1),
('4D Standard', 'Regular seating in 4D room', 200000, 1),
('4D Premium', 'Comfortable seating with extra legroom in 4D room', 250000, 1),
('Dolby Atmos Standard', 'Regular seating in Dolby Atmos room', 120000, 1),
('Dolby Atmos Premium', 'Comfortable seating with extra legroom in Dolby Atmos room', 170000, 1),
('VIP Standard', 'Regular seating in VIP room', 180000, 1),
('VIP Premium', 'Comfortable seating with extra legroom in VIP room', 230000, 1),
('ScreenX Standard', 'Regular seating in ScreenX room', 140000, 1),
('ScreenX Premium', 'Comfortable seating with extra legroom in ScreenX room', 190000, 1),
('D-Box Standard', 'Regular seating in D-Box room', 160000, 1),
('D-Box Premium', 'Comfortable seating with extra legroom in D-Box room', 210000, 1),
('Laser Projection Economic', 'Cheaper seating option in Laser Projection room', 100000, 1),
('Laser Projection Standard', 'Regular seating in Laser Projection room', 130000, 1),
('Laser Projection Premium', 'Comfortable seating with extra legroom in Laser Projection room', 180000, 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(1, 1, 'A1', 'A', 1), (1, 1, 'A2', 'A', 1), (1, 1, 'A7', 'A', 1), (1, 1, 'A8', 'A', 1),
(1, 1, 'B1', 'B', 1), (1, 1, 'B2', 'B', 1), (1, 1, 'B7', 'B', 1), (1, 1, 'B8', 'B', 1),
(1, 1, 'C1', 'C', 1), (1, 1, 'C2', 'C', 1), (1, 1, 'C7', 'C', 1), (1, 1, 'C8', 'C', 1),
(1, 1, 'D1', 'D', 1), (1, 1, 'D2', 'D', 1), (1, 1, 'D7', 'D', 1), (1, 1, 'D8', 'D', 1),
(1, 1, 'E1', 'E', 1), (1, 1, 'E2', 'E', 1), (1, 1, 'E7', 'E', 1), (1, 1, 'E8', 'E', 1),
(1, 1, 'F1', 'F', 1), (1, 1, 'F2', 'F', 1), (1, 1, 'F7', 'F', 1), (1, 1, 'F8', 'F', 1),
(1, 1, 'G1', 'G', 1), (1, 1, 'G2', 'G', 1), (1, 1, 'G7', 'G', 1), (1, 1, 'G8', 'G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(1, 2, 'A3', 'A', 1), (1, 2, 'A4', 'A', 1), (1, 2, 'A5', 'A', 1), (1, 2, 'A6', 'A', 1),
(1, 2, 'B3', 'B', 1), (1, 2, 'B4', 'B', 1), (1, 2, 'B5', 'B', 1), (1, 2, 'B6', 'B', 1),
(1, 2, 'C3', 'C', 1), (1, 2, 'C4', 'C', 1), (1, 2, 'C5', 'C', 1), (1, 2, 'C6', 'C', 1),
(1, 2, 'D3', 'D', 1), (1, 2, 'D4', 'D', 1), (1, 2, 'D5', 'D', 1), (1, 2, 'D6', 'D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(1, 3, 'E3', 'E', 1), (1, 3, 'E4', 'E', 1), (1, 3, 'E5', 'E', 1), (1, 3, 'E6','E', 1),
(1, 3, 'F3', 'F', 1), (1, 3, 'F4', 'F', 1), (1, 3, 'F5', 'F', 1), (1, 3, 'F6','F', 1),
(1, 3, 'G3', 'G', 1), (1, 3, 'G4', 'G', 1), (1, 3, 'G5', 'G', 1), (1, 3, 'G6','G', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(1, 4, 'A1', 'A', 1), (1, 4, 'A2', 'A', 1), (1, 4, 'A7', 'A', 1), (1, 4, 'A8', 'A', 1),
(1, 4, 'B1', 'B', 1), (1, 4, 'B2', 'B', 1), (1, 4, 'B7', 'B', 1), (1, 4, 'B8', 'B', 1),
(1, 4, 'C1', 'C', 1), (1, 4, 'C2', 'C', 1), (1, 4, 'C7', 'C', 1), (1, 4, 'C8', 'C', 1),
(1, 4, 'D1', 'D', 1), (1, 4, 'D2', 'D', 1), (1, 4, 'D7', 'D', 1), (1, 4, 'D8', 'D', 1),
(1, 4, 'E1', 'E', 1), (1, 4, 'E2', 'E', 1), (1, 4, 'E7', 'E', 1), (1, 4, 'E8', 'E', 1),
(1, 4, 'F1', 'F', 1), (1, 4, 'F2', 'F', 1), (1, 4, 'F7', 'F', 1), (1, 4, 'F8', 'F', 1),
(1, 4, 'G1', 'G', 1), (1, 4, 'G2', 'G', 1), (1, 4, 'G7', 'G', 1), (1, 4, 'G8', 'G', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(2, 4, 'A1', 'A', 1), (2, 4, 'A2', 'A', 1), (2, 4, 'A7', 'A', 1), (2, 4, 'A8', 'A', 1),
(2, 4, 'B1', 'B', 1), (2, 4, 'B2', 'B', 1), (2, 4, 'B7', 'B', 1), (2, 4, 'B8', 'B', 1),
(2, 4, 'C1', 'C', 1), (2, 4, 'C2', 'C', 1), (2, 4, 'C7', 'C', 1), (2, 4, 'C8', 'C', 1),
(2, 4, 'D1', 'D', 1), (2, 4, 'D2', 'D', 1), (2, 4, 'D7', 'D', 1), (2, 4, 'D8', 'D', 1),
(2, 4, 'E1', 'E', 1), (2, 4, 'E2', 'E', 1), (2, 4, 'E7', 'E', 1), (2, 4, 'E8', 'E', 1),
(2, 4, 'F1', 'F', 1), (2, 4, 'F2', 'F', 1), (2, 4, 'F7', 'F', 1), (2, 4, 'F8', 'F', 1),
(2, 4, 'G1', 'G', 1), (2, 4, 'G2', 'G', 1), (2, 4, 'G7', 'G', 1), (2, 4, 'G8', 'G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(2, 5, 'A3', 'A', 1), (2, 5, 'A4', 'A', 1), (2, 5, 'A5', 'A', 1), (2, 5, 'A6', 'A', 1),
(2, 5, 'B3', 'B', 1), (2, 5, 'B4', 'B', 1), (2, 5, 'B5', 'B', 1), (2, 5, 'B6', 'B', 1),
(2, 5, 'C3', 'C', 1), (2, 5, 'C4', 'C', 1), (2, 5, 'C5', 'C', 1), (2, 5, 'C6', 'C', 1),
(2, 5, 'D3', 'D', 1), (2, 5, 'D4', 'D', 1), (2, 5, 'D5', 'D', 1), (2, 5, 'D6', 'D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(2, 6, 'E3', 'E', 1), (2, 6, 'E4', 'E', 1), (2, 6, 'E5', 'E', 1), (2, 6, 'E6', 'E', 1),
(2, 6, 'F3', 'F', 1), (2, 6, 'F4', 'F', 1), (2, 6, 'F5', 'F', 1), (2, 6, 'F6', 'F', 1),
(2, 6, 'G3', 'G', 1), (2, 6, 'G4', 'G', 1), (2, 6, 'G5', 'G', 1), (2, 6, 'G6', 'G', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(3, 7, 'A1', 'A', 1), (3, 7, 'A2', 'A', 1), (3, 7, 'A7', 'A', 1), (3, 7, 'A8', 'A', 1),
(3, 7, 'B1', 'B', 1), (3, 7, 'B2', 'B', 1), (3, 7, 'B7', 'B', 1), (3, 7, 'B8', 'B', 1),
(3, 7, 'C1', 'C', 1), (3, 7, 'C2', 'C', 1), (3, 7, 'C7', 'C', 1), (3, 7, 'C8', 'C', 1),
(3, 7, 'D1', 'D', 1), (3, 7, 'D2', 'D', 1), (3, 7, 'D7', 'D', 1), (3, 7, 'D8', 'D', 1),
(3, 7, 'E1', 'E', 1), (3, 7, 'E2', 'E', 1), (3, 7, 'E7', 'E', 1), (3, 7, 'E8', 'E', 1),
(3, 7, 'F1', 'F', 1), (3, 7, 'F2', 'F', 1), (3, 7, 'F7', 'F', 1), (3, 7, 'F8', 'F', 1),
(3, 7, 'G1', 'G', 1), (3, 7, 'G2', 'G', 1), (3, 7, 'G7', 'G', 1), (3, 7, 'G8', 'G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(3, 8, 'A3', 'A', 1), (3, 8, 'A4', 'A', 1), (3, 8, 'A5', 'A', 1), (3, 8, 'A6', 'A', 1),
(3, 8, 'B3', 'B', 1), (3, 8, 'B4', 'B', 1), (3, 8, 'B5', 'B', 1), (3, 8, 'B6', 'B', 1),
(3, 8, 'C3', 'C', 1), (3, 8, 'C4', 'C', 1), (3, 8, 'C5', 'C', 1), (3, 8, 'C6', 'C', 1),
(3, 8, 'D3', 'D', 1), (3, 8, 'D4', 'D', 1), (3, 8, 'D5', 'D', 1), (3, 8, 'D6', 'D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(3, 9, 'E3', 'E', 1), (3, 9, 'E4', 'E', 1), (3, 9, 'E5', 'E', 1), (3, 9, 'E6', 'E', 1),
(3, 9, 'F3', 'F', 1), (3, 9, 'F4', 'F', 1), (3, 9, 'F5', 'F', 1), (3, 9, 'F6', 'F', 1),
(3, 9, 'G3', 'G', 1), (3, 9, 'G4', 'G', 1), (3, 9, 'G5', 'G', 1), (3, 9, 'G6', 'G', 1);

-- Standard seats (3 rows at the front)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(4, 10, 'A1', 'A', 1), (4, 10, 'A2', 'A', 1), (4, 10, 'A3', 'A', 1), (4, 10, 'A4', 'A', 1), (4, 10, 'A5', 'A', 1),
(4, 10, 'B1', 'B', 1), (4, 10, 'B2', 'B', 1), (4, 10, 'B3', 'B', 1), (4, 10, 'B4', 'B', 1), (4, 10, 'B5', 'B', 1),
(4, 10, 'C1', 'C', 1), (4, 10, 'C2', 'C', 1), (4, 10, 'C3', 'C', 1), (4, 10, 'C4', 'C', 1), (4, 10, 'C5', 'C', 1);

-- Premium seats (2 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(4, 11, 'D1', 'D', 1), (4, 11, 'D2', 'D', 1), (4, 11, 'D3', 'D', 1), (4, 11, 'D4', 'D', 1), (4, 11, 'D5', 'D', 1),
(4, 11, 'E1', 'E', 1), (4, 11, 'E2', 'E', 1), (4, 11, 'E3', 'E', 1), (4, 11, 'E4', 'E', 1), (4, 11, 'E5', 'E', 1);

-- Standard seats (3 rows at the front)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(5, 16, 'A1', 'A', 1), (5, 16, 'A2', 'A', 1), (5, 16, 'A3', 'A', 1), (5, 16, 'A4', 'A', 1), (5, 16, 'A5', 'A', 1),
(5, 16, 'B1', 'B', 1), (5, 16, 'B2', 'B', 1), (5, 16, 'B3', 'B', 1), (5, 16, 'B4', 'B', 1), (5, 16, 'B5', 'B', 1),
(5, 16, 'C1', 'C', 1), (5, 16, 'C2', 'C', 1), (5, 16, 'C3', 'C', 1), (5, 16, 'C4', 'C', 1), (5, 16, 'C5', 'C', 1);

-- Premium seats (2 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(5, 17, 'D1', 'D', 1), (5, 17, 'D2', 'D', 1), (5, 17, 'D3', 'D', 1), (5, 17, 'D4', 'D', 1), (5, 17, 'D5', 'D', 1),
(5, 17, 'E1', 'E', 1), (5, 17, 'E2', 'E', 1), (5, 17, 'E3', 'E', 1), (5, 17, 'E4', 'E', 1), (5, 17, 'E5', 'E', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(6, 1, 'A1', 'A', 1), (6, 1, 'A2', 'A', 1), (6, 1, 'A7', 'A', 1), (6, 1, 'A8', 'A', 1),
(6, 1, 'B1', 'B', 1), (6, 1, 'B2', 'B', 1), (6, 1, 'B7', 'B', 1), (6, 1, 'B8', 'B', 1),
(6, 1, 'C1', 'C', 1), (6, 1, 'C2', 'C', 1), (6, 1, 'C7', 'C', 1), (6, 1, 'C8', 'C', 1),
(6, 1, 'D1', 'D', 1), (6, 1, 'D2', 'D', 1), (6, 1, 'D7', 'D', 1), (6, 1, 'D8', 'D', 1),
(6, 1, 'E1', 'E', 1), (6, 1, 'E2', 'E', 1), (6, 1, 'E7', 'E', 1), (6, 1, 'E8', 'E', 1),
(6, 1, 'F1', 'F', 1), (6, 1, 'F2', 'F', 1), (6, 1, 'F7', 'F', 1), (6, 1, 'F8', 'F', 1),
(6, 1, 'G1', 'G', 1), (6, 1, 'G2', 'G', 1), (6, 1, 'G7', 'G', 1), (6, 1, 'G8', 'G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(6, 2, 'A3', 'A', 1), (6, 2, 'A4', 'A', 1), (6, 2, 'A5', 'A', 1), (6, 2, 'A6', 'A', 1),
(6, 2, 'B3', 'B', 1), (6, 2, 'B4', 'B', 1), (6, 2, 'B5', 'B', 1), (6, 2, 'B6', 'B', 1),
(6, 2, 'C3', 'C', 1), (6, 2, 'C4', 'C', 1), (6, 2, 'C5', 'C', 1), (6, 2, 'C6', 'C', 1),
(6, 2, 'D3', 'D', 1), (6, 2, 'D4', 'D', 1), (6, 2, 'D5', 'D', 1), (6, 2, 'D6', 'D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(6, 3, 'E3', 'E', 1), (6, 3, 'E4', 'E', 1), (6, 3, 'E5', 'E', 1), (6, 3, 'E6','E', 1),
(6, 3, 'F3', 'F', 1), (6, 3, 'F4', 'F', 1), (6, 3, 'F5', 'F', 1), (6, 3, 'F6','F', 1),
(6, 3, 'G3', 'G', 1), (6, 3, 'G4', 'G', 1), (6, 3, 'G5', 'G', 1), (6, 3, 'G6','G', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(7, 7, 'A1', 'A', 1), (7, 7, 'A2', 'A', 1), (7, 7, 'A7', 'A', 1), (7, 7, 'A8', 'A', 1),
(7, 7, 'B1', 'B', 1), (7, 7, 'B2', 'B', 1), (7, 7, 'B7', 'B', 1), (7, 7, 'B8', 'B', 1),
(7, 7, 'C1', 'C', 1), (7, 7, 'C2', 'C', 1), (7, 7, 'C7', 'C', 1), (7, 7, 'C8', 'C', 1),
(7, 7, 'D1', 'D', 1), (7, 7, 'D2', 'D', 1), (7, 7, 'D7', 'D', 1), (7, 7, 'D8', 'D', 1),
(7, 7, 'E1', 'E', 1), (7, 7, 'E2', 'E', 1), (7, 7, 'E7', 'E', 1), (7, 7, 'E8', 'E', 1),
(7, 7, 'F1', 'F', 1), (7, 7, 'F2', 'F', 1), (7, 7, 'F7', 'F', 1), (7, 7, 'F8', 'F', 1),
(7, 7, 'G1', 'G', 1), (7, 7, 'G2', 'G', 1), (7, 7, 'G7', 'G', 1), (7, 7, 'G8', 'G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(7, 8, 'A3', 'A', 1), (7, 8, 'A4', 'A', 1), (7, 8, 'A5', 'A', 1), (7, 8, 'A6', 'A', 1),
(7, 8, 'B3', 'B', 1), (7, 8, 'B4', 'B', 1), (7, 8, 'B5', 'B', 1), (7, 8, 'B6', 'B', 1),
(7, 8, 'C3', 'C', 1), (7, 8, 'C4', 'C', 1), (7, 8, 'C5', 'C', 1), (7, 8, 'C6', 'C', 1),
(7, 8, 'D3', 'D', 1), (7, 8, 'D4', 'D', 1), (7, 8, 'D5', 'D', 1), (7, 8, 'D6', 'D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(7, 9, 'E3', 'E', 1), (7, 9, 'E4', 'E', 1), (7, 9, 'E5', 'E', 1), (7, 9, 'E6', 'E', 1),
(7, 9, 'F3', 'F', 1), (7, 9, 'F4', 'F', 1), (7, 9, 'F5', 'F', 1), (7, 9, 'F6', 'F', 1),
(7, 9, 'G3', 'G', 1), (7, 9, 'G4', 'G', 1), (7, 9, 'G5', 'G', 1), (7, 9, 'G6', 'G', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(8, 4, 'A1', 'A', 1), (8, 4, 'A2', 'A', 1), (8, 4, 'A7', 'A', 1), (8, 4, 'A8', 'A', 1),
(8, 4, 'B1', 'B', 1), (8, 4, 'B2', 'B', 1), (8, 4, 'B7', 'B', 1), (8, 4, 'B8', 'B', 1),
(8, 4, 'C1', 'C', 1), (8, 4, 'C2', 'C', 1), (8, 4, 'C7', 'C', 1), (8, 4, 'C8', 'C', 1),
(8, 4, 'D1', 'D', 1), (8, 4, 'D2', 'D', 1), (8, 4, 'D7', 'D', 1), (8, 4, 'D8', 'D', 1),
(8, 4, 'E1', 'E', 1), (8, 4, 'E2', 'E', 1), (8, 4, 'E7', 'E', 1), (8, 4, 'E8', 'E', 1),
(8, 4, 'F1', 'F', 1), (8, 4, 'F2', 'F', 1), (8, 4, 'F7', 'F', 1), (8, 4, 'F8', 'F', 1),
(8, 4, 'G1', 'G', 1), (8, 4, 'G2', 'G', 1), (8, 4, 'G7', 'G', 1), (8, 4, 'G8', 'G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(8, 5, 'A3', 'A', 1), (8, 5, 'A4', 'A', 1), (8, 5, 'A5', 'A', 1), (8, 5, 'A6', 'A', 1),
(8, 5, 'B3', 'B', 1), (8, 5, 'B4', 'B', 1), (8, 5, 'B5', 'B', 1), (8, 5, 'B6', 'B', 1),
(8, 5, 'C3', 'C', 1), (8, 5, 'C4', 'C', 1), (8, 5, 'C5', 'C', 1), (8, 5, 'C6', 'C', 1),
(8, 5, 'D3', 'D', 1), (8, 5, 'D4', 'D', 1), (8, 5, 'D5', 'D', 1), (8, 5, 'D6', 'D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(8, 6, 'E3', 'E', 1), (8, 6, 'E4', 'E', 1), (8, 6, 'E5', 'E', 1), (8, 6, 'E6', 'E', 1),
(8, 6, 'F3', 'F', 1), (8, 6, 'F4', 'F', 1), (8, 6, 'F5', 'F', 1), (8, 6, 'F6', 'F', 1),
(8, 6, 'G3', 'G', 1), (8, 6, 'G4', 'G', 1), (8, 6, 'G5', 'G', 1), (8, 6, 'G6', 'G', 1);

-- Standard seats (3 rows at the front)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(9, 13, 'A1', 'A', 1), (9, 13, 'A2', 'A', 1), (9, 13, 'A3', 'A', 1), (9, 13, 'A4', 'A', 1), (9, 13, 'A5', 'A', 1),
(9, 13, 'B1', 'B', 1), (9, 13, 'B2', 'B', 1), (9, 13, 'B3', 'B', 1), (9, 13, 'B4', 'B', 1), (9, 13, 'B5', 'B', 1),
(9, 13, 'C1', 'C', 1), (9, 13, 'C2', 'C', 1), (9, 13, 'C3', 'C', 1), (9, 13, 'C4', 'C', 1), (9, 13, 'C5', 'C', 1);

-- Premium seats (2 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(9, 14, 'D1', 'D', 1), (9, 14, 'D2', 'D', 1), (9, 14, 'D3', 'D', 1), (9, 14, 'D4', 'D', 1), (9, 14, 'D5', 'D', 1),
(9, 14, 'E1', 'E', 1), (9, 14, 'E2', 'E', 1), (9, 14, 'E3', 'E', 1), (9, 14, 'E4', 'E', 1), (9, 14, 'E5', 'E', 1);

-- Economic seats (3 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(10, 18, 'A1', 'A', 1), (10, 18, 'A2', 'A', 1), (10, 18, 'A3', 'A', 1), (10, 18, 'A10', 'A', 1), (10, 18, 'A11', 'A', 1), (10, 18, 'A12', 'A', 1),
(10, 18, 'B1', 'B', 1), (10, 18, 'B2', 'B', 1), (10, 18, 'B3', 'B', 1), (10, 18, 'B10', 'B', 1), (10, 18, 'B11', 'B', 1), (10, 18, 'B12', 'B', 1),
(10, 18, 'C1', 'C', 1), (10, 18, 'C2', 'C', 1), (10, 18, 'C3', 'C', 1), (10, 18, 'C10', 'C', 1), (10, 18, 'C11', 'C', 1), (10, 18, 'C12', 'C', 1),
(10, 18, 'D1', 'D', 1), (10, 18, 'D2', 'D', 1), (10, 18, 'D3', 'D', 1), (10, 18, 'D10', 'D', 1), (10, 18, 'D11', 'D', 1), (10, 18, 'D12', 'D', 1),
(10, 18, 'E1', 'E', 1), (10, 18, 'E2', 'E', 1), (10, 18, 'E3', 'E', 1), (10, 18, 'E10', 'E', 1), (10, 18, 'E11', 'E', 1), (10, 18, 'E12', 'E', 1),
(10, 18, 'F1', 'F', 1), (10, 18, 'F2', 'F', 1), (10, 18, 'F3', 'F', 1), (10, 18, 'F10', 'F', 1), (10, 18, 'F11', 'F', 1), (10, 18, 'F12', 'F', 1),
(10, 18, 'G1', 'G', 1), (10, 18, 'G2', 'G', 1), (10, 18, 'G3', 'G', 1), (10, 18, 'G10', 'G', 1), (10, 18, 'G11', 'G', 1), (10, 18, 'G12', 'G', 1),
(10, 18, 'H1', 'H', 1), (10, 18, 'H2', 'H', 1), (10, 18, 'H3', 'H', 1), (10, 18, 'H10', 'H', 1), (10, 18, 'H11', 'H', 1), (10, 18, 'H12', 'H', 1),
(10, 18, 'I1', 'I', 1), (10, 18, 'I2', 'I', 1), (10, 18, 'I3', 'I', 1), (10, 18, 'I10', 'I', 1), (10, 18, 'I11', 'I', 1), (10, 18, 'I12', 'I', 1);

-- Standard seats (6 columns in the middle)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(10, 19, 'A4', 'A', 1), (10, 19, 'A5', 'A', 1), (10, 19, 'A6', 'A', 1), (10, 19, 'A7', 'A', 1), (10, 19, 'A8', 'A', 1), (10, 19, 'A9', 'A', 1),
(10, 19, 'B4', 'B', 1), (10, 19, 'B5', 'B', 1), (10, 19, 'B6', 'B', 1), (10, 19, 'B7', 'B', 1), (10, 19, 'B8', 'B', 1), (10, 19, 'B9', 'B', 1),
(10, 19, 'C4', 'C', 1), (10, 19, 'C5', 'C', 1), (10, 19, 'C6', 'C', 1), (10, 19, 'C7', 'C', 1), (10, 19, 'C8', 'C', 1), (10, 19, 'C9', 'C', 1),
(10, 19, 'D4', 'D', 1), (10, 19, 'D5', 'D', 1), (10, 19, 'D6', 'D', 1), (10, 19, 'D7', 'D', 1), (10, 19, 'D8', 'D', 1), (10, 19, 'D9', 'D', 1),
(10, 19, 'E4', 'E', 1), (10, 19, 'E5', 'E', 1), (10, 19, 'E6', 'E', 1), (10, 19, 'E7', 'E', 1), (10, 19, 'E8', 'E', 1), (10, 19, 'E9', 'E', 1),
(10, 19, 'F4', 'F', 1), (10, 19, 'F5', 'F', 1), (10, 19, 'F6', 'F', 1), (10, 19, 'F7', 'F', 1), (10, 19, 'F8', 'F', 1), (10, 19, 'F9', 'F', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(10, 20, 'G4', 'G', 1), (10, 20, 'G5', 'G', 1), (10, 20, 'G6', 'G', 1), (10, 20, 'G7', 'G', 1), (10, 20, 'G8', 'G', 1), (10, 20, 'G9', 'G', 1),
(10, 20, 'H4', 'H', 1), (10, 20, 'H5', 'H', 1), (10, 20, 'H6', 'H', 1), (10, 20, 'H7', 'H', 1), (10, 20, 'H8', 'H', 1), (10, 20, 'H9', 'H', 1),
(10, 20, 'I4', 'I', 1), (10, 20, 'I5', 'I', 1), (10, 20, 'I6', 'I', 1), (10, 20, 'I7', 'I', 1), (10, 20, 'I8', 'I', 1), (10, 20, 'I9', 'I', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(11, 1, 'A1', 'A', 1), (11, 1, 'A2', 'A', 1), (11, 1, 'A7', 'A', 1), (11, 1, 'A8', 'A', 1),
(11, 1, 'B1', 'B', 1), (11, 1, 'B2', 'B', 1), (11, 1, 'B7', 'B', 1), (11, 1, 'B8', 'B', 1),
(11, 1, 'C1', 'C', 1), (11, 1, 'C2', 'C', 1), (11, 1, 'C7', 'C', 1), (11, 1, 'C8', 'C', 1),
(11, 1, 'D1', 'D', 1), (11, 1, 'D2', 'D', 1), (11, 1, 'D7', 'D', 1), (11, 1, 'D8', 'D', 1),
(11, 1, 'E1', 'E', 1), (11, 1, 'E2', 'E', 1), (11, 1, 'E7', 'E', 1), (11, 1, 'E8', 'E', 1),
(11, 1, 'F1', 'F', 1), (11, 1, 'F2', 'F', 1), (11, 1, 'F7', 'F', 1), (11, 1, 'F8', 'F', 1),
(11, 1, 'G1', 'G', 1), (11, 1, 'G2', 'G', 1), (11, 1, 'G7', 'G', 1), (11, 1, 'G8', 'G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(11, 2, 'A3', 'A', 1), (11, 2, 'A4', 'A', 1), (11, 2, 'A5', 'A', 1), (11, 2, 'A6', 'A', 1),
(11, 2, 'B3', 'B', 1), (11, 2, 'B4', 'B', 1), (11, 2, 'B5', 'B', 1), (11, 2, 'B6', 'B', 1),
(11, 2, 'C3', 'C', 1), (11, 2, 'C4', 'C', 1), (11, 2, 'C5', 'C', 1), (11, 2, 'C6', 'C', 1),
(11, 2, 'D3', 'D', 1), (11, 2, 'D4', 'D', 1), (11, 2, 'D5', 'D', 1), (11, 2, 'D6', 'D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(11, 3, 'E3', 'E', 1), (11, 3, 'E4', 'E', 1), (11, 3, 'E5', 'E', 1), (11, 3, 'E6', 'E', 1),
(11, 3, 'F3', 'F', 1), (11, 3, 'F4', 'F', 1), (11, 3, 'F5', 'F', 1), (11, 3, 'F6', 'F', 1),
(11, 3, 'G3', 'G', 1), (11, 3, 'G4', 'G', 1), (11, 3, 'G5', 'G', 1), (11, 3, 'G6', 'G', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(12, 1, 'A1', 'A', 1), (12, 1, 'A2', 'A', 1), (12, 1, 'A7', 'A', 1), (12, 1, 'A8', 'A', 1),
(12, 1, 'B1', 'B', 1), (12, 1, 'B2', 'B', 1), (12, 1, 'B7', 'B', 1), (12, 1, 'B8', 'B', 1),
(12, 1, 'C1', 'C', 1), (12, 1, 'C2', 'C', 1), (12, 1, 'C7', 'C', 1), (12, 1, 'C8', 'C', 1),
(12, 1, 'D1', 'D', 1), (12, 1, 'D2', 'D', 1), (12, 1, 'D7', 'D', 1), (12, 1, 'D8', 'D', 1),
(12, 1, 'E1', 'E', 1), (12, 1, 'E2', 'E', 1), (12, 1, 'E7', 'E', 1), (12, 1, 'E8', 'E', 1),
(12, 1, 'F1', 'F', 1), (12, 1, 'F2', 'F', 1), (12, 1, 'F7', 'F', 1), (12, 1, 'F8', 'F', 1),
(12, 1, 'G1', 'G', 1), (12, 1, 'G2', 'G', 1), (12, 1, 'G7', 'G', 1), (12, 1, 'G8', 'G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(12, 2, 'A3', 'A', 1), (12, 2, 'A4', 'A', 1), (12, 2, 'A5', 'A', 1), (12, 2, 'A6', 'A', 1),
(12, 2, 'B3', 'B', 1), (12, 2, 'B4', 'B', 1), (12, 2, 'B5', 'B', 1), (12, 2, 'B6', 'B', 1),
(12, 2, 'C3', 'C', 1), (12, 2, 'C4', 'C', 1), (12, 2, 'C5', 'C', 1), (12, 2, 'C6', 'C', 1),
(12, 2, 'D3', 'D', 1), (12, 2, 'D4', 'D', 1), (12, 2, 'D5', 'D', 1), (12, 2, 'D6', 'D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(12, 3, 'E3', 'E', 1), (12, 3, 'E4', 'E', 1), (12, 3, 'E5', 'E', 1), (12, 3, 'E6', 'E', 1),
(12, 3, 'F3', 'F', 1), (12, 3, 'F4', 'F', 1), (12, 3, 'F5', 'F', 1), (12, 3, 'F6', 'F', 1),
(12, 3, 'G3', 'G', 1), (12, 3, 'G4', 'G', 1), (12, 3, 'G5', 'G', 1), (12, 3, 'G6', 'G', 1);

-- Economic seats (2 columns on each side)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(13, 4, 'A1', 'A', 1), (13, 4, 'A2', 'A', 1), (13, 4, 'A7', 'A', 1), (13, 4, 'A8','A', 1),
(13, 4, 'B1', 'B', 1), (13, 4, 'B2', 'B', 1), (13, 4, 'B7', 'B', 1), (13, 4, 'B8','B', 1),
(13, 4, 'C1', 'C', 1), (13, 4, 'C2', 'C', 1), (13, 4, 'C7', 'C', 1), (13, 4, 'C8','C', 1),
(13, 4, 'D1', 'D', 1), (13, 4, 'D2', 'D', 1), (13, 4, 'D7', 'D', 1), (13, 4, 'D8','D', 1),
(13, 4, 'E1', 'E', 1), (13, 4, 'E2', 'E', 1), (13, 4, 'E7', 'E', 1), (13, 4, 'E8','E', 1),
(13, 4, 'F1', 'F', 1), (13, 4, 'F2', 'F', 1), (13, 4, 'F7', 'F', 1), (13, 4, 'F8','F', 1),
(13, 4, 'G1', 'G', 1), (13, 4, 'G2', 'G', 1), (13, 4, 'G7', 'G', 1), (13, 4, 'G8','G', 1);

-- Standard seats (middle columns)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(13, 5, 'A3', 'A', 1), (13, 5, 'A4', 'A', 1), (13, 5, 'A5', 'A', 1), (13, 5, 'A6','A', 1),
(13, 5, 'B3', 'B', 1), (13, 5, 'B4', 'B', 1), (13, 5, 'B5', 'B', 1), (13, 5, 'B6','B', 1),
(13, 5, 'C3', 'C', 1), (13, 5, 'C4', 'C', 1), (13, 5, 'C5', 'C', 1), (13, 5, 'C6','C', 1),
(13, 5, 'D3', 'D', 1), (13, 5, 'D4', 'D', 1), (13, 5, 'D5', 'D', 1), (13, 5, 'D6','D', 1);

-- Premium seats (3 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(13, 6, 'E3', 'E', 1), (13, 6, 'E4', 'E', 1), (13, 6, 'E5', 'E', 1), (13, 6, 'E6','E', 1),
(13, 6, 'F3', 'F', 1), (13, 6, 'F4', 'F', 1), (13, 6, 'F5', 'F', 1), (13, 6, 'F6','F', 1),
(13, 6, 'G3', 'G', 1), (13, 6, 'G4', 'G', 1), (13, 6, 'G5', 'G', 1), (13, 6, 'G6','G', 1);

-- Standard seats (3 rows at the front)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(14, 15, 'A1', 'A', 1), (14, 15, 'A2', 'A', 1), (14, 15, 'A3', 'A', 1), (14, 15, 'A4', 'A', 1), (14, 15, 'A5', 'A', 1),
(14, 15, 'B1', 'B', 1), (14, 15, 'B2', 'B', 1), (14, 15, 'B3', 'B', 1), (14, 15, 'B4', 'B', 1), (14, 15, 'B5', 'B', 1),
(14, 15, 'C1', 'C', 1), (14, 15, 'C2', 'C', 1), (14, 15, 'C3', 'C', 1), (14, 15, 'C4', 'C', 1), (14, 15, 'C5', 'C', 1);

-- Premium seats (2 main rows at the back)
INSERT INTO [dbo].[Seats] ([RoomId], [SeatTypeId], [SeatNumber], [Row], [IsAvailable])
VALUES 
(14, 16, 'D1', 'D', 1), (14, 16, 'D2', 'D', 1), (14, 16, 'D3', 'D', 1), (14, 16, 'D4', 'D', 1), (14, 16, 'D5', 'D', 1),
(14, 16, 'E1', 'E', 1), (14, 16, 'E2', 'E', 1), (14, 16, 'E3', 'E', 1), (14, 16, 'E4', 'E', 1), (14, 16, 'E5', 'E', 1);

-- Venom: Let There Be Carnage
INSERT INTO [dbo].[Showtimes] ([MovieId], [RoomId], [StartTime], [EndTime], [IsActive])
VALUES 
(1, 1, '2024-10-29 09:00:00', '2024-10-29 10:49:00', 1);

-- A Quiet Place Part II
INSERT INTO [dbo].[Showtimes] ([MovieId], [RoomId], [StartTime], [EndTime], [IsActive])
VALUES 
(2, 2, '2024-10-29 09:00:00', '2024-10-29 10:37:00', 1);

-- Black Widow
INSERT INTO [dbo].[Showtimes] ([MovieId], [RoomId], [StartTime], [EndTime], [IsActive])
VALUES 
(3, 3, '2024-10-29 09:00:00', '2024-10-29 11:14:00', 1);

-- No Time to Die
INSERT INTO [dbo].[Showtimes] ([MovieId], [RoomId], [StartTime], [EndTime], [IsActive])
VALUES 
(4, 4, '2024-10-29 09:00:00', '2024-10-29 11:43:00', 1);

-- Dune
INSERT INTO [dbo].[Showtimes] ([MovieId], [RoomId], [StartTime], [EndTime], [IsActive])
VALUES 
(5, 5, '2024-10-29 9:00:00', '2024-10-29 11:35:00', 1);

-- Shang-Chi and the Legend of the Ten Rings
INSERT INTO [dbo].[Showtimes] ([MovieId], [RoomId], [StartTime], [EndTime], [IsActive])
VALUES 
(6, 1, '2024-10-29 11:00:00', '2024-10-29 13:12:00', 1);

-- The Suicide Squad
INSERT INTO [dbo].[Showtimes] ([MovieId], [RoomId], [StartTime], [EndTime], [IsActive])
VALUES 
(7, 2, '2024-10-29 11:00:00', '2024-10-29 13:12:00', 1);

-- News for DISCOUNT10 Coupon
INSERT INTO [dbo].[News] ([Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive])
VALUES 
('Special Discount: Get 10% Off!', 
'Enjoy a special discount with the code DISCOUNT10! Get 10% off on all items. This offer is valid until December 31, 2025. Don’t miss out on this fantastic opportunity to save!', 
'Don Quixote', 
GETDATE(), 
'https://example.com/images/discount10.jpg', 
1);

-- News for SAVE20 Coupon
INSERT INTO [dbo].[News] ([Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive])
VALUES 
('Save Big: 20% Off on All Purchases!', 
'Use the code SAVE20 to get 20% off on all purchases. This offer is valid until December 31, 2025. Shop now and save big on your favorite items!', 
'Don Quixote', 
GETDATE(), 
'https://example.com/images/save20.jpg', 
1);

-- News for WEEKDAY15 Coupon
INSERT INTO [dbo].[News] ([Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive])
VALUES 
('Weekday Special: 15% Off!', 
'Make your weekdays special with a 15% discount! Use the code WEEKDAY15 to enjoy this offer. Valid until December 31, 2025. Don’t miss out on this weekday treat!', 
'Don Quixote', 
GETDATE(), 
'https://example.com/images/weekday15.jpg', 
1);

-- News for KIDSPECIAL5 Coupon
INSERT INTO [dbo].[News] ([Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive])
VALUES 
('Kids Special: 5% Off on Kids Items!', 
'Get 5% off on all kids items with the code KIDSPECIAL5. This offer is valid until December 31, 2025. Shop now and save on your kids’ favorite items!', 
'Don Quixote', 
GETDATE(), 
'https://example.com/images/kidspecial5.jpg', 
1);

-- News for WELCOME10 Coupon
INSERT INTO [dbo].[News] ([Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive])
VALUES 
('Welcome Offer: Get 10% Off Your First Purchase!', 
'We are excited to welcome new customers with a special offer! Use the code WELCOME10 to get 10% off your first purchase. This offer is valid until December 31, 2025. Don’t miss out on this fantastic opportunity to save on your favorite items!', 
'Don Quixote', 
GETDATE(), 
'https://example.com/images/welcome10.jpg', 
1);

-- News for MOVIE20 Coupon
INSERT INTO [dbo].[News] ([Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive])
VALUES 
('Movie Night Special: 20% Off Tickets!', 
'Make your movie night even more special with a 20% discount on tickets! Use the code MOVIE20 to avail this offer. Valid until November 30, 2025. Book your tickets now and enjoy the show!', 
'Don Quixote', 
GETDATE(), 
'https://example.com/images/movie20.jpg', 
1);

-- News for HOLIDAY25 Coupon
INSERT INTO [dbo].[News] ([Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive])
VALUES 
('Holiday Special: 25% Off on All Purchases!', 
'Celebrate the holiday season with a special discount! Use the code HOLIDAY25 to get 25% off on all purchases. This offer is valid until December 25, 2025. Happy Holidays!', 
'Don Quixote', 
GETDATE(), 
'https://example.com/images/holiday25.jpg', 
1);

-- News for WINTER20 Coupon
INSERT INTO [dbo].[News] ([Title], [Content], [Author], [PublishedDate], [ImageUrl], [IsActive])
VALUES 
('Winter Sale: Get 20% Off!', 
'Stay warm this winter with a special discount! Use the code WINTER20 to get 20% off on all items. This offer is valid until December 31, 2025. Shop now and save big!', 
'Don Quixote', 
GETDATE(), 
'https://example.com/images/winter20.jpg', 
1);

