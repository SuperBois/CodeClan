USE `semproject`;
DROP procedure IF EXISTS `get_replies`;

DELIMITER $$
USE `semproject`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_replies`(thread_num int)
BEGIN
	select thread_id, message, user_name 
	from Question_threads NATURAL JOIN 
		Reply NATURAL JOIN 
		Message JOIN Users 
			On user_id = from_user_id
		where thread_id = thread_num;
END$$

DELIMITER ;

USE `semproject`;
DROP procedure IF EXISTS `get_answers`;

DELIMITER $$
USE `semproject`$$
CREATE PROCEDURE `get_answers` (thread_num int)
BEGIN
select thread_id, message, user_name 
from Question_threads NATURAL JOIN 
	Answer NATURAL JOIN 
	Message JOIN Users 
		On Message.from_user_id = Users.user_id
	where thread_id = thread_num;
END$$

DELIMITER ;


USE `semproject`;
DROP procedure IF EXISTS `get_comments`;

DELIMITER $$
USE `semproject`$$
CREATE PROCEDURE `get_comments` ()
BEGIN
	select comment_text, user_name 
	from Users Natural join Comments 
    JOIN Answer on message_id = Comments.answer_id;
END$$

DELIMITER ;



USE `semproject`;
DROP procedure IF EXISTS `get_comments`;

USE `semproject`;
DROP procedure IF EXISTS `semproject`.`get_comments`;
;

DELIMITER $$
USE `semproject`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_comments`(thread_num int)
BEGIN
	select comment_text, user_name 
	from Users Natural join Comments 
    JOIN Answer on message_id = Comments.answer_id
    where Answer.thread_id = thread_num;
END$$

DELIMITER ;
;

