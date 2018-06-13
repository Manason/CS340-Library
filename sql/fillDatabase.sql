SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(1, 'George R. R. Martin', 1003, 10, 'Cats');
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(2, 'George R. R. Martin', 1003, 10, 'helloworld');
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(3, 'George R. R. Martin', 1041, 10, 'cooluser6');
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(4, 'F. Scott Fitzgerald', 180, 14, 'testman');
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(5, 'F. Scott Fitzgerald', 180, 14, 'hellotestuser');
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(6, 'F. Scott Fitzgerald', 180, 14, 'test02');
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(7, 'F. Scott Fitzgerald', 180, 14, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(8, 'J.D. Salinger', 240, 15, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(9, 'J.D. Salinger', 240, 15, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(10, 'Harper Lee', 336, 16, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(11, 'George Orwell', 328, 17, 'thebest');
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(12, 'George Orwell', 328, 17, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(13, 'George Orwell', 328, 17, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(14, 'George Orwell', 328, 17, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(15, 'Aldous Huxley', 228, 18, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(16, 'Aldous Huxley', 228, 18, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(17, 'Aldous Huxley', 228, 18, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(18, 'Kurt Vonnegut', 288, 22, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(19, 'Stephen Hawking', 212, 26, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(20, 'Stephen Hawking', 212, 26, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(21, 'Stephen Hawking', 212, 26, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(22, 'Herman Melville', 544, 27, 'test02');
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(23, 'Herman Melville', 544, 27, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(24, 'Herman Melville', 544, 27, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(25, 'J. R. R. Tolkien', 300, 28, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(26, 'J. R. R. Tolkien', 300, 28, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(27, 'J. R. R. Tolkien', 300, 28, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(29, 'John Steinbeck', 112, 31, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(30, 'John Steinbeck', 112, 31, NULL);
INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES(31, 'John Steinbeck', 112, 31, NULL);

INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(3, 'Frank Darabont', 144, 19, 'test02');
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(4, 'Frank Darabont', 144, 19, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(5, 'Frank Darabont', 144, 19, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(6, 'Frank Darabont', 144, 19, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(7, 'Frank Darabont', 144, 19, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(8, 'Francis Ford Coppola', 175, 20, 'test02');
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(9, 'Francis Ford Coppola', 175, 20, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(10, 'Francis Ford Coppola', 175, 20, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(11, 'Christopher Nolan', 152, 21, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(12, 'Christopher Nolan', 152, 21, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(13, 'Christopher Nolan', 152, 21, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(14, 'Christopher Nolan', 152, 21, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(15, 'Christopher Nolan', 152, 21, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(16, 'Christopher Nolan', 152, 21, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(21, 'Quentin Tarantino', 154, 23, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(22, 'Christopher Nolan', 148, 24, 'thebest');
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(23, 'David Fincher', 139, 25, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(24, 'David Fincher', 139, 25, NULL);
INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES(25, 'David Fincher', 139, 25, NULL);

INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(10, 'A Game of Thrones', 'GoT', 'book', 'Fantasy', 'https://i.imgur.com/qKKdXyg.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(14, 'The Great Gatsby', 'The Great Gatsby, F. Scott Fitzgerald’s third book, stands as the supreme achievement of his career. First published in 1925, this quintessential novel of the Jazz Age has been acclaimed by generations of readers. The story of the mysteriously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan, of lavish parties on Long Island at a time when The New York Times noted “gin was the national drink and sex the national obsession,” it is an exquisitely crafted tale of America in the 1920s.', 'book', 'Fiction', 'https://i.imgur.com/pwvMQum.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(15, 'The Catcher in the Rye', 'The hero-narrator of THE CATCHER IN THE RYE is an ancient child of sixteen, a native New Yorker named Holden Caulfield. Through circumstances that tend to preclude adult, secondhand description, he leaves his prep school in Pennsylvania and goes underground in New York City for three days. ', 'book', 'Fiction', 'https://i.imgur.com/4HwKrPC.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(16, 'To Kill a Mockingbird', 'A gripping, heart-wrenching, and wholly remarkable tale of coming-of-age in a South poisoned by virulent prejudice, it views a world of great beauty and savage inequities through the eyes of a young girl, as her father—a crusading local lawyer—risks everything to defend a black man unjustly accused of a terrible crime.', 'book', 'Gothic', 'https://i.imgur.com/BqFf56r.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(17, '1984', 'Winston Smith toes the Party line, rewriting history to satisfy the demands of the Ministry of Truth. With each lie he writes, Winston grows to hate the Party that seeks power for its own sake and persecutes those who dare to commit thoughtcrimes. But as he starts to think for himself, Winston can’t escape the fact that Big Brother is always watching..', 'book', 'Fiction', 'https://i.imgur.com/sAOpgqh.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(18, 'Brave New World', 'Huxley was a man of incomparable talents: equally an artist, a spiritual seeker, and one of history’s keenest observers of human nature and civilization. Brave New World, his masterpiece, has enthralled and terrified millions of readers, and retains its urgent relevance to this day as both a warning to be heeded as we head into tomorrow and as thought-provoking, satisfying work of literature. Written in the shadow of the rise of fascism during the 1930s, Brave New World likewise speaks to a 21st-century world dominated by mass-entertainment, technology, medicine and pharmaceuticals, the arts of persuasion, and the hidden influence of elites. ', 'book', 'Science Fiction', 'https://i.imgur.com/WdWb1yp.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(19, 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'film', 'Drama', 'https://i.imgur.com/QEuNx9V.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(20, 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'film', 'Drama', 'https://i.imgur.com/pree214.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(21, 'The Dark Knight', 'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 'film', 'Action', 'https://i.imgur.com/YSz1AkL.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(22, 'Slaughter-House Five', 'Slaughterhouse-Five, an American classic, is one of the world’s great antiwar books. Centering on the infamous firebombing of Dresden, Billy Pilgrim’s odyssey through time reflects the mythic journey of our own fractured lives as we search for meaning in what we fear most.', 'book', 'Fiction', 'https://i.imgur.com/m8TxbMX.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(23, 'Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangsters wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'film', 'Drama', 'https://i.imgur.com/vLhcMAD.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(24, 'Inception', 'A thief, who steals corporate secrets through the use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.', 'film', 'Science Fiction', 'https://i.imgur.com/KoJl6b9.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(25, 'Fight Club', 'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soapmaker, forming an underground fight club that evolves into something much, much more.', 'film', 'Drama', 'https://i.imgur.com/GmX7uLz.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(26, 'A Brief History of Time', 'Told in language we all can understand, A Brief History of Time plunges into the exotic realms of black holes and quarks, of antimatter and “arrows of time,” of the big bang and a bigger God—where the possibilities are wondrous and unexpected. With exciting images and profound imagination, Stephen Hawking brings us closer to the ultimate secrets at the very heart of creation.', 'book', 'Science', 'https://i.imgur.com/K5jd2OI.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(27, 'Moby Dick', 'Moby-Dick is the story of Captain Ahab\'s quest to avenge the whale that \'reaped\' his leg. The quest is an obsession and the novel is a diabolical study of how a man becomes a fanatic. But it is also a hymn to democracy. Bent as the crew is on Ahab s appalling crusade, it is equally the image of a co-operative community at work: all hands dependent on all hands, each individual responsible for the security of each. Among the crew is Ishmael, the novel\'s narrator, ordinary sailor, and extraordinary reader. Digressive, allusive, vulgar, transcendent, the story Ishmael tells is above all an education: in the practice of whaling, in the art of writing.', 'book', 'Fiction', 'https://i.imgur.com/rCiEIrc.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(28, 'The Hobbit', 'Bilbo Baggins is a hobbit who enjoys a comfortable, unambitious life, rarely traveling any farther than his pantry or cellar. But his contentment is disturbed when the wizard Gandalf and a company of dwarves arrive on his doorstep one day to whisk him away on an adventure. They have launched a plot to raid the treasure hoard guarded by Smaug the Magnificent, a large and very dangerous dragon. Bilbo reluctantly joins their quest, unaware that on his journey to the Lonely Mountain he will encounter both a magic ring and a frightening creature known as Gollum.', 'book', 'Fantasy', 'https://i.imgur.com/s9vMhsJ.png');
INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES(31, 'Of Mice and Men', 'A controversial tale of friendship and tragedy during the Great Depression\n \nThey are an unlikely pair: George is \"small and quick and dark of face\"; Lennie, a man of tremendous size, has the mind of a young child. Yet they have formed a \"family,\" clinging together in the face of loneliness and alienation.\n\nLaborers in California\'s dusty vegetable fields, they hustle work when they can, living a hand-to-mouth existence. For George and Lennie have a plan: to own an acre of land and a shack they can call their own. When they land jobs on a ranch in the Salinas Valley, the fulfillment of their dream seems to be within their grasp. But even George cannot guard Lennie from the provocations of a flirtatious woman, nor predict the consequences of Lennie\'s unswerving obedience to the things George taught him.', 'book', 'Fiction', 'https://i.imgur.com/1Nk87Gx.png');

INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(10, 'cooluser', 5, 'A fantasy epic set in a brutal world. A great read for those who love immersive, large stories!', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(10, 'cooluser6', 4, 'I watch the HBO show so I thought I\'d give this a try, but its more fun to just watch', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(10, 'libraryexists', 5, 'The winds of Winter soon?', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(14, 'actualhuman', 3, 'Great book', '2018-06-08');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(14, 'afsadfsad', 4, 'I liked this when I read it in High School', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(14, 'cooluser7', 1, '', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(14, 'first', 3, 'More like the Great Leo', '2018-06-07');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(15, 'actualhuman', 1, 'I agree with above', '2018-06-06');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(15, 'afsadfsad', 1, 'I would never read this for fun.', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(15, 'test02', 5, 'This is a great book.', '2018-06-11');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(17, 'actualhuman', 3, 'Good Book', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(18, 'first', 5, 'Very Brave ;)', '2018-06-06');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(18, 'johnsmith', 5, 'My favorite book.', '2018-06-08');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(19, 'test02', 5, 'Great Film!', '2018-06-11');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(20, 'cooluser7', 1, '', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(21, 'afsadfsad', 5, 'One of the best films of all time', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(21, 'cocacola', 2, 'Too dark', '2018-06-06');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(22, 'actualhuman', 5, 'An Instant Classic!', '2018-06-06');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(23, 'afsadfsad', 5, 'Boring, hard to watch', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(23, 'johnsmith', 5, 'A classic!', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(24, 'actualhuman', 5, 'Love it!', '2018-06-08');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(25, 'afsadfsad', 5, 'Don\'t talk about Fight Club', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(25, 'cooluser', 5, 'interesting test', '2018-06-06');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(26, 'actualhuman', 2, 'Too brief', '2018-06-06');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(26, 'dfsdfds', 1, '', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(28, 'afsadfsad', 2, 'Long and hard to read.', '2018-05-27');
INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `date`) VALUES(28, 'cooluser7', 5, 'Loved it!', '2018-06-08');

INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('actualhuman', '-1452354888', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('afsadfsad', '1623287869', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('Cats', '863768919', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('cocacola', '1321836888', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('cooluser', '1450575459', 'The Great Gatsby', 'The Godfather');
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('cooluser2', '1450575459', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('cooluser3', '-920849920', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('cooluser5', '-553403974', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('cooluser6', '-871293684', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('cooluser7', '-553403974', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('dfsdfds', '1585513988', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('first', '269892544', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('hellotestuser', '-928147210', 'Brave New World', 'Inception');
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('helloworld', '-1524582912', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('johnsmith', '-622135070', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('libraryexists', '61418782', NULL, NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('noah', '1216985755', 'The Great Gatsby', 'Inception');
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('test02', '1216985755', 'The Great Gatsby', 'Fight Club');
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('testman', '3556498', 'The Great Gatsby', NULL);
INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES('thebest', '-1867378635', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
