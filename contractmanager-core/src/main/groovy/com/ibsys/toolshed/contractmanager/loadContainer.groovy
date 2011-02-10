package com.ibsys.toolshed.contractmanager

import org.springframework.context.ApplicationContext
import org.springframework.context.support.ClassPathXmlApplicationContext

import com.ibsys.toolshed.contractmanager.domain.*
import com.ibsys.toolshed.contractmanager.services.*
import java.text.SimpleDateFormat

ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");

ContractService contractService = context.getBean("contractService");
def df = new SimpleDateFormat("M/d/yyyy");

contractService.saveContract(new Contract(ioNumber: 123456, contractName: "My Test Contract 1", advertiserName: "My Test Advertiser 1", startDate: df.parse("3/1/2011"), endDate: df.parse("3/2/2011") ));
contractService.saveContract(new Contract(ioNumber: 123457, contractName: "My Test Contract 2", advertiserName: "My Test Advertiser 2", startDate: df.parse("3/2/2011"), endDate: df.parse("3/3/2011") ));
contractService.saveContract(new Contract(ioNumber: 123458, contractName: "My Test Contract 3", advertiserName: "My Test Advertiser 3", startDate: df.parse("3/3/2011"), endDate: df.parse("3/4/2011") ));

def contracts = contractService.getAllContracts();

contracts.each() {
  println it.contractName + " ends " + it.endDate;
  //Change each end date to 3/31/2011
  it.setEndDate(df.parse("3/31/2011"));
  contractService.saveContract(it);
  println it.contractName + " ends " + it.endDate;
}