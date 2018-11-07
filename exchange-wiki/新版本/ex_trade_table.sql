SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `account`;
CREATE TABLE `account` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) NOT NULL COMMENT '用户id',
  `coin_id` bigint(18) NOT NULL COMMENT '币种id',
  `status` tinyint(1) NOT NULL COMMENT '账号状态：1，正常；2，冻结；',
  `balance_amount` decimal(40,20) NOT NULL COMMENT '币种可用金额',
  `freeze_amount` decimal(40,20) NOT NULL COMMENT '币种冻结金额',
  `recharge_amount` decimal(40,20) NOT NULL COMMENT '累计充值金额',
  `withdrawals_amount` decimal(40,20) NOT NULL COMMENT '累计提现金额',
  `net_value` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '净值',
  `lock_margin` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '占用保证金',
  `float_profit` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '持仓盈亏/浮动盈亏',
  `total_profit` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '总盈亏',
  `rec_addr` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '充值地址',
  `version` bigint(18) NOT NULL COMMENT '版本号',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `userid_coinid_unique` (`user_id`,`coin_id`) USING BTREE,
  KEY `account_coin_id_ref` (`coin_id`) USING BTREE,
  KEY `inx_platform_account` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025348741194596358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金账户';

DROP TABLE IF EXISTS  `account_detail`;
CREATE TABLE `account_detail` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '用户id',
  `coin_id` bigint(18) NOT NULL COMMENT '币种id',
  `account_id` bigint(18) NOT NULL COMMENT '账户id',
  `ref_account_id` bigint(18) NOT NULL COMMENT '关联方的账户ID',
  `order_id` bigint(18) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `direction` tinyint(1) NOT NULL COMMENT '资金方向：入账为-1；出账为-2',
  `business_type` varchar(100) NOT NULL COMMENT '业务类型',
  `amount` decimal(40,20) NOT NULL COMMENT '数量/金额',
  `fee` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '手续费',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payment_detail_accountid_fk` (`account_id`) USING BTREE,
  KEY `payment_detail_userid_fk` (`user_id`) USING BTREE,
  KEY `payment_detail_refaccountid_fk` (`ref_account_id`) USING BTREE,
  KEY `fk_accountdetail_coinid` (`coin_id`) USING BTREE,
  KEY `payment_detail_created_fk` (`created`),
  KEY `idx_business_type` (`business_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025326424494021924 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='资金账户流水';

DROP TABLE IF EXISTS  `asset_snapshot`;
CREATE TABLE `asset_snapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `balance` decimal(40,20) NOT NULL COMMENT '账户总资产',
  `snap_time` varchar(50) NOT NULL DEFAULT '' COMMENT '快照时间',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '快照日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023223377986285583 DEFAULT CHARSET=utf8mb4 COMMENT='资产快照';

DROP TABLE IF EXISTS  `asset_snapshot_detail`;
CREATE TABLE `asset_snapshot_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `coin_id` bigint(20) NOT NULL COMMENT '币种id',
  `balance_amount` decimal(40,20) NOT NULL COMMENT '可用余额',
  `freeze_amount` decimal(40,20) NOT NULL COMMENT '冻结余额',
  `balance` decimal(40,20) NOT NULL COMMENT '对应usdt的价格',
  `price` decimal(40,20) DEFAULT NULL COMMENT '现价',
  `snap_time` varchar(50) NOT NULL DEFAULT '' COMMENT '快照时间',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '快照日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023223362828070914 DEFAULT CHARSET=utf8mb4 COMMENT='资产快照详情';

DROP TABLE IF EXISTS  `cash_recharge`;
CREATE TABLE `cash_recharge` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) unsigned NOT NULL COMMENT '用户ID',
  `coin_id` bigint(18) NOT NULL COMMENT '币种ID',
  `coin_name` varchar(255) NOT NULL COMMENT '币种名称',
  `num` decimal(20,2) unsigned NOT NULL COMMENT '数量（充值金额）',
  `fee` decimal(20,2) unsigned NOT NULL COMMENT '手续费',
  `feecoin` varchar(255) DEFAULT NULL COMMENT '手续费币种',
  `mum` decimal(20,2) unsigned NOT NULL COMMENT '成交量（到账金额）',
  `type` varchar(255) NOT NULL COMMENT '类型：alipay，支付宝；cai1pay，财易付；bank，银联；',
  `tradeno` varchar(255) NOT NULL COMMENT '充值订单号',
  `outtradeno` varchar(255) DEFAULT NULL COMMENT '第三方订单号',
  `remark` varchar(8) DEFAULT NULL COMMENT '充值备注备注',
  `audit_remark` varchar(128) DEFAULT NULL COMMENT '审核备注',
  `step` tinyint(4) DEFAULT NULL COMMENT '当前审核级数',
  `status` tinyint(4) NOT NULL COMMENT '状态：0-待审核；1-审核通过；2-拒绝；3-充值成功；',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `name` varchar(100) DEFAULT NULL COMMENT '银行卡账户名',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '开户行',
  `bank_card` varchar(100) DEFAULT NULL COMMENT '银行卡号',
  `last_time` datetime DEFAULT NULL COMMENT '最后确认到账时间。',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1024692964205281282 DEFAULT CHARSET=utf8mb4 COMMENT='法币充值记录';

