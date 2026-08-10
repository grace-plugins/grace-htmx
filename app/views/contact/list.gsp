<g:each in="${contactList}" var="bean" status="i">
    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
        <td>
            <a href="/contact/show/${bean.id}" 
                hx-get="/contact/show/${bean.id}" 
                hx-target="#modals-contact"
                hx-trigger="click"
                data-bs-toggle="modal"
                data-bs-target="#modals-contact">
                <f:display bean="${bean}" property="id" />
            </a>
        </td>
        <td><f:display bean="${bean}" property="firstName" /></td>
        <td><f:display bean="${bean}" property="lastName" /></td>
        <td class="text-center">
            <g:link class="btn btn-link" method="GET" controller="contact" action="show" id="${bean.id}">Show</g:link>
                | 
            <a class="btn btn-link"
                hx-target="closest tr" hx-swap="outerHTML swap:1s"
                hx-confirm="${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}"
                hx-delete="/contact/delete/${bean.id}">
                Delete
            </a>
        </td>
    </tr>
</g:each>
<g:if test="${hasNext}">
<tr id="replaceMe" class="text-center">
    <td colspan="4">
        <button class='btn btn-primary'
                hx-get="/contact/list?page=${nextPage}"
                hx-target="#replaceMe"
                hx-swap="outerHTML">
                Load More Contacts...
        </button>
    </td>
</tr>
</g:if>
