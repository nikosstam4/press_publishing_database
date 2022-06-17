
INSERT INTO newspaper(Name, frequency_publication, Owner)
VALUES ('The_times','daily','Spuropoulos Andreas'),
('The_news','daily','Papageorgiou Maria'),
('Your_voice','weekly','Stamopoulos Nikolaos');

INSERT INTO paper(Name, Paper_number, Release_date, Pages)
VALUES ('The_times',3566,'2019-10-9',34),
('The_news',786,'2019-9-9',30),
('Your_voice',107,'2019-12-11',43),
('The_news',787,'2019-9-10',32),
('Your_voice',108,'2019-12-18',56);

INSERT INTO category(Id, Name, Description, Parental) 
VALUES(15,'Foreign Policy','The background of politics','Politics'),
(14,'Internal Policy','The background of politics','Politics'),
(17,'Sports','All the sports',default),
(10,'Social','The Problem with Social Classes',default);

INSERT INTO article(Path, Title, Summary, Article_id, Page_name, Page_num, Cover, Extent)
VALUES ('C:\Users\Articles\Submitted\Article34a.doc','Exceeded loans','New changes for exceeded loans',14,'The_times',3566,5,6),
('C:\Users\Articles\Submitted\Article78a.doc','Olympic champions','Awards of the Greek athletes',17,'The_times',3566,23,5),
('C:\Users\Articles\Submitted\Article798a.doc','Big talk','Erdogan speech',15,'The_news',786,9,3),
('C:\Users\Articles\Submitted\Article245b.doc','Conserts of 2020','Information about the upcoming artists',10,'Your_voice',107,18,3);

INSERT INTO key(Article, Word_id)
VALUES('C:\Users\Articles\Submitted\Article34a.doc','loans'),
('C:\Users\Articles\Submitted\Article78a.doc','Olympic_games'),
('C:\Users\Articles\Submitted\Article798a.doc','Turkey'),
('C:\Users\Articles\Submitted\Article245b.doc','conserts');

INSERT INTO employee(email, Name, Last_name, Salary, Recruitment_date, News_name)
VALUES('giwrgos43@gmail.com','Georgios','Georgiou',1300,'2018-8-9','The_times'),
('kwnnaspurou@outlook.com','Constantina','Spirou',1600,'2019-1-6','The_times'),
('lemonis@hotmail.com','Jason','Lemonis',1600,'2019-10-25','The_news'),
('nikosp@hotmail.com','Nikolaos','Pelkas',1300,'2018-7-29','The_news'),
('gwgwspanou2@gmail.com','Georgia','Spanou',1300,'2018-4-19','Your_voice'),
('voulatoudim@gmail.com','Dimitra','Voulatou',2300,'2017-6-12','The_times'),
('kwstantinosv@outlook.com','Vasilis','Constantinou',2300,'2017-6-9','Your_voice');

INSERT INTO administrator(Email, duties , Street, City, Number)
VALUES('voulatoudim@gmail.com','Secretary','Korinthou','Patras',45),
('kwstantinosv@outlook.com','Logistics','Ermou','Patras',59);

INSERT INTO adm_phone_num(Administrative, Phone_num)
VALUES('kwstantinosv@outlook.com',6988996206),
('voulatoudim@gmail.com',9674858362),
('kwstantinosv@outlook.com',6972326658),
('voulatoudim@gmail.com',6987983367);

INSERT INTO journalist(Email, CV, Work_experience)
VALUES('giwrgos43@gmail.com','Objective, Strong character, Journalism in IEK AKMH',6),
('nikosp@hotmail.com','Impartial, Social, manchester metropolitan university diploma',12),
('gwgwspanou2@gmail.com','Powerful , Journalism and Law diplomas',18);

INSERT INTO submited_by(Email, Path, Date)
VALUES('giwrgos43@gmail.com','C:\Users\Articles\Submitted\Article34a.doc','2019-10-6'),
('nikosp@hotmail.com','C:\Users\Articles\Submitted\Article78a.doc','2019-9-4'),
('nikosp@hotmail.com','C:\Users\Articles\Submitted\Article245b.doc','2019-12-1'),
('gwgwspanou2@gmail.com','C:\Users\Articles\Submitted\Article798a.doc','2019-11-30');

INSERT INTO editor(Path, Email, Name, Paper_number, Page)
VALUES('C:\Users\Articles\Submitted\Article798a.doc','kwnnaspurou@outlook.com','The_news',786,2),
('C:\Users\Articles\Submitted\Article78a.doc','kwnnaspurou@outlook.com','The_times',3566,9),
('C:\Users\Articles\Submitted\Article34a.doc','kwnnaspurou@outlook.com','The_times',3566,10),
('C:\Users\Articles\Submitted\Article245b.doc','lemonis@hotmail.com','Your_voice',107,28);

INSERT INTO compose(Email, Path, Approval, Resubmit, Changes,Approval_date)
VALUES('kwnnaspurou@outlook.com','C:\Users\Articles\Submitted\Article798a.doc',1,0,NULL,2019-07-28),
('kwnnaspurou@outlook.com','C:\Users\Articles\Submitted\Article78a.doc',1,0,NULL,2019-10-8),
('kwnnaspurou@outlook.com','C:\Users\Articles\Submitted\Article34a.doc',1,0,NULL,2019-11-1),
('lemonis@hotmail.com','C:\Users\Articles\Submitted\Article245b.doc',0,1,'The foreword has to be changed',NULL);
