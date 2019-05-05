use IEgypt_64;
GO

CREATE proc Original_Content_Search
@typename varchar(30),
@categoryname varchar(50)
as 
select  link,uploaded_at,type,category_type,subcategory_name,Original_Content.rating
from Original_Content,Content 
where Original_Content.ID=Content.ID and Original_Content.review_status =1 and Original_Content.filter_status=1 and (Content.type=@typename or  Content.category_type=@categoryname);
GO
--Exec Original_Content_Search @typename = 'logo' ,@categoryname='Investment';
--drop proc Original_Content_Search
--GO

create proc Contributor_Search 
@fullname varchar(50)
as 
select  value into temp FROM STRING_SPLIT(@fullname,' ');
alter table temp 
add id int identity  
declare @firstname varchar(50)
declare @middlename varchar(50)
declare @lastname varchar(50)
select @firstname = value from temp where id=1;
select @middlename = value from temp where id=2;
select @lastname = value from temp where id=3;

select [User].first_name,[User].middle_name,[User].last_name ,email,years_of_experience, portfolio_link, specialization from Contributor,[User] 
where Contributor.ID=[User].ID and [User].first_name=@firstname and [User].middle_name=@middlename and [User].last_name=@lastname; 

drop table temp;
--exec Contributor_Search @fullname = 'Ronaldinho Ronaldinho Ronaldinho'
--exec Contributor_Search @fullname = 'Mohamed Essam Gabry'
--drop proc Contributor_Search
--Go

create proc Contributor_Search1 
@fullname varchar(50),
@cont_id int  OUTPUT
as 
select  value into temp FROM STRING_SPLIT(@fullname,' ');
alter table temp 
add id int identity  
declare @firstname varchar(50)
declare @middlename varchar(50)
declare @lastname varchar(50)
select @firstname = value from temp where id=1;
select @middlename = value from temp where id=2;
select @lastname = value from temp where id=3;

select @cont_id=Contributor.ID  from Contributor,[User] 
where Contributor.ID=[User].ID and [User].first_name=@firstname and [User].middle_name=@middlename and [User].last_name=@lastname; 

drop table temp;
GO

create proc Register_User @usertype varchar(50), @email varchar(50), @password varchar(50), @firstname varchar(50),
@middlename varchar(50), @lastname varchar(50), @birth_date datetime, @working_place_name varchar(50), @working_place_type varchar(50),
@wokring_place_description varchar(50), @specilization varchar(50), @portofolio_link varchar(50), @years_experience int, @hire_date datetime,
@working_hours int, @payment_rate decimal(20,5), @user_id int OUTPUT
as
insert into [User] (email, first_name, middle_name, last_name, birth_date, password) Values(@email,@firstname,@middlename,@lastname,@birth_date,@password);
select @user_id=ID from [User] where email=@email;
if (@usertype='Viewer') 
	insert into Viewer(ID , working_place, working_place_type, working_place_description)values (@user_id,@working_place_name,@working_place_type,@wokring_place_description);
else 
	if (@usertype='Contributor')
		insert into Contributor(ID , years_of_experience, portfolio_link, specialization)values(@user_id,@years_experience,@portofolio_link,@specilization)
	else
		insert into Staff (ID , hire_date, working_hours, payment_rate)values(@user_id,@hire_date,@working_hours,@payment_rate)

		if (@usertype='Authorized Reviewer')
			insert into Reviewer (ID) values(@user_id)
		else 
			if(@usertype='Content Manager')
				insert into Content_manager (ID) values (@user_id)
GO
/*declare @user_id int

 declare @usertype varchar(50)='Content Manager' 
 declare @email varchar(50)= 'naga77' 
 declare @password varchar(50)='safla'
 declare @firstname varchar(50)='Leo'
 declare @middlename varchar(50)='messi'
 declare @lastname varchar(50)='saadon'
 declare @birth_date datetime='4/4/2003'
 declare @working_place_name varchar(50)=null
declare @working_place_type varchar(50)=null
declare @wokring_place_description varchar(50)=null
declare @specilization varchar(50)=null
declare @portofolio_link varchar(50)=null
declare @years_experience int=2
declare @hire_date datetime='12/12/2012'
declare @working_hours int=8
declare @payment_rate decimal(20,5)=200.5

exec Register_User @usertype  ,@email ,@password,
@firstname,@middlename,@lastname,@birth_date,@working_place_name,
@working_place_type,@wokring_place_description,@specilization,@portofolio_link, @years_experience, @hire_date,
@working_hours, @payment_rate, @user_id OUTPUT 

print (@user_id)

drop proc Register_User

Go*/


