﻿SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `admin_address`;
CREATE TABLE `admin_address` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `coin_id` bigint(18) DEFAULT NULL COMMENT '币种Id',
  `keystore` varchar(1024) DEFAULT NULL COMMENT 'eth keystore',
  `pwd` varchar(200) DEFAULT NULL COMMENT 'eth账号密码',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `status` int(4) DEFAULT NULL COMMENT '1:归账(冷钱包地址),2:打款,3:手续费',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1016724165803614211 DEFAULT CHARSET=utf8mb4 COMMENT='钱包归集提币地址管理';

DROP TABLE IF EXISTS  `coin_config`;
CREATE TABLE `coin_config` (
  `id` bigint(18) NOT NULL COMMENT '币种ID(对应coin表ID)',
  `name` varchar(100) NOT NULL COMMENT '币种名称',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '币种类型：btc-比特币系列；eth-以太坊；ethToken-以太坊代币；etc-以太经典；',
  `credit_limit` decimal(20,8) DEFAULT NULL COMMENT '钱包最低留存的币',
  `credit_max_limit` decimal(20,8) DEFAULT NULL COMMENT '当触发改状态的时候,开始归集',
  `auto_draw_limit` decimal(20,8) DEFAULT NULL COMMENT '自动提币的最高额度',
  `auto_draw` decimal(20,8) DEFAULT NULL COMMENT '是否自动提币',
  `rpc_ip` varchar(20) DEFAULT NULL COMMENT 'rpc服务ip',
  `rpc_port` varchar(10) DEFAULT NULL COMMENT 'rpc服务port',
  `rpc_user` varchar(30) DEFAULT NULL COMMENT 'rpc用户',
  `rpc_pwd` varchar(200) DEFAULT NULL COMMENT 'rpc密码',
  `last_block` varchar(100) DEFAULT '' COMMENT '最后一个区块',
  `wallet_user` varchar(64) DEFAULT NULL COMMENT '钱包用户名',
  `wallet_pass` varchar(50) DEFAULT NULL COMMENT '钱包密码',
  `contract_address` varchar(100) DEFAULT '' COMMENT '代币合约地址',
  `context` varchar(50) DEFAULT NULL COMMENT 'context',
  `min_confirm` int(4) DEFAULT '1' COMMENT '最低确认数',
  `task` varchar(50) DEFAULT NULL COMMENT '定时任务',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否可用0不可用,1可用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_status_wallet_type` (`coin_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='币种钱包配置';

insert into `coin_config`(`id`,`name`,`coin_type`,`credit_limit`,`credit_max_limit`,`auto_draw_limit`,`auto_draw`,`rpc_ip`,`rpc_port`,`rpc_user`,`rpc_pwd`,`last_block`,`wallet_user`,`wallet_pass`,`contract_address`,`context`,`min_confirm`,`task`,`status`) values
('1010101010101010102','BTC','btc',1.00000000,3.00000000,1.00000000,1.00000000,'47.75.133.170','8846','ylbtc','85970D4D2E7B6E40604F6BA73FEAA56721F8E0255148695FD05B62DD2B81CDE07D90975A89B93DD4','534992',null,'','',null,'1','0/59 * * * * ?','1'),
('1010101010101010103','ETH','eth',1.00000000,null,2.00000000,1.00000000,'47.75.68.72','8089','','','6080582',null,'','',null,'1','0/15 * * * * ?','1'),
('1016312602449911810','NBXX','ethToken',0E-8,null,null,0E-8,'47.75.68.72','8089',null,null,'5939923',null,null,'',null,'1','0/15 * * * * ?','1'),
('1023157074441768961','EMBC','ethToken',1.00000000,null,null,0E-8,'192.168.0.21','8545','','','6039673',null,'','0x5b0ea5b1735046b2e10ee8feb404d2d5f1e1ad4b',null,'1','0/5****?','1');
DROP TABLE IF EXISTS  `coin_server`;
CREATE TABLE `coin_server` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `rpc_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '钱包服务器ip',
  `rpc_port` varchar(50) NOT NULL DEFAULT '' COMMENT '钱包服务器ip',
  `running` int(1) NOT NULL COMMENT '服务是否运行 0:正常,1:停止',
  `wallet_number` bigint(255) NOT NULL COMMENT '钱包服务器区块高度',
  `coin_name` varchar(50) NOT NULL COMMENT '钱包名称',
  `mark` varchar(100) DEFAULT NULL COMMENT '备注信息',
  `real_number` bigint(255) DEFAULT NULL COMMENT '真实区块高度',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1015894258013474819 DEFAULT CHARSET=utf8mb4 COMMENT='钱包服务器监控信息';

insert into `coin_server`(`id`,`rpc_ip`,`rpc_port`,`running`,`wallet_number`,`coin_name`,`mark`,`real_number`,`last_update_time`,`created`) values
('1015672795853910018','47.75.133.170','8846','0','534993','BTC','服务器正常','0','2018-08-03 19:44:59','2018-07-08 03:03:59'),
('1015894258013474818','47.75.68.72','8089','0','6080582','ETH','服务器正常','6080582','2018-08-03 19:50:59','2018-07-08 17:44:00');
SET FOREIGN_KEY_CHECKS = 1;

