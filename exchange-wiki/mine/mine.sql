

CREATE TABLE `asset_snapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `balance` decimal(40,20) NOT NULL COMMENT '账户总资产',
  `snap_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快照时间',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '快照日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025307543968272395 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产快照';



CREATE TABLE `asset_snapshot_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `coin_id` bigint(20) NOT NULL COMMENT '币种id',
  `balance_amount` decimal(40,20) NOT NULL COMMENT '可用余额',
  `freeze_amount` decimal(40,20) NOT NULL COMMENT '冻结余额',
  `balance` decimal(40,20) NOT NULL COMMENT '对应usdt的价格',
  `price` decimal(40,20) DEFAULT NULL COMMENT '现价',
  `snap_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快照时间',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '快照日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025307541351026700 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产快照详情';




CREATE TABLE `dividend_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `reward_amount` decimal(40,20) NOT NULL COMMENT '这周累计总分红',
  `unlock_amount` decimal(40,20) NOT NULL COMMENT '这周已解冻分红',
  `lock_amount` decimal(40,20) NOT NULL COMMENT '未解冻分红',
  `unlock_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '解冻日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025311435023970306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='邀请奖励分红账户';





CREATE TABLE `dividend_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主建',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `refe_user_id` bigint(20) NOT NULL COMMENT '关联用户id',
  `scale_amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '比例',
  `invite_amount` decimal(20,8) NOT NULL COMMENT '邀请奖励冻结额度',
  `reward_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分红日期',
  `enable` int(4) DEFAULT NULL COMMENT '1可用,0不可用(无效冻结金额)',
  `mark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注,默认为空',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '''创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023223403835781124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `forex_account` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户ID',
  `market_id` bigint(18) DEFAULT NULL COMMENT '交易对ID',
  `market_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易对',
  `type` tinyint(4) DEFAULT NULL COMMENT '持仓方向：1-买；2-卖',
  `amount` decimal(20,8) DEFAULT '0.00000000' COMMENT '持仓量',
  `lock_amount` decimal(20,8) DEFAULT '0.00000000' COMMENT '冻结持仓量',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1-有效；2-锁定；',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `unique_index` (`user_id`,`market_id`,`type`) USING BTREE,
  KEY `idx_created` (`created`) USING BTREE,
  KEY `idx_updated` (`last_update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='创新交易持仓信息';





