package hts.manager.dao;

import hts.model.vo.manager.Strorage;

public interface ManagerStorageDAO {

	int storageUpdate(Strorage sto); //재고리스트 한번에 업데이트
	int tncUpdate(Strorage sto); //재고리스트 숯 업데이트
	int bathUpdate(Strorage sto); //재고리스트 목욕세트 업데이트
	int stoMerge(Strorage strorage); 

}
