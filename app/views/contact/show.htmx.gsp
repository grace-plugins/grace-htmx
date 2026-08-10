<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">${message(code: 'contact.label', default: 'Contact')} #${contact.id}</h5>
        </div>
        <div class="modal-body">
            <g:if test="${flash.message}">
            <div class="alert alert-success" role="status"><i class="bi bi-info-circle"></i>${flash.message}</div>
            </g:if>
            <f:display bean="contact" />
        </div>
        <div class="modal-footer">
            <g:form resource="${this.contact}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="btn btn-primary" action="edit" resource="${this.contact}">
                        <i class="bi bi-journal-text"></i><g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                    <button class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                        <i class="bi bi-journal-x"></i><g:message code="default.button.delete.label" default="Delete" />
                    </button>
                </fieldset>
            </g:form>
        </div>
    </div>
</div>
