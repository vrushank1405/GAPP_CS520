package gapp.model.dao;

import gapp.model.AdditionalInfoRecords;
import gapp.model.ApplicationStatusRecords;

import java.util.List;

public interface AdditionalInfoRecordsDao {

	List<AdditionalInfoRecords> getAdditionalInfoRecords(Integer applicationId);
	
	AdditionalInfoRecords saveAdditionalInfoRecords(AdditionalInfoRecords app);
	
	List<AdditionalInfoRecords> getAdditionalInfoRecordsByAjax(Integer applicationId);
}
