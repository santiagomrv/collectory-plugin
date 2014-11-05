<%@ page import="au.org.ala.collectory.DataResource; au.org.ala.collectory.DataProvider; au.org.ala.collectory.Collection; au.org.ala.collectory.Institution; au.org.ala.collectory.ProviderGroup; au.org.ala.collectory.DataLink" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="${grailsApplication.config.ala.skin}" />
        <g:set var="entityName" value="${message(code: 'dataLink.label', default: 'DataLink')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><cl:homeLink/></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create" params="${[returnTo: returnTo]}"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <g:if test="${returnTo}"><span class="menuButton"><cl:returnLink uid="${returnTo}"/></span></g:if>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dataLinkInstance}">
            <div class="errors">
                <g:renderErrors bean="${dataLinkInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${dataLinkInstance?.id}" />
                <g:hiddenField name="version" value="${dataLinkInstance?.version}" />
                <g:hiddenField name="returnTo" value="${returnTo}"/>
                <g:set var="provider" value="${ProviderGroup._get(dataLinkInstance.provider)}"/>
                <g:set var="consumer" value="${ProviderGroup._get(dataLinkInstance.consumer)}"/>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="consumer"><g:message code="dataLink.consumer.label" default="Consumer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataLinkInstance, field: 'consumer', 'errors')}">
                                  <g:select from="${Collection.list([sort:'name']) + Institution.list([sort:'name'])}" optionKey="uid" name="consumer" value="${consumer.uid}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="provider"><g:message code="dataLink.provider.label" default="Provider" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dataLinkInstance, field: 'provider', 'errors')}">
                                  <g:select from="${DataResource.list([sort:'name']) + DataProvider.list([sort:'name'])}" optionKey="uid" name="provider" value="${provider.uid}"/>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