create proc Check_Type @typename varchar(50),
@content_manager_id int
as
if	(not exists(select type from Content_type where type=@typename))
   insert into Content_type (type) values (@typename)

update Content_manager set type=@typename where ID=@content_manager_id;

GO

--exec Check_Type @typename='pic' ,@content_manager_id =9
--drop proc Check_Type
--GO


CREATE proc Order_Contributor 
as
select [User].first_name,[User].middle_name,[User].last_name ,email,years_of_experience, portfolio_link, specialization from Contributor,[User] 
where [User].ID=Contributor.ID
order by years_of_experience desc;
Go

--exec Order_Contributor
--drop proc Order_Contributor
--GO
CREATE proc Show_Original_Content
@contributor_id int
as 
if(@contributor_id =0 or @contributor_id is null )
	select  link,uploaded_at,type,category_type,subcategory_name,Original_Content.rating from Original_Content,Content where review_status =1 and filter_status=1 and Original_Content.ID=Content.ID;
	else 
		select link,uploaded_at,type,category_type,subcategory_name,Original_Content.rating,first_name,middle_name,last_name,email, years_of_experience, portfolio_link, specialization from Original_Content,Content,Contributor,[User] where [User].ID=Contributor.ID and Contributor.ID=@contributor_id and Original_Content.ID =Content.ID and Content.contributer_id=@contributor_id  and Original_Content.review_status =1 and Original_Content.filter_status=1;

GO

-- drop proc Show_Original_Content
--exec Show_Original_Content @contributor_id = null
--GO

--------------------As a registered user ---------------------------------------



CREATE proc User_login 
@email varchar(50),
@password varchar(50), 
@user_id int OUTPUT
as 

if (not exists(select ID from [User] where email=@email and password=@password))
set @user_id = -1;

else if ((exists(select ID from [User] where email=@email and password=@password)and not exists(select Deleted_Users.ID from Deleted_Users,[User] where Deleted_Users.ID=[User].ID and [User].email=@email and [User].password=@password)))
	select @user_id =ID from [User] where email=@email and password=@password;

else if(exists(select Deleted_Users.ID from Deleted_Users,[User] where
Deleted_Users.ID=[User].ID and [User].email=@email and [User].password=@password)) begin
declare @y datetime
select @y=Deleted_Users.delete_date from Deleted_Users,[User] where @email=[User].email and @password=[User].password and [User].ID=Deleted_Users.ID
SELECT DATEDIFF(Day, @y, CURRENT_TIMESTAMP) as Dif into x;
alter table x add ID int identity
declare @day int
select @day=Dif from x where ID=1
declare @z int 
select @z=ID from [User] where @email = email and @password = password;   
if(@day <=14)begin
delete from Deleted_Users where ID = @z
select @user_id =ID from [User] where email=@email and password=@password;
end
else 
set @user_id = -1;

drop table x;
end

GO
/*drop proc User_login
declare @user_id int
declare @email varchar(50)='saad@gmail.com'--'gabry@gmail.com'
declare @password varchar(50)= 'Saad'
exec User_login 
@email ,
@password, 
@user_id OUTPUT
print(@user_id)
GO*/


