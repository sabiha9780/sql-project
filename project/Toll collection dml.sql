--Some Query  Example from TollCollection System:


select*
from TollPlaza;

GO

select*
from Users;

GO
select*
from Vehicle;

GO

select*
from TollTransaction;

GO

select*
from VehicleType

GO

select*
from PaymentMethod
---where--
select*
from TollPlaza
where [ Location]='dhaka';

GO
--order by--
select  VehicleID,UserName
from Vehicle
order by UserName desc 

GO

--join--
select b.VehicleID,VehicleColor,VehicleType
from Vehicle as a join 
TollTransaction as b 
on a.VehicleID=b.VehicleID;
GO
---  in--
select*
from Vehicle
where VehicleColor in ('red');
GO
---between-- 
select*
from  TollTransaction
where DATE_TIME between '2024-05-02'and '2024-05-06';
GO
--like--

select*
from Vehicle
where Gender like 'male'
GO
---like--
select*
from vehicle 
where VehicleType like 'car%';
---like--
select*
from vehicle 
where VehicleType like 'N[A-]' ;
 GO
--like --
select*
from vehicle 
where VehicleType like '[b,c,m,t]%' ;
GO
--offset fetch--
select*
from vehicle
order by VehicleID
offset 5 rows
FETCH next 5 rows only;
GO
--rollup--
select  Vehicletype
from Vehicle 
group by VehicleType with rollup;
GO
--cube--
select vehicleID,count (*)as vehicletype,sum(amount)
from Vehicle 
group by vehicleID with cube;
GO
--sub(any)--
select Vehicleid,VehicleType
from Vehicle
where VehicleID <any
(select UserID from Users where UserID=121);
GO
--sub(all)--
select VehicleID,VehicleColor
from Vehicle 
where VehicleID >all
(select UserID  from Users where UserID =121);

Go
---rank,row_number,dense_rank,Ntile--
select vehicleid,
	rank()over(order by amount)as col1,
	row_number()over(order by amount)as col2,
	dense_rank()over(order by amount)as col3,
	Ntile(2)over(order by amount)as col4,*
	
	from Vehicle
	GO
	--isnull--
	select vehicleid,
	isnull(amount,0)as totalamount
	from  vehicle
	GO
		--view
create view vw 
as
select VehicleColor,VehicleType 
from Vehicle as a 
join TollTransaction as b 
on a.VehicleID=b.VehicleID
GO

--calling --
select*from  vw 
GO

--function--
create function getfn
(
@date date= null,
@days int = 1

)
returns int
as
begin

if(@date is null)
set @date = getdate()

return 
(
select count(*) as salesQty
from TollTransaction
where DATE_TIME between dateadd(dd, -(@days-1), @date) and @date
)
end
GO

select dbo.getfn('2024/05/06',7)as TransactionDate


GO
---trigger
create trigger TRi
on
vehicle
instead of insert
as
begin
select *
from
inserted
if exists (select count(*)
vehicle having  count(*)> 1)

raiserror ('Invalid', 2, 16)

else
insert into vehicle
(VehicleID,VehicleType,VehicleColor)
           
select VehicleID,VehicleType,VehicleColor from inserted
end


      end


	          end