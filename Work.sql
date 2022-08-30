use iris_db;

select *
from species;

select *
from measurements
join species
using(species_id);

use telco_churn;

select *
from contract_types; -- contract_type, contract_type_id

select *
from payment_types; -- payment_type, payment_type_id

select *
from internet_service_types; -- internet_service_type, internet_service_type_id

use zillow;

select *
from airconditioningtype;

select *
from properties_2017;

-- airconditioningtype: 	  airconditioningtypeid,  airconditioningdesc
-- architecturalstyletype:    architecturalstyledesc, architecturalstyletypeid
-- buildingclasstype: 		  buildingclasstypeid,    buildingclassdesc
-- heatingsystemtype: 		  heatingorsystemtypeid,  heatingorsystemdesc
-- predictions_2016:          id, parcelid, logerror, transactiondate
-- predictions_2017:          id, parcelid, logerror, transactiondate
-- propertylandusetype:       propertylandusetypeid, propertylandusedesc
-- storytype:     			  storytypeid, storydesc                     
-- typetypeconstructiontype:  typeconstructiontypeid, typeconstructiondesc
-- unique_properties:         parcelid
-- properties_2016:           id, parcelid, airconditioningtypeid, architecturalstyletypeid


	   

-- properties_2017:           id, parcelid, airconditioningtypeid, architecturalstyletypeid, 
-- 							  basementsqft, bathroomcnt, bedroomcnt, buildingclasstypeid, 
-- 							  buildingqualitytypeid, calculatedbathnbr, decktypeid, 
--    						  finishedfloor1squarefeet, calculatedfinishedsquarefeet,
--    						  finishedsquarefeet12, finishedsquarefeet13, finishedsquarefeet15, 
--    						  finishedsquarefeet50, finishedsquarefeet6, fips, fireplacecnt,
--    						  fullbathcnt, garagecarcnt, garagetotalsqft, hashottuborspa,
-- 							  heatingorsystemtypeid, latitude, longitude, lotsizesquarefeet,
-- 							  poolcnt, poolsizesum, pooltypeid10, pooltypeid2, pooltypeid7,
-- 							  propertycountylandusecode, propertylandusetypeid, propertyzoningdesc,
-- 							  rawcensustractandblock, regionidcity, regionidcounty, regionidneighborhood, 
-- 							  regionidzip, roomcnt, storytypeid, threequarterbathnbr, typeconstructiontypeid, 
-- 							  unitcnt, yardbuildingsqft17, yardbuildingsqft26, yearbuilt, numberofstories, 
-- 							  fireplaceflag, structuretaxvaluedollarcnt, taxvaluedollarcnt, assessmentyear, 
-- 							  landtaxvaluedollarcnt, taxamount, taxdelinquencyflag, taxdelinquencyyear, 
-- 							  censustractandblock

