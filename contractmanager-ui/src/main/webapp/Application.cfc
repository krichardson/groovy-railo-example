<cfcomponent>

   <cfset this.name = "ContractManager" />

   <cffunction name="onApplicationStart" access="public" output="false" returntype="any">

		<cfset var springFactory = createObject("java", "org.springframework.context.support.ClassPathXmlApplicationContext").init("config/applicationContext.xml") />
		<cfset var springFactoryAdapter = createObject("component", "coldspring.beans.util.JavaSpringBeanFactoryAdapter").init(springFactory) />

		<cfset application.beanFactory = createObject("component","coldspring.beans.DefaultXmlBeanFactory").init()/>
		<cfset application.beanFactory.loadBeansFromXmlFile(ExpandPath("/config/coldspring.xml.cfm"),true)/>
		<cfset application.beanFactory.setParent(springFactoryAdapter) />

   		<cfreturn true />
   </cffunction>

</cfcomponent>
