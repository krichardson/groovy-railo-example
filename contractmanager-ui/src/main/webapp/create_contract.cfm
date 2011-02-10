<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<title>Create a Contract</title>

</head>

    <cfset contractService = application.beanFactory.getBean("contractService") />
	<cfparam name="form.contractId" default="0" />
	<cfparam name="url.contractId" default="#form.contractId#" />

	<cfif url.contractId GT 0>

		<cfset contract = contractService.findContractById(url.contractId) />

	<cfelse>

		<cfset contract = contractService.newContract() />

	</cfif>

	<!--- Check for submission --->
	<cfif structKeyExists(form, "submit")>

		<cfset contract.setIoNumber(form.ioNumber) />
		<cfset contract.setContractName(form.contractName) />
		<cfset contract.setAdvertiserName(form.advertiserName) />
		<cfif isDate(form.startDate)>
			<cfset contract.setStartDate(form.startDate) />
		</cfif>
		<cfif isDate(form.endDate)>
			<cfset contract.setEndDate(form.endDate) />
		</cfif>

		<cfset contractService.saveContract(contract) />

		<cfoutput>
			<p class="message">Contract ###contract.contractId# saved!</p>
		</cfoutput>

	</cfif>

<body>

	<form name="createContract" action="create_contract.cfm" method="post">

		<cfset defaults = structCopy(form) />
		<cfparam name="defaults.ioNumber" default="#contract.ioNumber#" />
		<cfparam name="defaults.contractName" default="#contract.contractName#" />
		<cfparam name="defaults.advertiserName" default="#contract.advertiserName#" />
		<cfparam name="defaults.startDate" default="#isNull(contract.startDate)?'':contract.startDate#" />
		<cfparam name="defaults.endDate" default="#isNull(contract.endDate)?'':contract.endDate#" />

		<cfoutput>

			<div>
				<label for="ioNumber">IO Number</label>
				<input type="text" name="ioNumber" id="ioNumber" value="#defaults.ioNumber#" size="6" />
			</div>

			<div>
				<label for="contractName">Contract Name</label>
				<input type="text" name="contractName" id="contractName" value="#defaults.contractName#" size="30" />
			</div>

			<div>
				<label for="advertiserName">Advertiser Name</label>
				<input type="text" name="advertiserName" id="advertiserName" value="#defaults.advertiserName#" size="30" />
			</div>

			<div>
				<label for="startDate">Start Date</label>
				<input type="text" name="startDate" id="startDate" value="#DateFormat(defaults.startDate, 'm/d/yyyy')#" size="10" />
			</div>

			<div>
				<label for="endDate">End Date</label>
				<input type="text" name="endDate" id="endDate" value="#DateFormat(defaults.endDate, 'm/d/yyyy')#" size="10" />
			</div>

			<div>
				<input type="hidden" name="contractId" value="#val(contract.contractId)#" />
				<input type="submit" name="submit" value="Save Contract" />
			</div>

		</cfoutput>

	</form>

</body>

</html>