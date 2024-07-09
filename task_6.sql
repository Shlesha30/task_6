create table agricultural_data(
	Crop_id int,
	Crop varchar(150),
	Crop_Year int,
	Season varchar(144),
	State_id varchar(100),
	Area int,
	Production int,
	Annual_Rainfall float,
	Fertilizer float,
	Pesticide varchar(255),
	Yield varchar(100)
)

select * from agricultural_data

copy agricultural_data from 'C:\Program Files\PostgreSQL\16\Backup\agricultural_data.csv' DELIMITER ',' CSV header;

------ Create 2 table

create table election_data(
	Election_id int,
	State_id varchar(100),
	Constituency varchar(200),
	Candidate_name varchar(255),
	Party varchar(100),
	EVM_Votes int,
	Postal_Votes int,
	Total_Votes int,
	Percentage_Votes float,
	Result varchar (80)
)

select * from election_data
	
copy election_data from 'C:\Program Files\PostgreSQL\16\Backup\election_data.csv' DELIMITER ',' CSV header;

---- Create 3 table

create table statewise_details(
	Date int,
	State_Id varchar,
	TotalSamples int,
	Negative int,
	Positive int
	
)
 select * from statewise_details

copy statewise_details from 'C:\Program Files\PostgreSQL\16\Backup\statewise_details.csv' DELIMITER ',' CSV header;


----- Inner join

select a.crop,sum(a.area),a.fertilizer, e.candidate_name,e.party,e.evm_votes from agricultural_data as a
inner join election_data as e
on a.state_id = e.state_id
group by a.crop,a.fertilizer,e.candidate_name,e.party,e.evm_votes 
having sum(a.area) <2000
limit 500
offset 50

	----left join
	
select a.crop,sum(a.area),a.fertilizer, e.candidate_name,e.party,e.evm_votes from agricultural_data as a
Left join election_data as e
on a.state_id = e.state_id
group by a.crop,a.fertilizer,e.candidate_name,e.party,e.evm_votes 
having sum(a.area) <2000
limit 500
offset 50


---- Right Join
select a.crop,sum(a.area),a.fertilizer, e.candidate_name,e.party,e.evm_votes from agricultural_data as a
Left join election_data as e
on a.state_id = e.state_id
group by a.crop,a.fertilizer,e.candidate_name,e.party,e.evm_votes 
having sum(a.area) <500
order by fertilizer DESC
limit 500
offset 500


-----full join
select a.crop,sum(a.area),a.fertilizer, e.candidate_name,e.party,e.evm_votes from agricultural_data as a
Left join election_data as e
on a.state_id = e.state_id
group by a.crop,a.fertilizer,e.candidate_name,e.party,e.evm_votes 
having sum(a.area) <500
order by fertilizer DESC
limit 500
offset 500

---union

select state_id,production from agricultural_data 
union
select state_id,evm_votes from election_data


