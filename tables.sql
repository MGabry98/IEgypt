/*
drop table Deleted_Users;
drop table [User];
drop table Viewer;
drop table Notified_Person;
drop table Contributor;
drop table Staff;
drop table Content_type;
drop table Content_manager;
drop table Reviewer;
drop table Message;
drop table Category;
drop table Sub_Category;
drop table Notification_Object;
drop table Content;
drop table Original_Content;
drop table Announcement;
drop table Ads_Photos_Link;
drop table Ads_Video_Link;
drop table Advertisement;
drop table Event_Photos_link;
drop table Event_Videos_link;
drop table Event;
drop table Rate;
drop table Comment;
drop table New_Content;
drop table Existing_Request;
drop table New_Request;
*/

create database IEgypt_64;
GO
use IEgypt_64;
GO

create table [User](
ID int PRIMARY KEY IDENTITY,
first_name VARCHAR(20) ,
middle_name VARCHAR(20),
last_name VARCHAR(20),
birth_date datetime NOT NULL,
email VARCHAR(50) unique,
password varchar(20) not null,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date))
);

GO

create table Viewer (
ID int Primary key,
FOREIGN KEY(ID) REFERENCES [User](ID) ON DELETE CASCADE ON UPDATE CASCADE,
working_place varchar(50),
working_place_type varchar(50),
working_place_description varchar(80),
);
GO

create table Notified_Person(
ID int PRIMARY KEY IDENTITY
);
GO

create table Contributor(
ID int Primary key,
FOREIGN KEY(ID) REFERENCES [User] ON DELETE CASCADE ON UPDATE CASCADE,
years_of_experience int ,
portfolio_link varchar(80) ,
specialization varchar(30),
notified_id int ,
FOREIGN KEY(notified_id) REFERENCES Notified_Person(ID) ON DELETE set null ON UPDATE CASCADE,
);
GO

create table Staff (
ID int Primary key,
FOREIGN KEY(ID) REFERENCES [User] ON DELETE CASCADE ON UPDATE CASCADE,
hire_date date ,
working_hours int,
payment_rate Decimal(20,5),
total_salary as payment_rate*working_hours,
notified_id int ,
FOREIGN KEY(notified_id) REFERENCES Notified_Person(ID) ON DELETE set null ON UPDATE CASCADE,
);
GO

create table Content_type(
type varchar(30) primary key
);
GO

create table Content_manager (
ID int primary key,
FOREIGN KEY(ID) REFERENCES Staff(ID) ON DELETE cascade ON UPDATE CASCADE,
type varchar(30),
FOREIGN KEY(type) REFERENCES Content_type(type) ON DELETE set null ON UPDATE CASCADE,
);
GO

create table Reviewer(
ID int primary key ,
FOREIGN KEY(ID) REFERENCES Staff(ID) ON DELETE cascade ON UPDATE CASCADE,
);

GO

create table Message(
sent_at datetime ,
contributer_id int ,
FOREIGN KEY(contributer_id) REFERENCES Contributor(ID) ON DELETE cascade ON UPDATE CASCADE,
viewer_id int ,
FOREIGN KEY(viewer_id) REFERENCES Viewer(ID) ,
sender_type bit,
primary key(sent_at,contributer_id,viewer_id,sender_type),
read_at datetime ,
text varchar(100),
read_status bit 
);
GO

Create table Category (
type varchar(50) primary key,
description varchar(100)
);
GO

create table Sub_Category (
category_type varchar(50),
FOREIGN KEY(category_type) REFERENCES Category(type) ON DELETE cascade ON UPDATE CASCADE,
name varchar(20),
primary key (category_type,name)
);
GO

create table Notification_Object(
ID int PRIMARY KEY IDENTITY,
);
GO

create table Content(
ID int PRIMARY KEY IDENTITY,
link varchar(50),
uploaded_at datetime,
contributer_id int ,
FOREIGN KEY(contributer_id) REFERENCES Contributor(ID) ON DELETE set null  ON UPDATE CASCADE,
category_type varchar(50),
--FOREIGN KEY(category_type) REFERENCES Sub_Category ,
subcategory_name varchar(20),
FOREIGN KEY(category_type,subcategory_name) REFERENCES Sub_Category,
type varchar(30),
FOREIGN KEY(type) REFERENCES Content_type(type) ON DELETE set null ON UPDATE CASCADE,
);
GO