create proc Show_Profile
@user_id int, @email varchar(50) OUTPUT, @password varchar(50) OUTPUT, @firstname varchar(50) OUTPUT, @middlename varchar(50) OUTPUT,
@lastname varchar(50) OUTPUT , @birth_date datetime OUTPUT, @working_place_name varchar(50) OUTPUT, @working_place_type varchar(50) OUTPUT, @wokring_place_description varchar(100) OUTPUT, @specilization varchar(30) OUTPUT,
@portofolio_link varchar(50) OUTPUT, @years_experience int OUTPUT, @hire_date datetime OUTPUT, @working_hours int OUTPUT, @payment_rate decimal(20,5) OUTPUT 
as
if(exists (select ID from Deleted_Users where @user_id=ID ))
begin
set @email=null 
set @password=null 
set @firstname=null
set @middlename=null
set @lastname= null 
set @birth_date=null
set @working_place_name=null
set @working_place_type=null
set @wokring_place_description=null
set @specilization = null
set @portofolio_link=null
set @years_experience=null
set @hire_date=null
set @payment_rate=null
set @working_hours=null
end
else 
begin
select @email=email,@firstname=first_name,@middlename=middle_name,@lastname=last_name,
@birth_date=birth_date,@password=password from [User] where @user_id=ID
if(exists (select ID from Viewer where @user_id=ID))
begin
select @working_place_name=working_place,@working_place_type=working_place_type,@wokring_place_description=working_place_description
from Viewer where @user_id=ID
end 
else if(exists (select ID from Contributor where @user_id=ID))
begin
select @years_experience=years_of_experience,@portofolio_link=portfolio_link,@specilization=specialization
from Contributor where @user_id=ID
end
else if(exists (select ID from Staff where @user_id=ID))
begin
select @hire_date=hire_date,@working_hours=working_hours,@payment_rate=payment_rate
from Staff where @user_id=ID
end
end
GO

/*drop proc Show_Profile 
declare @user_id int =2
declare @email varchar(50)
declare @password varchar(50)
declare @firstname varchar(50)
declare @middlename varchar(50)
declare @lastname varchar(50)
declare @birth_date datetime
declare @working_place_name varchar(50)
declare @working_place_type varchar(50)
declare @wokring_place_description varchar(50)
declare @specilization varchar(50)
declare @portofolio_link varchar(50)
declare @years_experience int
declare @hire_date datetime
declare @payment_rate decimal(20,5) 
declare @working_hours int
exec Show_Profile @user_id, @email OUTPUT, @password OUTPUT, @firstname OUTPUT, @middlename OUTPUT,
@lastname OUTPUT, @birth_date OUTPUT, @working_place_name OUTPUT, @working_place_type OUTPUT, @wokring_place_description OUTPUT, @specilization OUTPUT,
@portofolio_link OUTPUT, @years_experience OUTPUT, @hire_date OUTPUT, @working_hours
OUTPUT, @payment_rate OUTPUT
print(@firstname)
print(@working_place_name)
print(@payment_rate)
print(@years_experience)
GO*/

create proc Edit_Profile 
@user_id int , @email varchar(50), @password varchar(50),
@firstname varchar(50), @middlename varchar(50), @lastname varchar(50),
@birth_date datetime, @working_place_name varchar(50), @working_place_type varchar(50),
@working_place_description varchar(50), @specilization varchar(50),
@portofolio_link varchar(50), @years_experience int, @hire_date datetime,
@working_hours int, @payment_rate Decimal(20,5)
as 
update [User] 
set email=@email,password=@password,first_name=@firstname,
middle_name=@middlename ,last_name=@lastname, birth_date=@birth_date
where ID=@user_id; 

if(exists (select ID from Contributor where ID=@user_id))
  update Contributor set years_of_experience=@years_experience, portfolio_link=@portofolio_link,
  specialization=@specilization where ID=@user_id;
else if(exists (select ID from Viewer where ID=@user_id))
	update Viewer set working_place=@working_place_name ,working_place_type=@working_place_type,
	working_place_description=@working_place_description where ID=@user_id;
else if(exists (select ID from Staff where ID=@user_id))
	update Staff set hire_date=@hire_date , working_hours=@working_hours,
	payment_rate=@payment_rate where ID=@user_id;

GO

/*exec Edit_Profile 
@user_id=9, @email='ahmedahmar@gmail.com', @password='7amra',
@firstname='Ahmed', @middlename='El', @lastname='Ahmar', @birth_date='5/5/1986', @working_place_name=null, @working_place_type=null,
@working_place_description=null, @specilization=null, @portofolio_link=null, @years_experience=4, @hire_date='1/2/2009',
@working_hours=10, @payment_rate=200.3 
drop proc Edit_Profile
go
*/

