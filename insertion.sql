use IEgypt_64;
GO
--1
insert into Category (type,description) values ('Educational','Education is the process of facilitating learning');
insert into Sub_Category(category_type,name) values ('Educational','University');
insert into Sub_Category(category_type,name) values ('Educational','School');
insert into Category (type) values ('Investment');
insert into Sub_Category(category_type,name) values ('Investment','Bank');
insert into Sub_Category(category_type,name) values ('Investment','Company');
insert into Category (type) values ('Tourism');
insert into Sub_Category(category_type,name) values ('Tourism','Hotel');
insert into Sub_Category(category_type,name) values ('Tourism','Museum');


--2
insert into [User] (email, first_name, middle_name, last_name, birth_date, password)values('saad@gmail.com','Omar','Mohamed','Saad','3/4/1999','Saad');
insert into [User] (email, first_name, middle_name, last_name, birth_date, password)values('gabry@gmail.com','Mohamed','Essam','Gabry','7/16/1998','Gabry');
insert into [User] (email, first_name, middle_name, last_name, birth_date, password)values('aya@gmail.com','Aya','Anis','Yehia','7/12/1998','Aya');
insert into [User] (email, first_name, middle_name, last_name, birth_date, password)values('nawal@gmail.com','Nawal','Mostafa','Selim','11/16/1998','Nawal');
insert into [User] (email, first_name, middle_name, last_name, birth_date, password)values('ronaldinho@gmail.com','Ronaldinho','Ronaldinho','Ronaldinho','4/3/1980','Ronaldinho');
insert into [User] (email, first_name, last_name, birth_date, password)values('shikabala@gmail.com','Mahmoud','Shikabala','9/12/1982','Shika');
insert into [User] (email, first_name, last_name, birth_date, password)values('salah@gmail.com','Mohamed','Salah','8/3/1994','Salah');
insert into [User] (email, first_name, last_name, birth_date, password)values('henedy@gmail.com','Mohamed','Henedy','5/26/1970','Henedy');
insert into [User] (email, first_name, last_name, birth_date, password)values('abo7afeza@gmail.com','Akram','Hosny','6/11/1985','Ibbo');
insert into [User] (email, first_name, last_name, birth_date, password)values('mortada@gmail.com','Mortada','Mansour','6/11/1960','Omak');
insert into [User] (email, first_name, last_name, birth_date, password)values('bassem@gmail.com','Bassem','Youssef','2/21/1989','Bassem');
insert into [User] (email, first_name, last_name, birth_date, password)values('joker@gmail.com','Heath', 'Ledger','12/12/1983','Joker');
insert into [User] (email, first_name, middle_name, last_name, birth_date, password)values('lemby@gmail.com','Mohamed','Saad','Lemby','12/10/1979','Lemby');

insert into Viewer (ID,working_place, working_place_type, working_place_description) values (1,'GUC','University','FF');
insert into Viewer (ID,working_place, working_place_type, working_place_description) values (10,'Zamalek','Club','African club of century');
insert into Viewer (ID,working_place, working_place_type, working_place_description) values (7,'Liverpool','Club','plays in PL');

SET IDENTITY_INSERT Notified_Person ON
insert into Notified_Person(ID) values (1);
insert into Notified_Person(ID) values (2);
insert into Notified_Person(ID) values (3);
insert into Notified_Person(ID) values (4);
insert into Notified_Person(ID) values (5);
insert into Notified_Person(ID) values (6);
insert into Notified_Person(ID) values (7);
insert into Notified_Person(ID) values (8);
insert into Notified_Person(ID) values (9);
insert into Notified_Person(ID) values (10);
SET IDENTITY_INSERT Notified_Person OFF

insert into Contributor (ID , years_of_experience, portfolio_link, specialization, notified_id) values (2,3,null,'designer',1);
insert into Contributor (ID , years_of_experience, portfolio_link, specialization, notified_id) values (5,5,null,'photographer',2);
insert into Contributor (ID , years_of_experience, portfolio_link, specialization, notified_id) values (8,4,null,'video editor',3);
insert into Contributor (ID , years_of_experience, portfolio_link, specialization, notified_id) values (11,6,null,'director',4);
insert into Contributor (ID , years_of_experience, portfolio_link, specialization, notified_id) values (13,5,null,'music producer',5);

insert into Staff(ID , hire_date, working_hours, payment_rate, notified_id) values (3,'4/4/2008',8,20.3,6);
insert into Staff(ID , hire_date, working_hours, payment_rate, notified_id) values (4,'12/6/2015',10,29.3,7);
insert into Staff(ID , hire_date, working_hours, payment_rate, notified_id) values (6,'10/20/2013',8,40.6,8);
insert into Staff(ID , hire_date, working_hours, payment_rate, notified_id) values (9,'1/30/2010',8,30.1,9);
insert into Staff(ID , hire_date, working_hours, payment_rate, notified_id) values (12,'4/4/2008',6,24,10);

