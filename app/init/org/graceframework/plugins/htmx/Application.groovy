package org.graceframework.plugins.htmx

import grails.boot.Grails
import grails.plugins.metadata.PluginSource

@PluginSource
class Application {

    static void main(String[] args) {
        Grails.run(Application, args)
    }

}