create proc Deactivate_Profile @user_id int
as 
if(not exists (select ID from Deleted_Users where ID=@user_id))
insert into Deleted_Users (ID,delete_date) values (@user_id,CURRENT_TIMESTAMP);

GO
--exec  Deactivate_Profile @user_id=1
--GO


create proc Show_Event @event_id int 
as 
if (exists (select id from Event where id=@event_id))
	select Event.id , Event.description, Event.location, Event.city, Event.time, Event.entertainer, Event.notification_object_id, Event.viewer_id ,[User].first_name,[User].middle_name,[User].last_name
	from Event ,Viewer , [User] 
	where Event.id=@event_id and Viewer.ID=Event.viewer_id and [User].ID=Viewer.ID;
else 
select * from Event where CURRENT_TIMESTAMP< Event.time;

GO 
--exec Show_Event @event_id = 1 
--drop proc Show_Event 
--GO 


create proc Show_Notification @user_id int
as
if(exists(select ID from Contributor where ID=@user_id))
select Announcement.ID , Announcement.seen_at,Announcement.sent_at, Announcement.notified_person_id, Announcement.notification_object_id
from Announcement, Contributor 
where @user_id=Contributor.ID and Announcement.notified_person_id=Contributor.notified_id
else if( exists(select ID from Staff where Id=@user_id))

select Announcement.ID , Announcement.seen_at,Announcement.sent_at, Announcement.notified_person_id, Announcement.notification_object_id
from Announcement, Staff 
where @user_id=Staff.ID and Announcement.notified_person_id=Staff.notified_id

GO

--exec Show_Notification @user_id=13
--GO

create proc Show_New_Content @viewer_id int, @content_id int
as
if(@content_id is null)
select* from New_Content;
else 
select New_Content.ID,New_Content.new_request_id,Content.category_type,Content.link,
Content.subcategory_name,Content.type,Content.uploaded_at,Content.contributer_id,
[User].first_name,[User].middle_name,[User].last_name 
from New_Content,Content,[User],New_Request
where New_Request.id=New_Content.new_request_id and New_Request.viewer_id=@viewer_id and
New_Content.ID=@content_id and New_Content.ID=Content.ID and
Content.contributer_id=[User].ID;

GO
--drop proc Show_New_Content
--exec Show_New_Content @viewer_id=1 ,@content_id=4;
--GO





------------------As a viewer ------------------------------------------

create proc Viewer_Create_Event
@city Varchar(50),
@event_date_time datetime ,
@description varchar(100), 
@entartainer varchar(50),
@viewer_id int, 
@event_id int OUTPUT
as

declare @x int
insert into Notification_Object default values
	select @x= (SELECT SCOPE_IDENTITY())
insert into Event (city,time,description,entertainer,viewer_id,notification_object_id)
values (@city,@event_date_time,@description,@entartainer,@viewer_id,@x);
  select @event_id =   (SELECT SCOPE_IDENTITY())

insert into Announcement (sent_at, notification_object_id)values (CURRENT_TIMESTAMP,@x)

GO

/*declare @city varchar(20)='cairo'
declare @event_date_time datetime=null 
declare @description varchar(50)='dsd' 
declare @entartainer varchar(50)=null
declare @viewer_id int=null
declare @event_id int
exec Viewer_Create_Event @city ,
@event_date_time ,
@description , 
@entartainer ,
@viewer_id , 
@event_id OUTPUT 

print(@event_id)
drop proc Viewer_Create_Event
*/

create proc Viewer_Upload_Event_Photo 
@event_id int , @link varchar(50)
as 
insert into Event_Photos_link (event_id,link)values (@event_id,@link)
GO

create proc Viewer_Upload_Event_Video 
@event_id int,
@link varchar(50)
as
insert into Event_Videos_link(event_id, link) values(@event_id,@link)
GO


create proc Viewer_Create_Ad_From_Event @event_id int 
as 
declare @des varchar(50)
declare @loc varchar(50)
declare @viewer int
select @des = description,@loc = location,@viewer=viewer_id from Event where @event_id=id;