insert into Reviewer (ID) values(3);
insert into Reviewer (ID) values(4);


insert into Content_type (type) values ('logo');
insert into Content_type (type) values ('photo');
insert into Content_type (type) values ('video');
insert into Content_type (type) values ('music');

insert into Content_manager (ID, type) values (6,'logo') ;
insert into Content_manager (ID, type) values (9,'photo') ;
insert into Content_manager (ID, type) values (12,'video') ;


--4
insert into Content(uploaded_at, contributer_id, category_type, subcategory_name , type) values('5/6/2018',5,'Educational','University','photo');
insert into Content(uploaded_at, contributer_id, category_type, subcategory_name , type) values('9/2/2017',2,'Investment','Bank','logo');
insert into Content(uploaded_at, contributer_id, category_type, subcategory_name , type) values('12/11/2015',8,'Investment','Bank','video');

insert into Original_Content (ID,content_manager_id, reviewer_id,review_status, filter_status, rating)values(1,9,3,1,1,5);
insert into Original_Content (ID,content_manager_id, reviewer_id,review_status, filter_status, rating)values(2,6,4,1,1,4);
insert into Original_Content (ID,content_manager_id, reviewer_id,review_status, filter_status, rating)values(3,12,3,0,0,2);

--3
insert into Existing_Request( original_content_id, viewer_id) values(1,1);
insert into Existing_Request( original_content_id, viewer_id) values(2,10);

set identity_insert Notification_Object on 
insert into Notification_Object (ID) values (1);
insert into Notification_Object (ID) values (2);
insert into Notification_Object (ID) values (3);
insert into Notification_Object (ID) values (4);
insert into Notification_Object (ID) values (5);
insert into Notification_Object (ID) values (6);
insert into Notification_Object (ID) values (7);
insert into Notification_Object (ID) values (8);
insert into Notification_Object (ID) values (9);
insert into Notification_Object (ID) values (10);
insert into Notification_Object (ID) values (11);
set identity_insert Notification_Object off 

insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(1,'design',null,7,1,2);
insert into Announcement (notified_person_id, notification_object_id) values (1,1);
insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(1,'design',null,10,2,2);
insert into Announcement (notified_person_id, notification_object_id) values (1,2);

insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(1,'music',null,1,3,13);
insert into Announcement (notified_person_id, notification_object_id) values (5,3);
insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(1,'music',null,10,4,13);
insert into Announcement (notified_person_id, notification_object_id) values (5,4);
insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(1,'music',null,7,5,13);
insert into Announcement (notified_person_id, notification_object_id) values (5,5);

insert into Content(uploaded_at, contributer_id, category_type, subcategory_name , type) values('8/7/2018',13,'Educational','University','music');
insert into Content(uploaded_at, contributer_id, category_type, subcategory_name , type) values('2/8/2018',13,'Educational','University','music');
insert into Content(uploaded_at, contributer_id, category_type, subcategory_name , type) values('3/1/2018',13,'Educational','University','music');

insert into New_Content(ID , new_request_id) values (4,3);
insert into New_Content(ID , new_request_id) values (5,4);
insert into New_Content(ID , new_request_id) values (6,5);

insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(1,'video',null,1,6,8);
insert into Announcement (notified_person_id, notification_object_id) values (3,6);
insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(1,'photo',null,7,7,5);
insert into Announcement (notified_person_id, notification_object_id) values (2,7);
insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(1,'logo',null,10,8,2);
insert into Announcement (notified_person_id, notification_object_id) values (1,8);

insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(0,null,null,1,9,null);
insert into Announcement (notification_object_id) values (9);
insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(0,null,null,7,10,null);
insert into Announcement (notification_object_id) values (10);
insert into New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)values(0,null,null,10,11,null);
insert into Announcement (notification_object_id) values (11);

--5
set identity_insert Notification_Object on 
insert into Notification_Object (ID) values (12);
insert into Notification_Object (ID) values (13);
set identity_insert Notification_Object off


insert into Event(description, location, city, time, entertainer, notification_object_id, viewer_id) values ('1st event','mohandsen gameet al dewal','giza','12/9/2018 8:30:00 PM',null,12,7);
insert into Announcement (notification_object_id) values (12);
insert into Event(description, location, city, time, entertainer, notification_object_id, viewer_id) values ('2nd event','citystars nasr city ','cairo','1/2/2018 7:00:00 PM',null,13,1);
insert into Announcement (notification_object_id) values (13);
--7
insert into Advertisement (description, location, event_id, viewer_id)values('1st ad','da2ery',1,7);
insert into Advertisement (description, location, event_id, viewer_id)values('2nd ad','me7war',2,1);