CREATE TABLE `forex_account_detail` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` bigint(18) DEFAULT NULL COMMENT '持仓账户ID',
  `type` tinyint(4) DEFAULT NULL COMMENT '收支类型：开仓；2-平仓；',
  `amount` decimal(20,8) DEFAULT NULL COMMENT '持仓量',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='持仓账户流水';




CREATE TABLE `forex_close_position_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户ID',
  `market_id` bigint(18) DEFAULT NULL COMMENT '交易对ID',
  `market_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易对名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '持仓方向：1-买；2-卖',
  `account_id` bigint(18) DEFAULT NULL COMMENT '资金账户ID',
  `entrust_order_id` bigint(18) DEFAULT NULL COMMENT '委托订单号',
  `order_id` bigint(18) DEFAULT NULL COMMENT '成交订单号',
  `price` decimal(20,8) DEFAULT NULL COMMENT '成交价',
  `num` decimal(20,8) DEFAULT NULL COMMENT '成交数量',
  `open_id` bigint(18) DEFAULT NULL COMMENT '关联开仓订单号',
  `profit` decimal(20,8) DEFAULT NULL COMMENT '平仓盈亏',
  `unlock_margin` decimal(20,8) DEFAULT NULL COMMENT '返回还保证金',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_update_time` (`last_update_time`) USING BTREE,
  KEY `idx_market_id` (`market_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='平仓详情';




CREATE TABLE `forex_coin` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种名称',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种标题',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态: 0禁用 1启用',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='创新交易币种表';




CREATE TABLE `forex_open_position_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户ID',
  `market_id` bigint(18) DEFAULT NULL COMMENT '交易对ID',
  `market_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易对名称',
  `coin_id` bigint(18) DEFAULT NULL COMMENT '结算币种',
  `type` tinyint(4) DEFAULT NULL COMMENT '持仓方向：1-买；2-卖',
  `account_id` bigint(18) DEFAULT NULL COMMENT '资金账户ID',
  `entrust_order_id` bigint(18) DEFAULT NULL COMMENT '委托订单',
  `order_id` bigint(18) DEFAULT NULL COMMENT '成交订单号',
  `price` decimal(20,8) DEFAULT NULL COMMENT '成交价格',
  `num` decimal(20,8) DEFAULT '0.00000000' COMMENT '成交数量',
  `lock_margin` decimal(20,8) DEFAULT '0.00000000' COMMENT '扣除保证金',
  `close_num` decimal(20,8) DEFAULT '0.00000000' COMMENT '平仓量',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1：未平仓；2-已平仓',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_update_time` (`last_update_time`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_market_id` (`market_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='开仓订单信息';



CREATE TABLE `mine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `total_mining` decimal(40,20) NOT NULL COMMENT '用户挖矿总的额度(真实总的挖矿数据)',
  `time_mining` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '挖矿时间',
  `real_mining` decimal(40,20) NOT NULL COMMENT '实际奖励额度',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023223389021499402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产快照';




CREATE TABLE `mining_detail` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` bigint(19) NOT NULL COMMENT '用户ID',
  `area_name` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '市场名称',
  `total_fee` decimal(40,20) NOT NULL COMMENT '挖矿手续费总额度',
  `time_mining` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '挖矿时间',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`area_name`,`time_mining`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=197423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='挖矿每日汇总信息';





CREATE TABLE `plant_coin_dividend_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `coin_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '币种名称',
  `reward_amount` decimal(20,8) NOT NULL COMMENT '累计币种分红',
  `unlock_amount` decimal(20,8) NOT NULL COMMENT '累计已解冻分红',
  `unlock_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '解冻日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='持有平台币分红解冻';




CREATE TABLE `plant_coin_dividend_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主建',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `coin_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '币种名称',
  `coin_id` bigint(20) NOT NULL COMMENT '币种id',
  `amount` decimal(20,8) NOT NULL COMMENT '平台币分红额度',
  `reward_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分红日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '''创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023223431081979922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='持有平台币分红记录';





CREATE TABLE `pool_dividend_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `reward_amount` decimal(20,8) NOT NULL COMMENT '累计分红',
  `unlock_amount` decimal(20,8) NOT NULL COMMENT '已解冻',
  `lock_amount` decimal(20,8) NOT NULL COMMENT '未解冻',
  `unlock_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '解冻日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025343537568247812 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='矿池解冻额度';





CREATE TABLE `pool_dividend_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主建',
  `user_id` bigint(20) NOT NULL COMMENT '矿主userid',
  `amount` decimal(40,8) NOT NULL COMMENT '矿主前一天奖励额度',
  `reward_date` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '挖矿日期',
  `created` datetime DEFAULT NULL COMMENT '''创建日期',
  `mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '当不分配资金的时候,写一个备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023227443760021509 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `application` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



delete from ex_trade.asset_snapshot;
delete from ex_trade.asset_snapshot_detail;
delete from ex_trade.dividend_account;
delete from   ex_trade.dividend_record;
delete from  ex_trade.forex_account;
delete from   ex_trade.forex_account_detail;
delete from   ex_trade.forex_close_position_order;
delete from   ex_trade.forex_coin;
delete from   ex_trade.forex_open_position_order;
delete from   ex_trade.mine;
delete from   ex_trade.plant_coin_dividend_account;
delete from   ex_trade.plant_coin_dividend_record;
delete from   ex_trade.pool_dividend_account;
delete from   ex_trade.pool_dividend_record;
delete from   ex_trade.pool_dividend_account;