insert into Advertisement (description, location, event_id, viewer_id)
values (@des,@loc,@event_id,@viewer);
GO
--exec Viewer_Create_Ad_From_Event @event_id=1
--GO

create proc Apply_Existing_Request
@viewer_id int ,@original_content_id int 
as
if(exists(select ID from Original_Content where ID=@original_content_id and (rating=4 or rating =5)))
insert into Existing_Request (original_content_id, viewer_id) values (@viewer_id,@original_content_id)
GO

--exec Apply_Existing_Request @viewer_id=2 ,@original_content_id=1
--GO

create proc Apply_New_Request @information varchar(100), @contributor_id int, @viewer_id int
as
declare @x int
--declare @y int
insert into Notification_Object default values
select @x= (SELECT SCOPE_IDENTITY())
insert into New_Request(information, viewer_id, notif_obj_id,contributer_id)
values (@information,@viewer_id,@x,@contributor_id)
if(@contributor_id is null)begin
DECLARE @i int = 0
Declare @omar int
declare @temp_id int 
declare @ttemp int
Select *
Into   #Temp
From   Contributor
select @omar=count(*) From Contributor
WHILE (@i < @omar)
BEGIN
	Select Top 1 @temp_id = Id From #Temp

	select @ttemp=notified_id from Contributor where ID=@temp_id
    insert into Announcement (sent_at, notified_person_id, notification_object_id)
	values (CURRENT_TIMESTAMP,@ttemp,@x)
    Delete #Temp Where Id = @temp_id
    SET @i = @i + 1
END
end 
else 
begin
declare @z int 
select @z=notified_id from Contributor where @contributor_id=ID
insert into Announcement(sent_at, notified_person_id, notification_object_id)
values(CURRENT_TIMESTAMP,@z,@x)
end
--insert into Content(uploaded_at,contributer_id)values (CURRENT_TIMESTAMP,@contributor_id)
--select @y= (SELECT SCOPE_IDENTITY())
--insert into New_Content()

GO
--drop proc Apply_New_Request
--exec Apply_New_Request @information='ay haga t3bna', @contributor_id=null, @viewer_id=1
GO


CREATE PROC Delete_New_Request
@request_id int
as
declare @x bit
SELECT @x=accept_status
FROM New_Request
WHERE @request_id=id
if(@x=0 or @x is null)
DELETE FROM New_Request
WHERE @request_id=id;
GO

--exec Delete_New_Request @request_id=12
--GO

CREATE proc Rating_Original_Content
@orignal_content_id int,
@rating_value int,
@viewer_id int
as 
if(exists (select * from Original_Content where @orignal_content_id=ID))
UPDATE Original_Content
SET rating=@rating_value, reviewer_id=@viewer_id
WHERE ID=@orignal_content_id
GO

--exec Rating_Original_Content @orignal_content_id =1,@rating_value =4,@viewer_id = 10
--GO

CREATE PROC Write_Comment
@comment_text varchar(50),
@viewer_id int,
@original_content_id int,
@written_time datetime
as
if(not exists(select* from Comment where @viewer_id=viewer_id and @original_content_id=original_content_id and @written_time=date))
INSERT INTO Comment(Viewer_id,original_content_id,date,text)
VALUES(@viewer_id,@original_content_id,@written_time,@comment_text)
GO

--exec Write_Comment @comment_text='ajhdlidjd' , @viewer_id=1,@original_content_id=1,@written_time='4/4/2012'
--GO


CREATE PROC Edit_Comment
@comment_text varchar(50), 
@viewer_id int, 
@original_content_id int, 
@last_written_time datetime, 
@updated_written_time datetime
as
UPDATE Comment
SET text=@comment_text, date=@updated_written_time
WHERE Viewer_id=@viewer_id AND original_content_id=@original_content_id AND date=@last_written_time
GO

--exec Edit_Comment @comment_text='new' , @viewer_id=1 , @original_content_id=1,
--@last_written_time='4/4/2012' ,@updated_written_time='1/1/2001'
--GO


