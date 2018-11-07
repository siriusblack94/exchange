package com.blockeng.gathering.config;

import com.alibaba.druid.pool.DruidDataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages = EXDBDataSourceConfig.PACKAGE,sqlSessionFactoryRef  = "exdbSqlSessionFactory")
public class EXDBDataSourceConfig {

    //精确到 master 目录，以便跟其他数据源隔离
    static final String PACKAGE = "com.blockeng.gathering.mapper.exdb";
    static final String MAPPER_LOCATION = "classpath:mappers/exdb/*.xml";
    @Value("${exdb.datasource.url}")
    private String url;
    @Value("${exdb.datasource.username}")
    private String username;
    @Value("${exdb.datasource.password}")
    private String password;
    @Value("${exdb.datasource.driverClassName}")
    private String driverClassName;

    @Bean(name = "exdbDataSource")
    @Primary
    public DataSource exdbDataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean(name = "exdbTransactionManager")
    @Primary
    public DataSourceTransactionManager exdbTransactionManager() {
        return new DataSourceTransactionManager(exdbDataSource());
    }

    @Bean(name = "exdbSqlSessionFactory")
    @Primary
    public SqlSessionFactory my18SqlSessionFactory(@Qualifier("exdbDataSource") DataSource exdbDataSource)
            throws Exception {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(exdbDataSource);
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver()
                .getResources(EXDBDataSourceConfig.MAPPER_LOCATION));
        return sessionFactory.getObject();
    }
}