DROP TABLE IF EXISTS  `cash_recharge_audit_record`;
CREATE TABLE `cash_recharge_audit_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(18) DEFAULT NULL COMMENT '充值订单号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `remark` text COMMENT '审核备注',
  `step` tinyint(4) DEFAULT NULL COMMENT '当前审核级数',
  `audit_user_id` bigint(18) DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '审核人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025216503488155650 DEFAULT CHARSET=utf8mb4 COMMENT='法币充值审核记录';

DROP TABLE IF EXISTS  `cash_withdraw_audit_record`;
CREATE TABLE `cash_withdraw_audit_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(18) DEFAULT NULL COMMENT '提币订单号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `remark` text COMMENT '审核备注',
  `step` tinyint(4) DEFAULT NULL COMMENT '当前审核级数',
  `audit_user_id` bigint(18) DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '审核人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023120981197557763 DEFAULT CHARSET=utf8mb4 COMMENT='法币提现审核记录';

DROP TABLE IF EXISTS  `cash_withdrawals`;
CREATE TABLE `cash_withdrawals` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) NOT NULL COMMENT '用户ID',
  `coin_id` bigint(18) NOT NULL COMMENT '币种ID',
  `account_id` bigint(18) NOT NULL COMMENT '资金账户ID',
  `num` decimal(20,2) NOT NULL COMMENT '数量（提现金额）',
  `fee` decimal(20,2) NOT NULL COMMENT '手续费',
  `mum` decimal(20,2) NOT NULL COMMENT '到账金额',
  `truename` varchar(255) NOT NULL COMMENT '开户人',
  `bank` varchar(255) NOT NULL COMMENT '银行名称',
  `bank_prov` varchar(255) DEFAULT NULL COMMENT '银行所在省',
  `bank_city` varchar(255) DEFAULT NULL COMMENT '银行所在市',
  `bank_addr` varchar(255) DEFAULT NULL COMMENT '开户行',
  `bank_card` varchar(255) NOT NULL COMMENT '银行账号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `step` tinyint(4) DEFAULT NULL COMMENT '当前审核级数',
  `status` tinyint(4) NOT NULL COMMENT '状态：0-待审核；1-审核通过；2-拒绝；3-提现成功；',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `last_time` datetime DEFAULT NULL COMMENT '最后确认提现到账时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023106906061631491 DEFAULT CHARSET=utf8mb4 COMMENT='法币提现记录';

DROP TABLE IF EXISTS  `coin`;
CREATE TABLE `coin` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '币种ID',
  `name` varchar(100) NOT NULL COMMENT '币种名称',
  `title` varchar(100) NOT NULL COMMENT '币种标题',
  `img` varchar(255) NOT NULL COMMENT '币种logo',
  `type` varchar(50) NOT NULL COMMENT '币种类型',
  `wallet` varchar(50) NOT NULL COMMENT '类别：rgb：认购币；qbb：钱包币',
  `round` tinyint(4) NOT NULL COMMENT '小数位数',
  `base_amount` decimal(20,8) DEFAULT NULL COMMENT '最小提现单位',
  `min_amount` decimal(20,8) DEFAULT NULL COMMENT '单笔最小提现数量',
  `max_amount` decimal(20,8) DEFAULT NULL COMMENT '单笔最大提现数量',
  `day_max_amount` decimal(20,8) DEFAULT NULL COMMENT '当日最大提现数量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'status=1：启用\r\n0：禁用',
  `auto_out` double DEFAULT '10' COMMENT '自动转出数量',
  `rate` double DEFAULT '0' COMMENT '手续费率',
  `min_fee_num` decimal(20,8) DEFAULT NULL COMMENT '最低收取手续费个数',
  `withdraw_flag` tinyint(4) DEFAULT '1' COMMENT '提现开关',
  `recharge_flag` tinyint(4) DEFAULT '1' COMMENT '充值开关',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_status_wallet_type` (`wallet`,`status`,`type`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023157074441768962 DEFAULT CHARSET=utf8mb4 COMMENT='币种配置信息';

DROP TABLE IF EXISTS  `coin_recharge`;
CREATE TABLE `coin_recharge` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(18) unsigned NOT NULL COMMENT '用户id',
  `coin_id` bigint(18) NOT NULL COMMENT '币种id',
  `coin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '币种名称',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '币种类型',
  `address` varchar(255) DEFAULT NULL COMMENT '钱包地址',
  `confirm` int(1) NOT NULL COMMENT '充值确认数',
  `status` int(4) DEFAULT '0' COMMENT '状态：0-待入帐；1-充值失败，2到账失败，3到账成功；',
  `txid` varchar(80) DEFAULT NULL COMMENT '交易id',
  `amount` decimal(20,8) DEFAULT NULL COMMENT '实际到账',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COMMENT='数字货币充值记录';