CREATE PROC Delete_Comment
@viewer_id int,
@original_content_id int, 
@written_time datetime
as
DELETE FROM Comment
WHERE Viewer_id=@viewer_id AND original_content_id=@original_content_id AND date=@written_time
GO

--exec Delete_Comment  @viewer_id=1 , @original_content_id=1 ,@written_time='1/1/2001'
--GO


CREATE PROC Create_Ads
@viewer_id int,
@description varchar(50), 
@location varchar(50)
as
INSERT INTO Advertisement(viewer_id,description,location)
VALUES(@viewer_id,@description,@location)
GO

--exec Create_Ads  @viewer_id=1 ,@description='asasas',@location='beety'
--GO

CREATE PROC Edit_Ad 
@ad_id int,
@description varchar(50), 
@location varchar(50)
as 
UPDATE Advertisement
SET description=@description, location=@location
WHERE id=@ad_id
GO
--exec Edit_Ad @ad_id=3 ,@description='gdeed' ,@location='my home'
--go


CREATE PROC Delete_Ads 
@ad_id int 
as
if(exists(select * from Advertisement where @ad_id=id))
DELETE FROM Advertisement
WHERE id=@ad_id
GO


CREATE PROC Send_Message 
@msg_text varchar(50), 
@viewer_id int, 
@contributor_id int,
@sender_type bit, 
@sent_at datetime
as
INSERT INTO Message(sent_at,contributer_id, viewer_id, sender_type,text)
VALUES(@sent_at,@contributor_id, @viewer_id,@sender_type,@msg_text)
GO

--drop proc Send_Message
--exec Send_Message @msg_text='new message' ,@viewer_id=1 ,@contributor_id=5,@sender_type=1,@sent_at='1/2/2018'
--GO


CREATE PROC Show_Message 
@contributor_id int
as
SELECT *
FROM Message 
WHERE contributer_id=@contributor_id
GO

--exec Show_Message @contributor_id=5
--GO

CREATE PROC Highest_Rating_Original_content
as
declare @max int
SELECT @max=MAX(rating) FROM Original_Content 
SELECT * FROM Original_Content 
WHERE rating=@max
GO
--exec Highest_Rating_Original_content

create proc Assign_New_Request @request_id int,
@contributor_id int
as
update New_Request set contributer_id=@contributor_id 
where @request_id=id and contributer_id is null
GO

--exec Assign_New_Request @request_id=13 , @contributor_id=5
--GO

------------------------------------Contributor ----------------------------
create proc Receive_New_Requests @request_id int, @contributor_id int
as
if(@request_id is null)
select * from New_Request where @contributor_id=contributer_id
else 
select * from New_Request 
where @request_id=id and (@contributor_id=contributer_id or contributer_id is null)
GO

--exec Receive_New_Requests @request_id=6 ,@contributor_id=5
--GO

create proc Respond_New_Request @contributor_id int,
@accept_status bit,  @request_id int
as
update New_Request set accept_status=@accept_status ,contributer_id=@contributor_id,
accepted_at=CURRENT_TIMESTAMP
where @request_id=id and (accept_status is null or accept_status=0)
GO

--exec Respond_New_Request @contributor_id=5 , @accept_status=1 ,@request_id=1
--GO

create proc Upload_Original_Content @type_id varchar(50),
@subcategory_name varchar(50), @category_id varchar(50), @contributor_id int, @link varchar(50)
as
if(not exists (select type from Content_type where @type_id= type))
insert into Content_type(type) values (@type_id)
if(not exists (select type from Category where @category_id=type))
insert into Category(type)  values (@category_id)
if(not exists (select * from Sub_Category 
where category_type=@category_id and name=@subcategory_name))
insert into Sub_Category(category_type,name)  values (@category_id,@subcategory_name)

declare @x int 
insert into Content (link, uploaded_at, contributer_id, category_type, subcategory_name , type)
values(@link,CURRENT_TIMESTAMP,@contributor_id,@category_id,@subcategory_name,@type_id)
select @x= (SELECT SCOPE_IDENTITY())
insert into Original_Content(ID) values (@x)
GO
--exec Upload_Original_Content @type_id='logo', @subcategory_name='Hotel',@category_id='Tourism' , @contributor_id=5 ,@link='asdfg'
--GO


