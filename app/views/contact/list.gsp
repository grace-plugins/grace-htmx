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
                method="delete" controller="contact" action="show" id="${bean.id}"
                hx-delete="${createLink(controller: 'contact', action: 'delete', id: bean.id)}"
                hx-target="closest tr" hx-swap="outerHTML swap:1s"
                hx-confirm="${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}">
                Delete
            </g:link>
        </td>
    </tr>
</g:each>
<g:if test="${hasNext}">
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
</g:if>
