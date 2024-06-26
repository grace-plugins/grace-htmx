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
package org.graceframework.plugins.htmx;

import javax.servlet.DispatcherType;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.boot.autoconfigure.web.servlet.ConditionalOnMissingFilterBean;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.filter.OrderedFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import grails.web.mime.MimeTypeProvider;

/**
 * {@link EnableAutoConfiguration Auto-configuration} for Htmx Plugin.
 *
 * @author Michael Yan
 * @since 0.0.1
 */
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
@Configuration(proxyBeanMethods = false)
public class HtmxAutoConfiguration {

    @Bean
    @ConditionalOnMissingFilterBean
    public FilterRegistrationBean<HtmxRequestFilter> htmxFilter() {
        HtmxRequestFilter filter = new HtmxRequestFilter();
        FilterRegistrationBean<HtmxRequestFilter> registration = new FilterRegistrationBean<>(filter);
        registration.setDispatcherTypes(DispatcherType.REQUEST, DispatcherType.ASYNC);
        registration.setOrder(OrderedFilter.REQUEST_WRAPPER_FILTER_MAX_ORDER + 100);
        return registration;
    }

    @Bean
    public MimeTypeProvider htmxMimeTypeProvider() {
        return new HtmxMimeTypeProvider();
    }

}