create proc Upload_New_Content @new_request_id int, @contributor_id int,
@subcategory_name varchar(50), @category_id varchar(50), @link varchar(100)
as
declare @x int
insert into Content (link, uploaded_at, contributer_id, category_type, subcategory_name)
values(@link,CURRENT_TIMESTAMP,@contributor_id,@category_id,@subcategory_name)
select @x= (SELECT SCOPE_IDENTITY())
insert into New_Content (ID , new_request_id) values (@x,@new_request_id)
GO


create proc Delete_Content @content_id int
as
if(not exists(select * from Original_Content where ID=@content_id) 
or exists(select * from Original_Content where @content_id=ID and review_status is null and filter_status is null ))
delete from Content where ID=@content_id
GO

--exec Delete_Content @content_id=3
--GO

create proc Receive_New_Request @contributor_id int,@can_receive bit OUTPUT
as
declare @x int
select @x=count(id) from New_Request 
where @contributor_id=contributer_id and accept_status is null group by contributer_id
if(@x>=3)
set @can_receive=0
else 
set @can_receive=1
GO

/*declare @contributor_id int = 2
declare @can_receive  bit
exec Receive_New_Request @contributor_id,@can_receive OUTPUT
print(@can_receive)
GO
*/
------------------------------------Staff member----------------------------
CREATE PROC reviewer_filter_content
       @reviewer_id int,
       @original_content int,
       @status bit 
	   as
       UPDATE Original_Content
       SET review_status=@status, reviewer_id=@reviewer_id
       WHERE ID=@original_content
GO
/*exec reviewer_filter_content   @reviewer_id =3,
       @original_content =3,
       @status =0 
GO*/



CREATE PROC content_manager_filter_content
    @content_manager_id int,
    @original_content int,
    @status bit
	as
   declare @type varchar(50)
   select @type = type from Content_manager 
   where @content_manager_id=ID
   declare @type1 varchar(50)
   select @type1 = type from Content where ID=@original_content
   if(@type=@type1)
   UPDATE Original_Content
   SET filter_status=@status, content_manager_id=@content_manager_id
   WHERE @original_content=ID
GO

/*exec content_manager_filter_content @content_manager_id =9,
    @original_content =3,
    @status = 1
GO*/

CREATE PROC Staff_Create_Category
@category_name varchar(50)
as
if(not exists(select type from Category where @category_name=type))
INSERT INTO Category(type)
VALUES(@category_name)
GO

--exec Staff_Create_Category @category_name='Ahmed'
--GO
--drop proc Staff_Create_Category
       
CREATE PROC Staff_Create_Subcategory
@category_name varchar(50),
@subcategory_name varchar(50)
as
if(not exists(select * from Sub_Category where @category_name=category_type and @subcategory_name=name))
 INSERT INTO Sub_Category(category_type,name) 
 VALUES(@category_name,@subcategory_name)
GO

--exec Staff_Create_Subcategory @category_name='Tourism' ,@subcategory_name='Resort'
--GO

 CREATE PROC Staff_Create_Type
 @type_name varchar(50)
 as
 if(not exists(select * from Content_type where @type_name=type))
 INSERT INTO Content_type(type)
 VALUES(@type_name)
GO

--exec Staff_Create_Type @type_name='GIF'
--GO

CREATE PROC Most_Requested_Content
as
SELECT original_content_id,count(Existing_Request.id) as number_of_existing_request
FROM Existing_Request
INNER JOIN Original_Content ON Existing_Request.original_content_id=Original_Content.ID
group by original_content_id 
ORDER BY count(Existing_Request.id) DESC;
GO


--exec Most_Requested_Content
--GO