DROP TABLE IF EXISTS  `coin_type`;
CREATE TABLE `coin_type` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(16) NOT NULL COMMENT '代码',
  `description` varchar(32) NOT NULL COMMENT '描述',
  `status` tinyint(4) NOT NULL COMMENT '状态：0-无效；1-有效；',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code_unique` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1015666990675070979 DEFAULT CHARSET=utf8mb4 COMMENT='币种类型';

DROP TABLE IF EXISTS  `coin_withdraw`;
CREATE TABLE `coin_withdraw` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(18) unsigned NOT NULL COMMENT '用户id',
  `coin_id` bigint(18) NOT NULL COMMENT '币种id',
  `coin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '币种名称',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '币种类型',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '钱包地址',
  `txid` varchar(80) DEFAULT NULL COMMENT '交易id',
  `num` decimal(20,8) NOT NULL COMMENT '提现量',
  `fee` decimal(20,8) NOT NULL COMMENT '手续费()',
  `mum` decimal(20,8) NOT NULL COMMENT '实际提现',
  `type` tinyint(1) DEFAULT '0' COMMENT '0站内1其他',
  `chain_fee` decimal(20,8) DEFAULT NULL COMMENT '链上手续费花费',
  `block_num` int(11) unsigned DEFAULT '0' COMMENT '区块高度',
  `wallet_mark` varchar(255) DEFAULT NULL COMMENT '钱包提币备注备注',
  `remark` varchar(255) DEFAULT NULL COMMENT '后台审核人员提币备注备注',
  `step` tinyint(4) DEFAULT NULL COMMENT '当前审核级数',
  `status` tinyint(1) NOT NULL COMMENT '状态：0-审核中；1-成功；2-拒绝；3-撤销；4-审核通过；5-打币中；',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `coinname` (`coin_id`) USING BTREE,
  KEY `idx_created` (`created`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='数字货币提现记录';

DROP TABLE IF EXISTS  `coin_withdraw_audit_record`;
CREATE TABLE `coin_withdraw_audit_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(18) DEFAULT NULL COMMENT '提币订单号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `remark` text COMMENT '审核备注',
  `step` tinyint(4) DEFAULT NULL COMMENT '当前审核级数',
  `audit_user_id` bigint(18) DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '审核人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025285804035379202 DEFAULT CHARSET=utf8mb4 COMMENT='数字货币提现审核记录';

DROP TABLE IF EXISTS  `config`;
CREATE TABLE `config` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(64) DEFAULT NULL COMMENT '配置规则类型',
  `code` varchar(50) NOT NULL COMMENT '配置规则代码',
  `name` varchar(100) NOT NULL COMMENT '配置规则名称',
  `description` varchar(255) DEFAULT NULL COMMENT '配置规则描述',
  `desc` varchar(255) DEFAULT NULL COMMENT '配置规则描述',
  `value` varchar(255) NOT NULL COMMENT '配置值',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010146 DEFAULT CHARSET=utf8mb4 COMMENT='平台配置信息';

DROP TABLE IF EXISTS  `entrust_order`;
CREATE TABLE `entrust_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` bigint(18) NOT NULL COMMENT '用户ID',
  `market_id` bigint(18) NOT NULL COMMENT '市场ID',
  `market_type` tinyint(4) DEFAULT NULL COMMENT '市场类型（1：币币交易，2：创新交易）',
  `symbol` varchar(16) DEFAULT NULL COMMENT '交易对标识符',
  `market_name` varchar(50) NOT NULL COMMENT '交易市场',
  `price` decimal(40,20) NOT NULL COMMENT '委托价格',
  `merge_low_price` decimal(40,20) DEFAULT NULL COMMENT '合并深度价格1',
  `merge_high_price` decimal(40,20) DEFAULT NULL COMMENT '合并深度价格2',
  `volume` decimal(40,20) NOT NULL COMMENT '委托数量',
  `amount` decimal(40,20) NOT NULL COMMENT '委托总额',
  `fee_rate` decimal(40,20) NOT NULL COMMENT '手续费比率',
  `fee` decimal(40,20) NOT NULL COMMENT '交易手续费',
  `contract_unit` int(11) DEFAULT NULL COMMENT '合约单位',
  `deal` decimal(40,20) NOT NULL COMMENT '成交数量',
  `freeze` decimal(40,20) NOT NULL COMMENT '冻结量',
  `margin_rate` decimal(40,20) DEFAULT NULL COMMENT '保证金比例',
  `base_coin_rate` decimal(40,20) DEFAULT NULL COMMENT '基础货币对（USDT/BTC）兑换率',
  `price_coin_rate` decimal(40,20) DEFAULT NULL COMMENT '报价货币对（USDT/BTC)兑换率',
  `lock_margin` decimal(40,20) DEFAULT NULL COMMENT '占用保证金',
  `price_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '价格类型：1-市价；2-限价',
  `trade_type` tinyint(4) DEFAULT NULL COMMENT '交易类型：1-开仓；2-平仓',
  `type` tinyint(4) NOT NULL COMMENT '买卖类型：1-买入；2-卖出',
  `open_order_id` bigint(18) DEFAULT NULL COMMENT '平仓委托关联单号',
  `status` tinyint(4) NOT NULL COMMENT 'status：0-未成交；1-已成交；2-已取消；3-异常单',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idnex_price` (`price`,`market_id`,`volume`,`deal`,`type`,`status`,`user_id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_market_id` (`market_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_symbol` (`symbol`) USING BTREE,
  KEY `idx_all` (`symbol`,`user_id`,`status`,`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025349713622228995 DEFAULT CHARSET=utf8mb4 COMMENT='委托订单信息';

DROP TABLE IF EXISTS  `market`;
CREATE TABLE `market` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '市场ID',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型：1-数字货币；2：创新交易',
  `trade_area_id` bigint(18) NOT NULL COMMENT '交易区域ID',
  `sell_coin_id` bigint(18) DEFAULT NULL COMMENT '卖方市场ID',
  `buy_coin_id` bigint(18) NOT NULL COMMENT '买方币种ID',
  `symbol` varchar(16) DEFAULT NULL COMMENT '交易对标识',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `img` varchar(255) DEFAULT NULL COMMENT '市场logo',
  `open_price` decimal(20,8) NOT NULL COMMENT '开盘价格',
  `fee_buy` decimal(20,8) NOT NULL COMMENT '买入手续费率',
  `fee_sell` decimal(20,8) NOT NULL COMMENT '卖出手续费率',
  `margin_rate` decimal(20,8) DEFAULT NULL COMMENT '保证金占用比例',
  `num_min` decimal(20,8) NOT NULL COMMENT '单笔最小委托量',
  `num_max` decimal(20,8) NOT NULL COMMENT '单笔最大委托量',
  `trade_min` decimal(20,8) NOT NULL COMMENT '单笔最小成交额',
  `trade_max` decimal(20,8) NOT NULL COMMENT '单笔最大成交额',
  `price_scale` tinyint(4) DEFAULT '0' COMMENT '价格小数位',
  `num_scale` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数量小数位',
  `contract_unit` int(11) DEFAULT NULL COMMENT '合约单位',
  `point_value` decimal(20,8) DEFAULT NULL COMMENT '点',
  `merge_depth` varchar(128) DEFAULT NULL COMMENT '合并深度（格式：4,3,2）4:表示为0.0001；3：表示为0.001',
  `trade_time` varchar(100) DEFAULT '' COMMENT '交易时间',
  `trade_week` varchar(100) DEFAULT '' COMMENT '交易周期',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序列',
  `status` tinyint(1) NOT NULL COMMENT '状态\r\n0禁用\r\n1启用',
  `fxcm_symbol` varchar(255) DEFAULT NULL COMMENT '福汇API交易对',
  `yahoo_symbol` varchar(255) DEFAULT NULL COMMENT '对应雅虎金融API交易对',
  `aliyun_symbol` varchar(255) DEFAULT NULL COMMENT '对应阿里云API交易对',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE,
  KEY `idx_trade_area_id` (`trade_area_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_buy_coinid_sell_coinid` (`sell_coin_id`,`buy_coin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1024170048992284674 DEFAULT CHARSET=utf8mb4 COMMENT='交易对配置信息';

DROP TABLE IF EXISTS  `mine`;
CREATE TABLE `mine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `total_mining` decimal(40,20) NOT NULL COMMENT '用户挖矿总的额度(真实总的挖矿数据)',
  `time_mining` varchar(50) NOT NULL DEFAULT '' COMMENT '挖矿时间',
  `real_mining` decimal(40,20) NOT NULL COMMENT '实际奖励额度',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023223389021499402 DEFAULT CHARSET=utf8mb4 COMMENT='资产快照';

DROP TABLE IF EXISTS  `mine_data`;
CREATE TABLE `mine_data` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pre_distributed` decimal(30,8) DEFAULT NULL COMMENT '昨日待分配累积折合',
  `pre_mining` decimal(30,8) DEFAULT NULL COMMENT '前一日挖矿产出',
  `total_circulation` decimal(30,8) DEFAULT NULL COMMENT '总流通量',
  `sec_irculation` decimal(30,8) DEFAULT NULL COMMENT '二级市场流通量',
  `distributed` decimal(30,8) DEFAULT NULL COMMENT '今日待分配累积折合',
  `per_million_revenue` decimal(30,8) DEFAULT NULL COMMENT '今日连续持有每百万分收入',
  `statistics_date` varchar(50) DEFAULT NULL COMMENT '统计日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1017340511608356866 DEFAULT CHARSET=utf8mb4 COMMENT='挖矿数据汇总';

DROP TABLE IF EXISTS  `mine_pool`;
CREATE TABLE `mine_pool` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(256) DEFAULT NULL COMMENT '名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `create_user` bigint(18) DEFAULT NULL COMMENT '创建者',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='矿池';

DROP TABLE IF EXISTS  `mine_pool_member`;
CREATE TABLE `mine_pool_member` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mine_pool_id` bigint(18) DEFAULT NULL COMMENT '矿池ID',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='矿池成员';

DROP TABLE IF EXISTS  `mining_detail`;
CREATE TABLE `mining_detail` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` bigint(19) NOT NULL COMMENT '用户ID',
  `area_name` varchar(19) NOT NULL DEFAULT '' COMMENT '市场名称',
  `total_fee` decimal(40,20) NOT NULL COMMENT '挖矿手续费总额度',
  `time_mining` varchar(100) NOT NULL DEFAULT '' COMMENT '挖矿时间',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`area_name`,`time_mining`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=197405 DEFAULT CHARSET=utf8mb4 COMMENT='挖矿每日汇总信息';

DROP TABLE IF EXISTS  `notice`;
CREATE TABLE `notice` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `description` varchar(200) DEFAULT NULL COMMENT '简介',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `status` int(1) DEFAULT NULL COMMENT '文章状态',
  `sort` int(4) NOT NULL COMMENT '文章排序，越大越靠前',
  `content` text COMMENT '内容',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1024190748461338626 DEFAULT CHARSET=utf8mb4 COMMENT='系统资讯公告信息';

DROP TABLE IF EXISTS  `plant_coin_dividend_account`;
CREATE TABLE `plant_coin_dividend_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `coin_name` varchar(10) NOT NULL DEFAULT '' COMMENT '币种名称',
  `reward_amount` decimal(20,8) NOT NULL COMMENT '累计币种分红',
  `unlock_amount` decimal(20,8) NOT NULL COMMENT '累计已解冻分红',
  `unlock_date` varchar(16) NOT NULL DEFAULT '' COMMENT '解冻日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='持有平台币分红解冻';

DROP TABLE IF EXISTS  `plant_coin_dividend_record`;
CREATE TABLE `plant_coin_dividend_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主建',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `coin_name` varchar(10) NOT NULL DEFAULT '' COMMENT '币种名称',
  `amount` decimal(20,8) NOT NULL COMMENT '平台币分红额度',
  `reward_date` varchar(16) NOT NULL DEFAULT '' COMMENT '分红日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '''创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023223431081979910 DEFAULT CHARSET=utf8mb4 COMMENT='持有平台币分红记录';

DROP TABLE IF EXISTS  `pool_dividend_account`;
CREATE TABLE `pool_dividend_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `reward_amount` decimal(20,8) NOT NULL COMMENT '累计分红',
  `unlock_amount` decimal(20,8) NOT NULL COMMENT '已解冻',
  `unlock_date` varchar(16) NOT NULL DEFAULT '' COMMENT '解冻日期',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='矿池解冻额度';

DROP TABLE IF EXISTS  `pool_dividend_record`;
CREATE TABLE `pool_dividend_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主建',
  `user_id` bigint(20) NOT NULL COMMENT '矿主userid',
  `amount` decimal(20,8) NOT NULL COMMENT '矿主前一天奖励额度',
  `reward_date` varchar(16) DEFAULT NULL COMMENT '矿主奖励日期',
  `created` datetime DEFAULT NULL COMMENT '''创建日期',
  `mark` varchar(100) DEFAULT NULL COMMENT '当不分配资金的时候,写一个备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023227443760021507 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS  `sms`;
CREATE TABLE `sms` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `template_code` varchar(25) DEFAULT NULL COMMENT '短信模板ID',
  `country_code` varchar(255) DEFAULT NULL COMMENT '国际区号',
  `mobile` varchar(100) DEFAULT NULL COMMENT '短信接收手机号',
  `content` varchar(255) DEFAULT NULL COMMENT '短信内容',
  `status` int(4) DEFAULT NULL COMMENT '短信状态：0，默认值；大于0，成功发送短信数量；小于0，异常；',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1019617990242516994 DEFAULT CHARSET=utf8mb4 COMMENT='短信信息';

DROP TABLE IF EXISTS  `table_aa`;
CREATE TABLE `table_aa` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '用户id',
  `coin_id` bigint(18) NOT NULL COMMENT '币种id',
  `account_id` bigint(18) NOT NULL COMMENT '账户id',
  `ref_account_id` bigint(18) NOT NULL COMMENT '关联方的账户ID',
  `order_id` bigint(18) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `direction` tinyint(1) NOT NULL COMMENT '资金方向：入账为-1；出账为-2',
  `business_type` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '业务类型',
  `amount` decimal(40,20) NOT NULL COMMENT '数量/金额',
  `fee` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '手续费',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '备注',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1019578841737759438 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `trade_area`;
CREATE TABLE `trade_area` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '交易区名称',
  `code` varchar(32) DEFAULT NULL COMMENT '交易区代码',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型：1-数字货币交易；2-创新交易使用；',
  `coin_id` bigint(18) DEFAULT NULL COMMENT '结算币种（仅创新交易需要使用）',
  `coin_name` varchar(16) DEFAULT NULL COMMENT '结算币种名称（仅创新交易需要使用）',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `base_coin` bigint(18) DEFAULT NULL COMMENT '是否作为基础结算货币,0否1是 供统计个人账户使用',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_coin_id` (`coin_id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE,
  KEY `idx_update_time` (`last_update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1023185204430737411 DEFAULT CHARSET=utf8mb4 COMMENT='交易区';

DROP TABLE IF EXISTS  `turnover_order`;
CREATE TABLE `turnover_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `market_id` bigint(18) NOT NULL COMMENT '市场ID',
  `market_type` int(11) DEFAULT NULL COMMENT '交易对类型：1-币币交易；2-创新交易；',
  `trade_type` tinyint(1) NOT NULL COMMENT '交易类型:1 买 2卖',
  `symbol` varchar(16) DEFAULT NULL COMMENT '交易对标识符',
  `market_name` varchar(16) DEFAULT NULL COMMENT '交易对名称',
  `sell_user_id` bigint(18) NOT NULL COMMENT '卖方用户ID',
  `sell_coin_id` bigint(18) NOT NULL COMMENT '卖方币种ID',
  `sell_order_id` bigint(18) NOT NULL COMMENT '卖方委托订单ID',
  `sell_price` decimal(40,20) NOT NULL COMMENT '卖方委托价格',
  `sell_fee_rate` decimal(40,20) NOT NULL COMMENT '卖方手续费率',
  `sell_volume` decimal(40,20) NOT NULL COMMENT '卖方委托数量',
  `buy_user_id` bigint(18) NOT NULL COMMENT '买方用户ID',
  `buy_coin_id` bigint(18) NOT NULL COMMENT '买方币种ID',
  `buy_order_id` bigint(18) NOT NULL COMMENT '买方委托订单ID',
  `buy_volume` decimal(40,20) NOT NULL COMMENT '买方委托数量',
  `buy_price` decimal(40,20) NOT NULL COMMENT '买方委托价格',
  `buy_fee_rate` decimal(40,20) NOT NULL COMMENT '买方手续费率',
  `order_id` bigint(18) NOT NULL COMMENT '委托订单ID',
  `amount` decimal(40,20) NOT NULL COMMENT '成交总额',
  `price` decimal(40,20) NOT NULL COMMENT '成交价格',
  `volume` decimal(40,20) NOT NULL COMMENT '成交数量',
  `deal_sell_fee` decimal(40,20) NOT NULL COMMENT '成交卖出手续费',
  `deal_sell_fee_rate` decimal(40,20) NOT NULL COMMENT '成交卖出手续费率',
  `deal_buy_fee` decimal(40,20) NOT NULL COMMENT '成交买入手续费',
  `deal_buy_fee_rate` decimal(40,20) NOT NULL COMMENT '成交买入成交率费',
  `status` tinyint(1) NOT NULL COMMENT '状态0待成交，1已成交，2撤销，3.异常',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `un_sell_buy_order_id` (`sell_order_id`,`buy_order_id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_market_id` (`market_id`) USING BTREE,
  KEY `turnover_sellorder_buyorder_market_index` (`market_id`,`sell_order_id`,`buy_order_id`) USING BTREE,
  KEY `idx_selluserid` (`sell_user_id`) USING BTREE,
  KEY `idx_buyuserid` (`buy_user_id`) USING BTREE,
  KEY `idx_bid_sid` (`sell_order_id`,`buy_order_id`),
  KEY `idx_symbol` (`symbol`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_buy_order_id` (`buy_order_id`) USING BTREE,
  KEY `idx_sell_order_id` (`sell_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025349711571607554 DEFAULT CHARSET=utf8mb4 COMMENT='成交订单';

DROP TABLE IF EXISTS  `turnover_record`;
CREATE TABLE `turnover_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `market_id` bigint(18) NOT NULL COMMENT '市场ID',
  `price` decimal(20,8) NOT NULL COMMENT '成交价',
  `volume` decimal(20,8) NOT NULL COMMENT '成交数量',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='成交数据';

DROP TABLE IF EXISTS  `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(4) DEFAULT '1' COMMENT '用户类型：1-普通用户；2-代理人',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `country_code` varchar(255) DEFAULT NULL COMMENT '国际电话区号',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `paypassword` varchar(255) DEFAULT NULL COMMENT '交易密码',
  `paypass_setting` tinyint(1) DEFAULT '0' COMMENT '交易密码设置状态',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `id_card_type` tinyint(1) DEFAULT NULL COMMENT '证件类型:1，身份证；2，军官证；3，护照；4，台湾居民通行证；5，港澳居民通行证；9，其他；',
  `auth_status` tinyint(4) DEFAULT '0' COMMENT '认证状态：0-未认证；1-初级实名认证；2-高级实名认证',
  `ga_secret` varchar(32) DEFAULT NULL COMMENT 'Google令牌秘钥',
  `ga_status` tinyint(1) DEFAULT '0' COMMENT 'Google认证开启状态,0,未启用，1启用',
  `id_card` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `level` int(11) DEFAULT NULL COMMENT '代理商级别',
  `authtime` datetime DEFAULT NULL COMMENT '认证时间',
  `logins` int(11) DEFAULT '0' COMMENT '登录数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0，禁用；1，启用；',
  `invite_code` varchar(200) DEFAULT NULL COMMENT '邀请码',
  `invite_relation` varchar(500) DEFAULT NULL COMMENT '邀请关系',
  `direct_inviteid` varchar(20) DEFAULT NULL COMMENT '直接邀请人ID',
  `is_deductible` int(11) DEFAULT '0' COMMENT '0 否 1是  是否开启平台币抵扣手续费',
  `reviews_status` int(11) DEFAULT '0' COMMENT '审核状态,1通过,2拒绝,0,待审核',
  `refe_auth_id` bigint(30) DEFAULT NULL,
  `agent_note` text COMMENT '代理商拒绝原因',
  `access_key_id` varchar(16) DEFAULT NULL COMMENT 'API的KEY',
  `access_key_secret` varchar(30) DEFAULT NULL COMMENT 'API的密钥',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `idx_addtime` (`created`) USING BTREE,
  KEY `username` (`username`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025348741168672770 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

DROP TABLE IF EXISTS  `user_auth_audit_record`;
CREATE TABLE `user_auth_audit_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `auth_code` bigint(18) DEFAULT NULL COMMENT '对应user_auth_info表code',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户ID',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态1同意2拒絕',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `step` tinyint(4) DEFAULT NULL COMMENT '当前审核级数',
  `audit_user_id` bigint(18) DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '审核人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025205816229498883 DEFAULT CHARSET=utf8mb4 COMMENT='实名认证审核信息';

DROP TABLE IF EXISTS  `user_auth_info`;
CREATE TABLE `user_auth_info` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户ID',
  `image_url` varchar(256) DEFAULT NULL COMMENT '图片地址',
  `serialno` int(11) DEFAULT NULL COMMENT '序号：1-身份证正面照；2-身份证反面照；3-手持身份证照片；',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `auth_code` bigint(18) DEFAULT NULL COMMENT '用户每组审核记录唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025205816242081797 DEFAULT CHARSET=utf8mb4 COMMENT='实名认证信息';

DROP TABLE IF EXISTS  `user_bank`;
CREATE TABLE `user_bank` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(18) NOT NULL COMMENT '用户id',
  `remark` varchar(255) NOT NULL COMMENT '银行卡名称',
  `real_name` varchar(255) NOT NULL COMMENT '开户人',
  `bank` varchar(255) NOT NULL COMMENT '开户行',
  `bank_prov` varchar(255) DEFAULT NULL COMMENT '开户省',
  `bank_city` varchar(255) DEFAULT NULL COMMENT '开户市',
  `bank_addr` varchar(255) DEFAULT NULL COMMENT '开户地址',
  `bank_card` varchar(255) NOT NULL COMMENT '开户账号',
  `status` tinyint(4) NOT NULL COMMENT '状态：0，禁用；1，启用；',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `create_time` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010148 DEFAULT CHARSET=utf8mb4 COMMENT='用户绑卡信息';

DROP TABLE IF EXISTS  `user_favorite_market`;
CREATE TABLE `user_favorite_market` (
  `id` bigint(18) NOT NULL COMMENT '主键',
  `type` int(11) DEFAULT NULL COMMENT '交易对类型：1-币币交易；2-创新交易；',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户ID',
  `market_id` bigint(18) DEFAULT NULL COMMENT '交易对ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏交易市场';

DROP TABLE IF EXISTS  `user_login_log`;
CREATE TABLE `user_login_log` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户ID',
  `client_type` tinyint(4) DEFAULT NULL COMMENT '客户端类型1-PC；2-IOS；3-Android',
  `login_ip` varchar(16) DEFAULT NULL COMMENT '登录IP',
  `login_address` varchar(32) DEFAULT NULL COMMENT '登录地址',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_fk_login_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户登录日志';

DROP TABLE IF EXISTS  `user_wallet`;
CREATE TABLE `user_wallet` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '用户ID',
  `coin_id` bigint(18) NOT NULL COMMENT '币种ID',
  `coin_name` varchar(200) NOT NULL DEFAULT '' COMMENT '币种名称',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '提币地址名称',
  `addr` varchar(200) NOT NULL DEFAULT '' COMMENT '地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `idx_coinid` (`coin_id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `coinname` (`coin_name`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1025344748565315587 DEFAULT CHARSET=utf8mb4 COMMENT='用户提币地址';

DROP TABLE IF EXISTS  `web_config`;
CREATE TABLE `web_config` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '分组, LINK_BANNER ,WEB_BANNER',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` text NOT NULL COMMENT '值',
  `sort` smallint(4) DEFAULT '1' COMMENT '权重',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `url` text COMMENT '超链接地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1022461580883234818 DEFAULT CHARSET=utf8mb4 COMMENT='网站配置信息';

DROP TABLE IF EXISTS  `work_issue`;
CREATE TABLE `work_issue` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(18) DEFAULT NULL COMMENT '用户id(提问用户id)',
  `answer_user_id` bigint(18) DEFAULT NULL COMMENT '回复人id',
  `answer_name` varchar(50) DEFAULT NULL COMMENT '回复人名称',
  `question` text COMMENT '工单内容',
  `answer` text COMMENT '回答内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：1-待回答；2-已回答；',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010109 DEFAULT CHARSET=utf8mb4 COMMENT='工单记录';

SET FOREIGN_KEY_CHECKS = 1;