create table Original_Content(
 ID int primary key,
FOREIGN KEY(ID) REFERENCES Content(ID) ON DELETE cascade ON UPDATE CASCADE,
content_manager_id int ,
FOREIGN KEY(content_manager_id) REFERENCES Content_manager(ID),
reviewer_id int ,
FOREIGN KEY(reviewer_id) REFERENCES Reviewer(ID) ,
review_status bit,
filter_status bit,
rating Decimal (20,5)
);

GO

create table Existing_Request(
id int PRIMARY KEY IDENTITY,
original_content_id int,
FOREIGN KEY(original_content_id) REFERENCES Original_Content(ID) on delete cascade on update cascade  ,
viewer_id int ,
FOREIGN KEY(viewer_id) REFERENCES Viewer(ID)  ,

);
GO


create table New_Request(
id int primary key identity,
accept_status bit,
specified varchar(50),
information varchar(100),
viewer_id int ,
FOREIGN KEY(viewer_id) REFERENCES Viewer(ID)  ,
notif_obj_id int ,
FOREIGN KEY(notif_obj_id) REFERENCES Notification_Object(ID)  ,
contributer_id int ,
FOREIGN KEY(contributer_id) REFERENCES Contributor(ID) 

);
GO
alter table New_Request add accepted_at datetime
GO

create table New_Content(
ID int primary key,
FOREIGN KEY(ID) REFERENCES Content(ID) ON DELETE cascade ON UPDATE CASCADE,
new_request_id int,
FOREIGN KEY(new_request_id) REFERENCES New_Request(id),
);
GO

create table Comment (
viewer_id int ,
FOREIGN KEY(viewer_id) REFERENCES Viewer(ID) ,
original_content_id int,
FOREIGN KEY(original_content_id) REFERENCES Original_Content(ID) ,
date datetime ,
primary key(date,viewer_id,original_content_id),
text varchar(100),
);
GO

create table Rate(
viewer_id int ,
FOREIGN KEY(viewer_id) REFERENCES Viewer(ID) ,
original_content_id int,
FOREIGN KEY(original_content_id) REFERENCES Original_Content(ID) ,
primary key(viewer_id,original_content_id),
date datetime ,
rate Decimal (20,5)
);
GO


create table Event(
id int primary key identity ,
description varchar(100),
location varchar(100),
city varchar(20),
time datetime ,
entertainer varchar(50),
viewer_id int ,
FOREIGN KEY(viewer_id) REFERENCES Viewer(ID) ,
notification_object_id int ,
FOREIGN KEY(notification_object_id) REFERENCES Notification_Object(ID)  ,
);
GO

create table Event_Photos_link(
event_id int ,
FOREIGN KEY(event_id) REFERENCES Event(id) on delete cascade on update cascade ,
link varchar(50) unique,
primary key(event_id,link)
);
GO


create table Event_Videos_link(
event_id int ,
FOREIGN KEY(event_id) REFERENCES Event(id) on delete cascade on update cascade ,
link varchar(50) unique,
primary key(event_id,link)
);

GO

create table Advertisement(
id int primary key identity ,
description varchar(100),
location varchar(100),
event_id int ,
FOREIGN KEY(event_id) REFERENCES Event(id) ,
viewer_id int ,
FOREIGN KEY(viewer_id) REFERENCES Viewer(ID) ,
);
GO

create table Ads_Video_Link(
advertisement_id int,
FOREIGN KEY(advertisement_id) REFERENCES Advertisement(id) ,
link varchar(30),
primary key(advertisement_id,link)
);
GO

create table Ads_Photos_Link(
advertisement_id int,
FOREIGN KEY(advertisement_id) REFERENCES Advertisement(id) ,
link varchar(30),
primary key(advertisement_id,link)
);
GO

create table Announcement (
ID int primary key identity ,
seen_at datetime,
sent_at datetime,
notified_person_id int,
FOREIGN KEY(notified_person_id) REFERENCES Notified_Person(ID),
notification_object_id int ,
FOREIGN KEY(notification_object_id) REFERENCES Notification_Object(ID)
);
GO



create table Deleted_Users(
ID int primary key ,
foreign key (ID) references [User](ID) on delete cascade on update cascade,
delete_date datetime 
);
GO