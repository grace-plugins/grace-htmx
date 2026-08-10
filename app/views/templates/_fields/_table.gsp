<table class="table table-bordered">
    <thead>
         <tr>
            <g:each in="${domainProperties}" var="p" status="i">
                <g:sortableColumn property="${p.property}" title="${p.label}" />
            </g:each>
            <th width="15%" class="text-center">Operations</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${collection}" var="bean" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <g:each in="${domainProperties}" var="p" status="j">
                    <td><f:display bean="${bean}" property="${p.property}" displayStyle="${displayStyle?:'table'}" theme="${theme}"/></td>
                </g:each>
                <td class="text-center"><g:form controller="contact" action="delete" id="${bean.id}" method="DELETE"><g:link class="btn btn-link" method="GET" controller="contact" action="show" id="${bean.id}">Show</g:link> | <button class="btn btn-link" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Delete</button></g:form></td>
            </tr>
        </g:each>
    </tbody>
</table>