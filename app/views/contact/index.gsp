<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="col-12" role="navigation">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(uri: '/')}">
                                <i class="bi bi-house-fill"></i><g:message code="default.home.label"/>
                            </a>
                        </li>
                        <li class="nav-item">
                            <g:link class="nav-link" action="create">
                                <i class="bi bi-journal-plus"></i><g:message code="default.new.label" args="[entityName]" />
                            </g:link>
                        </li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-contact" class="col-12 scaffold scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="alert alert-success" role="status"><i class="bi bi-info-circle"></i>${flash.message}</div>
                    </g:if>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <g:each in="${['id', 'firstName', 'lastName']}" var="p" status="i">
                                    <g:sortableColumn property="${p}" titleKey="contact.${p}.label" />
                                </g:each>
                                <th width="15%" class="text-center">Operations</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${contactList}" var="bean" status="i">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>
                                        <g:link class="btn btn-link" method="GET" controller="contact" action="show" id="${bean.id}">
                                            <f:display bean="${bean}" property="id" />
                                        </g:link>
                                    </td>
                                    <td><f:display bean="${bean}" property="firstName" /></td>
                                    <td><f:display bean="${bean}" property="lastName" /></td>
                                    <td class="text-center">
                                        <g:link method="GET" controller="contact" action="show" id="${bean.id}"
                                            hx-get="${createLink(controller: 'contact', action: 'show', id: bean.id)}"
                                            hx-target="#modals-contact"
                                            hx-trigger="click"
                                            data-bs-toggle="modal"
                                            data-bs-target="#modals-contact">
                                            Show
                                        </g:link>&nbsp;&nbsp;&nbsp;&nbsp;| 
                                        <g:link class="btn btn-link"
                                            method="delete" controller="contact" action="delete" id="${bean.id}"
                                            hx-delete="${createLink(controller: 'contact', action: 'delete', id: bean.id)}"
                                            hx-target="closest tr" hx-swap="outerHTML swap:1s"
                                            hx-confirm="${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}">
                                            Delete
                                        </g:link>
                                    </td>
                                </tr>
                            </g:each>
                            <tr id="replaceMe" class="text-center">
                                <td colspan="4">
                                    <g:link class="btn btn-primary"
                                            method="GET" controller="contact" action="list" params="[page: nextPage]"
                                            hx-get="${createLink(controller: 'contact', action: 'list', params: [page: nextPage])}"
                                            hx-target="#replaceMe"
                                            hx-swap="outerHTML">
                                            Load More Contacts...
                                    </g:link>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>
<div id="modals-contact"
    class="modal modal-blur fade"
    style="display: none"
    aria-hidden="false"
    tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content"></div>
    </div>
</div>
    </body>
</html>