CREATE PROCEDURE Workingplace_Category_Relation
	AS

	SELECT table1.working_place_type, table1.category_type, SUM(table1.number_of_requests)
	FROM(
		SELECT V.working_place_type, C.category_type,COUNT(*) AS number_of_requests 
		FROM Viewer V INNER JOIN New_Request NR
		ON V.ID = NR.viewer_id
		INNER JOIN New_Content NC
		ON NR.ID = NC.new_request_id
		INNER JOIN Content C
		ON C.ID = NC.ID
		GROUP BY V.working_place_type,C.category_type

		UNION
		
		SELECT V.working_place_type, C.category_type,COUNT(*) AS number_of_requests
		FROM Viewer V INNER JOIN Existing_Request ER
		ON V.ID = ER.viewer_id
		INNER JOIN Original_Content OC
		ON OC.ID = ER.original_content_id
		INNER JOIN Content C
		ON C.ID = OC.ID
		GROUP BY V.working_place_type,C.category_type
	) AS table1
	GROUP BY table1.working_place_type, table1.category_type

GO

 CREATE PROC Delete_Comment
 @viewer_id int,
 @original_content_id varchar(50),
 @comment_time datetime
 as
 DELETE FROM Comment
 WHERE Viewer_id=@viewer_id AND original_content_id=@original_content_id AND date=@comment_time
GO




 CREATE PROC Delete_Original_Content
 @content_id int
 as
 DELETE FROM Content
 WHERE id=@content_id
GO

--drop proc Delete_Original_Content
--exec Delete_Original_Content @content_id=1
--GO

 CREATE PROC Delete_New_Content
 @content_id int
 as
 delete from Content WHERE ID=@content_id
GO

--drop proc Delete_New_Content
--exec Delete_New_Content @content_id=5
--GO

CREATE PROC Assign_Contributor_Request
@contributer_id int,
@new_request_id int
as
UPDATE New_Request set contributer_id=@contributer_id where @new_request_id=id 
GO

--exec Assign_Contributor_Request @contributer_id=5, @new_request_id=1
--GO


CREATE PROCEDURE Show_Possible_Contributors
	AS
	SELECT CR.ID AS 'c_id',AVG(DATEDIFF(day,A.seen_at,C.uploaded_at)) AS 'number_of_days', COUNT(*) AS 'number_of_requests'
		INTO tempTable
	FROM Announcement A INNER JOIN Contributor CR
	ON CR.notified_id = A.notified_person_id
	INNER JOIN New_Request NR
	ON A.notification_object_id = NR.notif_obj_id
	INNER JOIN New_Content NC
	ON NR.id = NC.new_request_id
	INNER JOIN Content C
	ON C.ID = NC.ID
	GROUP BY CR.ID
	ORDER BY number_of_days ASC

	SELECT *
	INTO tempTable2
	FROM tempTable
	UNION
	SELECT Contributor.ID AS 'c_id', NULL AS 'number_of_days',NULL AS 'number_of_requests'
	FROM Content INNER JOIN New_Content 
	ON Content.ID = New_Content.ID
	RIGHT JOIN Contributor
	ON Content.contributer_id = Contributor.ID
	WHERE Content.ID IS NULL

	DECLARE @max_cont INT
	DECLARE @c INT
	DECLARE @ableTo BIT

	SELECT @max_cont = MAX(ID)
	FROM Contributor

	SET @c = 1
	WHILE(@c <= @max_cont)
		BEGIN
		IF(EXISTS(SELECT * FROM tempTable2 WHERE tempTable2.c_id = @c))
			BEGIN
			EXECUTE Receive_New_Request @c, @ableTo OUTPUT
			IF(@ableTo = 0)
				DELETE FROM tempTable2 WHERE tempTable2.c_id = @c
			END
		SET @c = @c+1
		END

	SELECT tempTable2.c_id,tempTable2.number_of_requests
	FROM tempTable2
	ORDER BY CASE WHEN tempTable2.number_of_days IS NULL THEN 1 ELSE 0 END ,tempTable2.number_of_days ASC,tempTable2.number_of_requests DESC

	DROP TABLE tempTable2
	DROP TABLE tempTable
GO

--exec Show_Possible_Contributors




create proc Showtype 
@user_id int,
@type int output
as
if(exists(select * from Viewer where @user_id=ID))
	set @type=1
else if(exists(select * from Contributor where @user_id=ID))
	set @type=2
else if(exists(select * from Reviewer where @user_id=ID))
	set @type=3
else if(exists(select * from Content_manager where @user_id=ID))
	set @type=4

GO