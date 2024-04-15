package com.example.demo.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@Configuration
public class BoardConfig {

    /*  1. Team Project Connect */
/*    @Bean
    public DataSource dataSource() {
        HikariConfig hikariConfig = new HikariConfig();
//        hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");     // 1-1.log4jdbc
        hikariConfig.setDriverClassName("oracle.jdbc.driver.OracleDriver");             // 2-1.jdbc
//        hikariConfig.setJdbcUrl("jdbc:log4jdbc:oracle:thin:@1.220.247.78:1522:orcl"); // 1-2.log4jdbc
        hikariConfig.setJdbcUrl("jdbc:oracle:thin:@1.220.247.78:1522:orcl");            // 2-2.jdbc
        hikariConfig.setUsername("FINAL2404_PROJECT1");
        hikariConfig.setPassword("234561");

        hikariConfig.setPoolName("oracle-free1");
        hikariConfig.setMaximumPoolSize(5);

        HikariDataSource dataSource = new HikariDataSource(hikariConfig);

        return dataSource;
    }*/

    /* 2. Local Connect */
    @Bean
    public DataSource dataSource() {
        HikariConfig hikariConfig = new HikariConfig();
//        hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");     // 1-1.log4jdbc
        hikariConfig.setDriverClassName("oracle.jdbc.driver.OracleDriver");             // 2-1.jdbc
//        hikariConfig.setJdbcUrl("jdbc:log4jdbc:oracle:thin:@1.220.247.78:1522:orcl"); // 1-2.log4jdbc
        hikariConfig.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:orcl");               // 2-2.jdbc
        hikariConfig.setUsername("ora_user");
        hikariConfig.setPassword("1234");

        hikariConfig.setPoolName("oracle-free1");
        hikariConfig.setMaximumPoolSize(5);

        HikariDataSource dataSource = new HikariDataSource(hikariConfig);

        return dataSource;
    }

    @Bean
    public JdbcTemplate jdbcTemplate() {
        return new JdbcTemplate(dataSource());
    }
}
