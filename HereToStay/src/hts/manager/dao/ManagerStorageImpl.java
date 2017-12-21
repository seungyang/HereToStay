package hts.manager.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hts.model.vo.manager.Strorage;

@Repository
public class ManagerStorageImpl implements ManagerStorageDAO {

	@Autowired
	private SqlSessionTemplate ss2;
	
	
	@Override
	public int storageUpdate(Strorage sto){//재고리스트 한번에 업데이트 하기
		return ss2.update("ManagerStorage.storageUpdate",sto);
	}


	@Override 
	public int tncUpdate(Strorage sto) {//숯 갯수 업데이트 하기
		// TODO Auto-generated method stub
		return ss2.update("ManagerStorage.tncUpdate",sto);
	}


	@Override
	public int bathUpdate(Strorage sto) {//목욕세트 갯수 업데이트 하기
		// TODO Auto-generated method stub
		return ss2.update("ManagerStorage.bathUpdate",sto);
	}


	@Override
	public int stoMerge(Strorage mStoList) {
		return ss2.update("ManagerStorage.stoMerge",mStoList);
	}

}
