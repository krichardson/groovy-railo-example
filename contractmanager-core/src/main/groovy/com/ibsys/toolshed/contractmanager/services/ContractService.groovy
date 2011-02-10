package com.ibsys.toolshed.contractmanager.services

import com.ibsys.toolshed.contractmanager.domain.*

class ContractService {

  //Dependency
  def contractDao

  Contract findContractByIoNumber(Integer ioNumber) {
	return contractDao.findByIoNumber(ioNumber);
  }

  Contract findContractById(Integer contractId) {
	return contractDao.findById(contractId);
  }

  void saveContract(Contract contract) {
	contractDao.save(contract);
  }

  Contract newContract() {
	return new Contract();
  }

  Contract[] getAllContracts() {
	return contractDao.getAllContracts();
  }



}
