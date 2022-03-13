-- Create friend table query
CREATE TABLE `friend` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_Friends` tinyint(4) DEFAULT NULL,
  `sender_userId` int(11) DEFAULT NULL,
  `receiver_userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`friend_id`),
  KEY `fk_friend_sender_userId_idx` (`sender_userId`),
  KEY `fk_friend_receiver_userId_idx` (`receiver_userId`),
  CONSTRAINT `fk_friend_receiver_userId` FOREIGN KEY (`receiver_userId`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_sender_userId` FOREIGN KEY (`sender_userId`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
