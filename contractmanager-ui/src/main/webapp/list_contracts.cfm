<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<title>List of Contract</title>

</head>

<body>


    <cfset contractService = application.beanFactory.getBean("contractService") />

    <cfset contracts = contractService.getAllContracts() />

	<cfoutput>
	<table>
    <cfloop from="1" to="#arrayLen(contracts)#" index="i">
		<tr>
			<td><a href="create_contract.cfm?contractId=#contracts[i].getContractId()#">#contracts[i].getIoNumber()#</a></td>
			<td>#contracts[i].getContractName()#</td>
			<td>#contracts[i].getStartDate()#</td>
			<td>#contracts[i].getEndDate()#</td>
		</tr>
    </cfloop>
    </table>
    </cfoutput>


</body>

</html>