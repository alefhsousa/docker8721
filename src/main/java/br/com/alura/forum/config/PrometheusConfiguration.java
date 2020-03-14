package br.com.alura.forum.config;

import io.micrometer.prometheus.PrometheusConfig;
import io.micrometer.prometheus.PrometheusMeterRegistry;
import io.micrometer.prometheus.PrometheusRenameFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

@Configuration
public class PrometheusConfiguration {

    @Bean
    @Scope("singleton")
    public PrometheusMeterRegistry prometheusMeterRegistry() {
        PrometheusMeterRegistry prometheusMeterRegistry = new PrometheusMeterRegistry(PrometheusConfig.DEFAULT);
        prometheusMeterRegistry.config().meterFilter(new PrometheusRenameFilter());
        prometheusMeterRegistry.config().commonTags("app-name", "forum-alura");
        return prometheusMeterRegistry;
    }

}