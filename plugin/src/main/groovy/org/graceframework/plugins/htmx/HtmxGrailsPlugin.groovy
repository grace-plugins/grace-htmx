/*
 * Copyright 2022-2024 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.graceframework.plugins.htmx

import grails.plugins.Plugin
import grails.util.GrailsUtil

/**
 * Htmx Grails Plugin
 *
 * @author Michael Yan
 * @since 0.0.1
 */
class HtmxGrailsPlugin extends Plugin {

    def version = '0.6.0-SNAPSHOT'
    def grailsVersion = GrailsUtil.getGrailsVersion()
    def dependsOn = [controllers: grailsVersion]
    def observe = ['controllers']

    def title = "Grace Htmx Plugin"
    def author = "Michael Yan"
    def authorEmail = "rain@rainboyan.com"
    def description = '''\
Grace Plugin for using Grace app with htmx.
'''
    def profiles = ['web']

    // URL to the plugin's documentation
    def documentation = "https://github.com/grace-plugins/grace-htmx"

    // Extra (optional) plugin metadata

    // License: one of 'APACHE', 'GPL2', 'GPL3'
    def license = "APACHE"

    // Any additional developers beyond the author specified above.
    def developers = [ [id: "rainboyan", name: "Michael Yan", email: "rain@rainboyan.com" ]]

    // Location of the plugin's issue tracker.
    def issueManagement = [ system: "GitHub", url: "https://github.com/grace-plugins/grace-htmx/issues" ]

    // Online location of the plugin's browseable source code.
    def scm = [ url: "https://github.com/grace-plugins/grace-htmx" ]

}
