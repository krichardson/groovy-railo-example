package com.ibsys.toolshed.contractmanager.dao

import org.springframework.orm.hibernate3.support.HibernateDaoSupport

import com.ibsys.toolshed.contractmanager.domain.Contract;

class ContractDao extends HibernateDaoSupport {

	void save(Contract contract) {
		getHibernateTemplate().saveOrUpdate(contract);
	  	getHibernateTemplate().flush();
	}

  	void update(Contract contract) {
		getHibernateTemplate().saveOrUpdate(contract);
		getHibernateTemplate().flush();
	}

  	void delete(Contract contract) {
		getHibernateTemplate().delete(contract);
		getHibernateTemplate().flush();
	}

  	Contract findByIoNumber(Integer ioNumber) {
		def matches = getHibernateTemplate().find(
				"from Contract where ioNumber=?",ioNumber
		);
		return (Contract)matches.get(0);
	}

  	Contract findById(Integer contractId) {
		def matches = getHibernateTemplate().find(
				"from Contract where contractId=?",contractId
		);
		return (Contract)matches.get(0);
	}



  Contract[] getAllContracts() {
		return getHibernateTemplate().find(
			"from Contract"
		);
  }

}
