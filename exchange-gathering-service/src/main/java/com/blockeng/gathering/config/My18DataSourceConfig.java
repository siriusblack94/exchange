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
@MapperScan(basePackages = My18DataSourceConfig.PACKAGE,sqlSessionFactoryRef  = "my18SqlSessionFactory")
public class My18DataSourceConfig {

    //精确到 master 目录，以便跟其他数据源隔离
    static final String PACKAGE = "com.blockeng.gathering.mapper.my18";
    static final String MAPPER_LOCATION = "classpath:mappers/my18/*.xml";

    @Value("${my18.datasource.url}")
    private String url;
    @Value("${my18.datasource.username}")
    private String username;
    @Value("${my18.datasource.password}")
    private String password;
    @Value("${my18.datasource.driverClassName}")
    private String driverClassName;

    @Bean(name = "my18DataSource")
    @Primary
    public DataSource my18DataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean(name = "my18TransactionManager")
    @Primary
    public DataSourceTransactionManager my18TransactionManager() {
        return new DataSourceTransactionManager(my18DataSource());
    }

    @Bean(name = "my18SqlSessionFactory")
    @Primary
    public SqlSessionFactory my18SqlSessionFactory(@Qualifier("my18DataSource") DataSource my18DataSource)
            throws Exception {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(my18DataSource);
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver()
                .getResources(My18DataSourceConfig.MAPPER_LOCATION));
        return sessionFactory.getObject();
    }
}
