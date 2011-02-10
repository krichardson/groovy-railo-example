package com.ibsys.toolshed.contractmanager.domain

class Contract implements Serializable {

  Integer contractId = 0;
  Integer ioNumber = 0;
  String contractName = "";
  String advertiserName = "";
  Date startDate;
  Date endDate;

}
