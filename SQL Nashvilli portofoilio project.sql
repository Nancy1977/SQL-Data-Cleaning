select *
from [Nashvillie Housing]

select SaleDate
from [Nashvillie Housing]

select saledateconverted,convert(date,saledate)
from [Nashvillie Housing]

update [Nashvillie Housing]
set saledate=convert(date,saledate)


Alter table [Nashvillie Housing]
Add Saledateconverted Date;



update [Nashvillie Housing]
set saledateconverted =convert(date,saledate)



select*
from [Nashvillie Housing]
--WHERE  PropertyAddress IS NULL
ORDER BY ParceliD



select a.ParcelID ,a.PropertyAddress,b.ParcelID,b.PropertyAddress, isnull(a.PropertyAddress,b.PropertyAddress)
from [Nashvillie Housing] a
join [Nashvillie Housing] b
on a.ParcelID = b.ParcelID
and a.[UniqueID ]<> B.[UniqueID ]
WHERE  a.PropertyAddress IS NULL

update a
set PropertyAddress = isnull(a.PropertyAddress,b.PropertyAddress)
from [Nashvillie Housing] a
join [Nashvillie Housing] b
on a.ParcelID = b.ParcelID
and a.[UniqueID ]<> B.[UniqueID ]
WHERE  a.PropertyAddress IS NULL

SELECT 
SUBSTRING (PropertyAddress , 1 ,CHARINDEX(',', PropertyAddress )-1)AS Address,
SUBSTRING (PropertyAddress ,CHARINDEX(',', PropertyAddress )+1, LEN(PropertyAddress) )AS city
FROM [Nashvillie Housing]


Alter table [Nashvillie Housing]
Add PropertysplitAddress3 varchar(255); 

update [Nashvillie Housing] 
set PropertysplitAddress3 = SUBSTRING (PropertyAddress , 1 ,CHARINDEX(',', PropertyAddress)-1) 


Alter table [Nashvillie Housing]
Add Propertysplitcity NVARCHAR(255);

update [Nashvillie Housing] 
set Propertysplitcity = SUBSTRING (PropertyAddress ,CHARINDEX(',', PropertyAddress )+1, LEN(PropertyAddress))






SELECT *
FROM  [Nashvillie Housing]
where propertyAddress is not null


select
PARSENAME(REPLACE(OwnerAddress, ',','.'),3),
PARSENAME(REPLACE(OwnerAddress, ',','.'),2),
PARSENAME(REPLACE(OwnerAddress, ',','.'),1)
FROM [Nashvillie Housing]
WHERE OwnerAddress IS NOT NULL





Alter table  [Nashvillie Housing]
add ownersplitAddress nvarchar(255);

update [Nashvillie Housing] 
set ownersplitAddress =PARSENAME(REPLACE(OwnerAddress, ',','.'),3)

Alter table [Nashvillie Housing]
Add ownersplitcity nvarchar(255); 

update [Nashvillie Housing] 
set ownersplitcity=PARSENAME(REPLACE(ownerAddress, ',','.'),2) 

Alter table [Nashvillie Housing]
Add ownersplitstate nvarchar(255); 

update [Nashvillie Housing] 
set ownersplitstate =PARSENAME(REPLACE(ownerAddress, ',','.'),1) 

select *
from  [Nashvillie Housing] 
where owneraddress is not null

select distinct(SoldAsVacant),count(SoldAsVacant)
from  [Nashvillie Housing]
group by soldAsVacant
order by 2

select SoldAsVacant ,  
     CASE when SoldAsVacant ='y' then 'yes'
	  when SoldAsVacant ='n' then 'no'
	  else SoldAsVacant
	  end
	  from  [Nashvillie Housing] 

	  update  [Nashvillie Housing]
	  set SoldAsVacant =    CASE when SoldAsVacant ='y' then 'yes'
	  when SoldAsVacant ='n' then 'no'
	  else SoldAsVacant
	  end

Alter table [Nashvillie Housing]
drop column propertysplitAddress2  ;




Alter table [Nashvillie Housing]
drop column PropertyAddress ,SaleDate,OwnerAddress ;






SELECT *
FROM  [Nashvillie Housing]


SELECT *
FROM  [Nashvillie Housing]
