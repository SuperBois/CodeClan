use semproject;
DROP TRIGGER IF EXISTS `semproject`.`Users_AFTER_INSERT`;

DELIMITER $$
USE `semproject`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `Users_AFTER_INSERT` AFTER INSERT ON `Users` FOR EACH ROW BEGIN
   	INSERT INTO semproject.Achievements(user_id, achievement_title)
    value
    (New.user_id, 'Bronze Badge');
END$$
DELIMITER ;

SELECT * FROM Achievements;

