SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `Studented` ;
CREATE SCHEMA IF NOT EXISTS `Studented` ;
USE `Studented` ;

-- -----------------------------------------------------
-- Table `Studented`.`user_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`user_type` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`user_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(511) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`address` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `line1` VARCHAR(255) NULL ,
  `line2` VARCHAR(255) NULL ,
  `city` VARCHAR(255) NULL ,
  `state` VARCHAR(255) NULL ,
  `landmark` VARCHAR(255) NULL ,
  `pin_code` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`contact_information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`contact_information` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`contact_information` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `phone_number` VARCHAR(45) NULL ,
  `mobile_number` VARCHAR(45) NULL ,
  `facebook_link` VARCHAR(255) NULL ,
  `address_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_contact_information_address1`
    FOREIGN KEY (`address_id` )
    REFERENCES `Studented`.`address` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_contact_information_address1_idx` ON `Studented`.`contact_information` (`address_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`user` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`user` (
  `userid` INT NOT NULL AUTO_INCREMENT ,
  `user_name` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  `user_type_id` INT NOT NULL ,
  `contact_information_id` INT NOT NULL ,
  PRIMARY KEY (`userid`) ,
  CONSTRAINT `fk_user_user_type1`
    FOREIGN KEY (`user_type_id` )
    REFERENCES `Studented`.`user_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_contact_information1`
    FOREIGN KEY (`contact_information_id` )
    REFERENCES `Studented`.`contact_information` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `userid_UNIQUE` ON `Studented`.`user` (`userid` ASC) ;

CREATE INDEX `fk_user_user_type1_idx` ON `Studented`.`user` (`user_type_id` ASC) ;

CREATE INDEX `fk_user_contact_information1_idx` ON `Studented`.`user` (`contact_information_id` ASC) ;

CREATE INDEX `user_type_idx` ON `Studented`.`user` (`user_type_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`qualification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`qualification` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`qualification` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `year_of_passing` YEAR NULL ,
  `year_of_start` YEAR NULL ,
  `institute_name` VARCHAR(255) NULL ,
  `name` VARCHAR(255) NULL ,
  `course_name` VARCHAR(255) NULL ,
  `score` FLOAT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`student` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`student` (
  `userid` INT NOT NULL ,
  `fore_name` VARCHAR(255) NOT NULL ,
  `middle_name` VARCHAR(255) NULL ,
  `last_name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(512) NULL ,
  `Qualification_id` INT NOT NULL ,
  PRIMARY KEY (`userid`) ,
  CONSTRAINT `fk_student_user`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_Qualification1`
    FOREIGN KEY (`Qualification_id` )
    REFERENCES `Studented`.`qualification` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_student_Qualification1_idx` ON `Studented`.`student` (`Qualification_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`type` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`type` (
  `type_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(255) NULL ,
  PRIMARY KEY (`type_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`subtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`subtype` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`subtype` (
  `subtype_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(511) NULL ,
  PRIMARY KEY (`subtype_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`teacher` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`teacher` (
  `userid` INT NOT NULL ,
  `fore_name` VARCHAR(255) NOT NULL ,
  `middle_name` VARCHAR(255) NULL ,
  `last_name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(512) NULL ,
  `type_id` INT NOT NULL ,
  `subtype_id` INT NOT NULL ,
  `Qualification_id` INT NOT NULL ,
  PRIMARY KEY (`userid`) ,
  CONSTRAINT `fk_teacher_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_type1`
    FOREIGN KEY (`type_id` )
    REFERENCES `Studented`.`type` (`type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_subtype1`
    FOREIGN KEY (`subtype_id` )
    REFERENCES `Studented`.`subtype` (`subtype_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_Qualification1`
    FOREIGN KEY (`Qualification_id` )
    REFERENCES `Studented`.`qualification` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_teacher_type1_idx` ON `Studented`.`teacher` (`type_id` ASC) ;

CREATE INDEX `fk_teacher_subtype1_idx` ON `Studented`.`teacher` (`subtype_id` ASC) ;

CREATE INDEX `fk_teacher_Qualification1_idx` ON `Studented`.`teacher` (`Qualification_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`private_institute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`private_institute` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`private_institute` (
  `userid` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `start_date` DATE NOT NULL ,
  `type_id` INT NOT NULL ,
  `subtype_id` INT NOT NULL ,
  PRIMARY KEY (`userid`) ,
  CONSTRAINT `fk_private_institute_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_private_institute_type1`
    FOREIGN KEY (`type_id` )
    REFERENCES `Studented`.`type` (`type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_private_institute_subtype1`
    FOREIGN KEY (`subtype_id` )
    REFERENCES `Studented`.`subtype` (`subtype_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_private_institute_type1_idx` ON `Studented`.`private_institute` (`type_id` ASC) ;

CREATE INDEX `fk_private_institute_subtype1_idx` ON `Studented`.`private_institute` (`subtype_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`type_subtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`type_subtype` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`type_subtype` (
  `type_id` INT NOT NULL ,
  `subtype_id` INT NOT NULL ,
  PRIMARY KEY (`type_id`, `subtype_id`) ,
  CONSTRAINT `fk_type_has_subtype_type1`
    FOREIGN KEY (`type_id` )
    REFERENCES `Studented`.`type` (`type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_has_subtype_subtype1`
    FOREIGN KEY (`subtype_id` )
    REFERENCES `Studented`.`subtype` (`subtype_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_type_has_subtype_subtype1_idx` ON `Studented`.`type_subtype` (`subtype_id` ASC) ;

CREATE INDEX `fk_type_has_subtype_type1_idx` ON `Studented`.`type_subtype` (`type_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`specialization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`specialization` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`specialization` (
  `specialization_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(512) NULL ,
  PRIMARY KEY (`specialization_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`user_specialization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`user_specialization` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`user_specialization` (
  `userid` INT NOT NULL ,
  `specialization_id` INT NOT NULL ,
  PRIMARY KEY (`userid`, `specialization_id`) ,
  CONSTRAINT `fk_user_has_specialization_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_specialization_specialization1`
    FOREIGN KEY (`specialization_id` )
    REFERENCES `Studented`.`specialization` (`specialization_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_has_specialization_specialization1_idx` ON `Studented`.`user_specialization` (`specialization_id` ASC) ;

CREATE INDEX `fk_user_has_specialization_user1_idx` ON `Studented`.`user_specialization` (`userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`subtype_specialization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`subtype_specialization` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`subtype_specialization` (
  `subtype_id` INT NOT NULL ,
  `specialization_id` INT NOT NULL ,
  PRIMARY KEY (`subtype_id`, `specialization_id`) ,
  CONSTRAINT `fk_subtype_has_specialization_subtype1`
    FOREIGN KEY (`subtype_id` )
    REFERENCES `Studented`.`subtype` (`subtype_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subtype_has_specialization_specialization1`
    FOREIGN KEY (`specialization_id` )
    REFERENCES `Studented`.`specialization` (`specialization_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_subtype_has_specialization_specialization1_idx` ON `Studented`.`subtype_specialization` (`specialization_id` ASC) ;

CREATE INDEX `fk_subtype_has_specialization_subtype1_idx` ON `Studented`.`subtype_specialization` (`subtype_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`faculty` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`faculty` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `private_institute_userid` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `description` VARCHAR(512) NULL ,
  `qualification_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_Faculty_qualification1`
    FOREIGN KEY (`qualification_id` )
    REFERENCES `Studented`.`qualification` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Faculty_private_institute1`
    FOREIGN KEY (`private_institute_userid` )
    REFERENCES `Studented`.`private_institute` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Faculty_qualification1_idx` ON `Studented`.`faculty` (`qualification_id` ASC) ;

CREATE INDEX `fk_Faculty_private_institute1_idx` ON `Studented`.`faculty` (`private_institute_userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`admission_process`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`admission_process` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`admission_process` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `desc` VARCHAR(511) NULL ,
  `open_date` DATE NOT NULL ,
  `close_date` DATE NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`course` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`course` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userid` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(511) NULL ,
  `fee` INT NULL ,
  `fee_frequency` FLOAT NULL ,
  `admission_process_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_Course_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_admission_process1`
    FOREIGN KEY (`admission_process_id` )
    REFERENCES `Studented`.`admission_process` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Course_user1_idx` ON `Studented`.`course` (`userid` ASC) ;

CREATE INDEX `fk_Course_admission_process1_idx` ON `Studented`.`course` (`admission_process_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`course_specialization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`course_specialization` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`course_specialization` (
  `course_id` INT NOT NULL ,
  `specialization_id` INT NOT NULL ,
  PRIMARY KEY (`course_id`, `specialization_id`) ,
  CONSTRAINT `fk_Course_has_specialization_Course1`
    FOREIGN KEY (`course_id` )
    REFERENCES `Studented`.`course` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_specialization_specialization1`
    FOREIGN KEY (`specialization_id` )
    REFERENCES `Studented`.`specialization` (`specialization_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Course_has_specialization_specialization1_idx` ON `Studented`.`course_specialization` (`specialization_id` ASC) ;

CREATE INDEX `fk_Course_has_specialization_Course1_idx` ON `Studented`.`course_specialization` (`course_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`subscription_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`subscription_status` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`subscription_status` (
  `status` INT NOT NULL AUTO_INCREMENT ,
  `details` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`status`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`subscription` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`subscription` (
  `userid_subscriber` INT NOT NULL ,
  `user_subscribed_to` INT NOT NULL ,
  `request_date` DATE NOT NULL ,
  `status_update_date` DATE NOT NULL ,
  `relation_info` VARCHAR(255) NULL ,
  `status` INT NOT NULL ,
  PRIMARY KEY (`userid_subscriber`, `user_subscribed_to`) ,
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`userid_subscriber` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`user_subscribed_to` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription_subscription_staus1`
    FOREIGN KEY (`status` )
    REFERENCES `Studented`.`subscription_status` (`status` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_has_user_user2_idx` ON `Studented`.`subscription` (`user_subscribed_to` ASC) ;

CREATE INDEX `fk_user_has_user_user1_idx` ON `Studented`.`subscription` (`userid_subscriber` ASC) ;

CREATE INDEX `fk_subscription_subscription_staus1_idx` ON `Studented`.`subscription` (`status` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`file_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`file_type` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`file_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `handler_desc` VARCHAR(511) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`resource_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`resource_type` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`resource_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(511) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`visiblity_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`visiblity_type` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`visiblity_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(511) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`resource` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`resource` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userid` INT NOT NULL ,
  `date_of_upload` DATE NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `URL` VARCHAR(511) NOT NULL ,
  `file_type` INT NOT NULL ,
  `resource_type` INT NOT NULL ,
  `visiblity_type` INT NOT NULL ,
  `description` VARCHAR(511) NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_resource_file_type1`
    FOREIGN KEY (`file_type` )
    REFERENCES `Studented`.`file_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_resource_type1`
    FOREIGN KEY (`resource_type` )
    REFERENCES `Studented`.`resource_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_visiblity_type1`
    FOREIGN KEY (`visiblity_type` )
    REFERENCES `Studented`.`visiblity_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_resource_file_type1_idx` ON `Studented`.`resource` (`file_type` ASC) ;

CREATE INDEX `fk_resource_resource_type1_idx` ON `Studented`.`resource` (`resource_type` ASC) ;

CREATE INDEX `fk_resource_visiblity_type1_idx` ON `Studented`.`resource` (`visiblity_type` ASC) ;

CREATE INDEX `fk_resource_user1_idx` ON `Studented`.`resource` (`userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`notice_board`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`notice_board` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`notice_board` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userid` INT NOT NULL ,
  `notice` VARCHAR(511) NOT NULL ,
  `date` DATE NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_notice_board_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_notice_board_user1_idx` ON `Studented`.`notice_board` (`userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`referals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`referals` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`referals` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `referer_userid` INT NOT NULL ,
  `refered_to_userid` INT NOT NULL ,
  `refered_userid` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_referals_user1`
    FOREIGN KEY (`referer_userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_referals_user2`
    FOREIGN KEY (`refered_to_userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_referals_user3`
    FOREIGN KEY (`refered_userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_referals_user1_idx` ON `Studented`.`referals` (`referer_userid` ASC) ;

CREATE INDEX `fk_referals_user2_idx` ON `Studented`.`referals` (`refered_to_userid` ASC) ;

CREATE INDEX `fk_referals_user3_idx` ON `Studented`.`referals` (`refered_userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`event` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userid` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `date` DATE NOT NULL ,
  `start_time` TIME NULL ,
  `duration` TIME NULL ,
  `desc` VARCHAR(511) NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_event_user1_idx` ON `Studented`.`event` (`userid` ASC) ;

CREATE INDEX `idx_date` ON `Studented`.`event` (`date` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`mesage_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`mesage_type` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`mesage_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(511) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`message` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`message` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `from_userid` INT NOT NULL ,
  `to_userid` INT NOT NULL ,
  `date` DATE NOT NULL ,
  `content` VARCHAR(255) NOT NULL ,
  `mesage_type_id` INT NOT NULL ,
  `receipt` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`from_userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user2`
    FOREIGN KEY (`to_userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_mesage_type1`
    FOREIGN KEY (`mesage_type_id` )
    REFERENCES `Studented`.`mesage_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_message_user1_idx` ON `Studented`.`message` (`from_userid` ASC) ;

CREATE INDEX `fk_message_user2_idx` ON `Studented`.`message` (`to_userid` ASC) ;

CREATE INDEX `fk_message_mesage_type1_idx` ON `Studented`.`message` (`mesage_type_id` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`group_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`group_type` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`group_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(511) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Studented`.`group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`group` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`group` (
  `userid` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `desc` VARCHAR(511) NULL ,
  `owner_userid` INT NOT NULL ,
  `group_type` INT NOT NULL ,
  PRIMARY KEY (`userid`) ,
  CONSTRAINT `fk_group_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_user2`
    FOREIGN KEY (`owner_userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_group_type1`
    FOREIGN KEY (`group_type` )
    REFERENCES `Studented`.`group_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_group_user2_idx` ON `Studented`.`group` (`owner_userid` ASC) ;

CREATE INDEX `fk_group_group_type1_idx` ON `Studented`.`group` (`group_type` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`group_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`group_user` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`group_user` (
  `group_userid` INT NOT NULL ,
  `user_userid` INT NOT NULL ,
  `date` DATE NOT NULL ,
  PRIMARY KEY (`group_userid`, `user_userid`) ,
  CONSTRAINT `fk_group_has_user_group1`
    FOREIGN KEY (`group_userid` )
    REFERENCES `Studented`.`group` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_user_user1`
    FOREIGN KEY (`user_userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_group_has_user_user1_idx` ON `Studented`.`group_user` (`user_userid` ASC) ;

CREATE INDEX `fk_group_has_user_group1_idx` ON `Studented`.`group_user` (`group_userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`updates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`updates` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`updates` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userid` INT NOT NULL ,
  `content` VARCHAR(512) NOT NULL ,
  `date` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_updates_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_updates_user1_idx` ON `Studented`.`updates` (`userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`study_group_updates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`study_group_updates` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`study_group_updates` (
  `updates_id` INT NOT NULL ,
  `userid` INT NOT NULL ,
  PRIMARY KEY (`updates_id`, `userid`) ,
  CONSTRAINT `fk_study_group_updates_updates1`
    FOREIGN KEY (`updates_id` )
    REFERENCES `Studented`.`updates` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_study_group_updates_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_study_group_updates_user1_idx` ON `Studented`.`study_group_updates` (`userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`study_group_resources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`study_group_resources` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`study_group_resources` (
  `resource_id` INT NOT NULL ,
  `userid` INT NOT NULL ,
  PRIMARY KEY (`resource_id`) ,
  CONSTRAINT `fk_study_group_resources_resource1`
    FOREIGN KEY (`resource_id` )
    REFERENCES `Studented`.`resource` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_study_group_resources_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_study_group_resources_user1_idx` ON `Studented`.`study_group_resources` (`userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`updates_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`updates_comments` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`updates_comments` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `userid` INT NOT NULL ,
  `updates_id` INT NOT NULL ,
  `comment` VARCHAR(511) NOT NULL ,
  `time` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_updates_comments_updates1`
    FOREIGN KEY (`updates_id` )
    REFERENCES `Studented`.`updates` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_updates_comments_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`user` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_updates_comments_updates1_idx` ON `Studented`.`updates_comments` (`updates_id` ASC) ;

CREATE INDEX `fk_updates_comments_user1_idx` ON `Studented`.`updates_comments` (`userid` ASC) ;


-- -----------------------------------------------------
-- Table `Studented`.`study_group_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Studented`.`study_group_details` ;

CREATE  TABLE IF NOT EXISTS `Studented`.`study_group_details` (
  `userid` INT NOT NULL ,
  `visiblity_type` INT NOT NULL ,
  PRIMARY KEY (`userid`) ,
  CONSTRAINT `fk_study_group_visiblity_group1`
    FOREIGN KEY (`userid` )
    REFERENCES `Studented`.`group` (`userid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_study_group_visiblity_visiblity_type1`
    FOREIGN KEY (`visiblity_type` )
    REFERENCES `Studented`.`visiblity_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_study_group_visiblity_visiblity_type1_idx` ON `Studented`.`study_group_details` (`visiblity_type` ASC) ;

USE `Studented` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
