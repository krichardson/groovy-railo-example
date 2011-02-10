<cfset contractService = application.beanFactory.getBean("contractService") />

<cfset contract = contractService.newContract() />
<cfset contract.setIoNumber(123456) />
<cfset contract.setContractName("My Test Contract") />
<cfset contract.setStartDate("3/1/2010") />
<cfset contract.setEndDate("4/30/2010") />

<cfset contractService.saveContract(contract) />

<cfoutput>
	<p>Contract saved with id #contract.contractId# and start date of #contract.getStartDate()#</p>
</cfoutput>

<cfset contract2 = contractService.findContractByIoNumber(123456) />

<cfoutput>
	<p>Contract with IO ## 123456 has name #contract2.getContractName()# and start date #contract2.getStartDate()#</p>
</cfoutput>

<cfdump var="#contract2#" />