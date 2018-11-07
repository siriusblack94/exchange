/* ex_admin 数据初始化脚本 */

-- 初始化-菜单
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (1, NULL, NULL, 1, '网站运营', '网站运营', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (2, NULL, NULL, 1, '统计分析', '统计分析', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (3, NULL, NULL, 1, '用户中心', '用户中心', 3, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (4, NULL, NULL, 1, '财务管理', '财务管理', 4, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (5, NULL, NULL, 1, '资金明细', '资金明细', 5, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (6, NULL, NULL, 1, '币币交易参数', '币币交易参数', 6, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (7, NULL, NULL, 1, '系统参数', '系统参数', 7, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (8, NULL, NULL, 1, '系统管理', '系统管理', 8, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (9, 1, '1', 2, '公告管理', '公告管理', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (10, 1, '1', 2, '资源配置', '资源配置', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (11, 1, '1', 2, '客服工单', '客服工单', 3, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (12, 2, '2', 2, '运营统计', '运营统计', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (13, 12, '2.12', 2, '交易统计', '交易统计', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (14, 12, '2.12', 2, '注册统计', '注册统计', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (15, 12, '2.12', 2, '登录统计', '登录统计', 3, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (16, 12, '2.12', 2, '法币充值统计', '法币充值统计', 4, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (17, 12, '2.12', 2, '法币提现统计', '法币提现统计', 5, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (18, 12, '2.12', 2, '充币统计', '充币统计', 6, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (19, 12, '2.12', 2, '提币统计', '提币统计', 7, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (20, 13, '2.12.13', 2, '交易量排行', '交易量排行', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (21, 3, '3', 2, '会员管理', '会员管理', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (22, 21, '3.21', 2, '用户列表', '用户列表', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (23, 21, '3.21', 2, '实名认证审核', '实名认证审核', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (24, 21, '3.21', 2, '矿池列表', '矿池列表', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (25, 4, '4', 2, '法币充值审核', '法币充值审核', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (26, 4, '4', 2, '法币提现审核', '法币提现审核', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (27, 4, '4', 2, '数字货币提币审核', '数字货币提币审核', 3, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (28, 5, '5', 2, '账户资产', '账户资产', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (29, 5, '5', 2, '交易记录', '交易记录', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (30, 5, '5', 2, '充提记录', '充提记录', 3, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (31, 5, '5', 2, '资金流水', '资金流水', 4, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (32, 28, '5.29', 2, '币币交易委托', '币币交易委托', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (33, 28, '5.29', 2, '币币交易成交', '币币交易成交', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (34, 29, '5.30', 2, '法币充值记录', '法币充值记录', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (35, 29, '5.30', 2, '法币提现记录', '法币提现记录', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (36, 29, '5.30', 2, '数字货币充值记录', '数字货币充值记录', 3, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (37, 29, '5.30', 2, '数字货币提币记录', '数字货币提币记录', 4, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (38, 6, '6', 2, '币种类型配置', '币种类型配置', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (39, 6, '6', 2, '交易区域配置', '交易区域配置', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (40, 6, '6', 2, '币种配置', '币种配置', 3, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (41, 6, '6', 2, '市场配置', '市场配置', 4, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (42, 7, '7', 2, '公司银行卡管理', '公司银行卡管理', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (43, 7, '7', 2, '系统参数配置', '系统参数配置', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (44, 8, '8', 2, '短信管理', '短信管理', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (45, 8, '8', 2, '权限管理', '权限管理', 3, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (46, 8, '8', 2, '系统日志', '系统日志', 4, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (47, 45, '8.45', 2, '角色权限配置', '角色权限配置', 1, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (48, 45, '8.45', 2, '角色管理', '角色管理', 2, 1);
INSERT INTO `sys_menu`(`id`, `parent_id`, `parent_key`, `type`, `name`, `desc`, `sort`, `status`) VALUES (49, 45, '8.45', 2, '用户管理', '用户管理', 3, 1);


-- 初始化-角色
INSERT INTO `sys_role`(`name`, `code`, `description`, `status`) VALUES ('管理员', 'ROLE_ADMIN', '系统管理员', 1);


-- 初始化-角色菜单
INSERT INTO `sys_role_menu`(`role_id`, `menu_id`) SELECT r.id, m.id FROM `sys_role` r CROSS JOIN `sys_menu` m;


-- 初始化-管理员用户
INSERT INTO `sys_user`(`username`, `password`, `fullname`, `status`) VALUES ('admin', '$2a$10$gRpz2aj79X6maOB3uO706uHBeJhaIXv3XvNV9eAotmj6auNDwqCdy', '管理员', 1);


-- 初始化-用户角色
INSERT INTO `sys_user_role`(`role_id`, `user_id`) SELECT r.id, u.id FROM `sys_role` r CROSS JOIN `sys_user` u;


-- 初始化-权限点
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (9, 'notice_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (9, 'notice_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (9, 'notice_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (9, 'notice_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (10, 'web_config_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (10, 'web_config_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (10, 'web_config_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (10, 'web_config_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (11, 'work_issue_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (11, 'work_issue_update', '回复');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (20, 'trade_statistics_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (14, 'register_statistics_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (15, 'login_statistics_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (16, 'cash_recharge_statistics_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (17, 'cash_withdraw_statistics_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (18, 'coin_recharge_statistics_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (19, 'coin_withdraw_statistics_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (22, 'user_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (22, 'user_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (22, 'user_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (22, 'user_wallet_query', '钱包查询');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (22, 'user_bank_query', '银行卡查询');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (23, 'user_auth_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (23, 'user_auth_audit', '审核');
/* 矿池 */
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (24, 'mine_pool_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (24, 'mine_pool_create', '创建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (24, 'mine_pool_update', '修改');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (24, 'mine_pool_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (24, 'mine_pool_audit', '审核');
/* 矿池 */
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (25, 'cash_recharge_audit_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (25, 'cash_recharge_audit_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (25, 'cash_recharge_audit_1', '一级审核');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (25, 'cash_recharge_audit_2', '二级审核');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (26, 'cash_withdraw_audit_1', '一级审核');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (26, 'cash_withdraw_audit_2', '二级审核');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (27, 'coin_withdraw_audit_1', '一级审核');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (27, 'coin_withdraw_audit_2', '二级审核');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (28, 'account_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (28, 'account_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (28, 'account_status_update', '修改状态');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (28, 'account_recharge_coin_xn', '充值');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (32, 'trade_entrust_order_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (32, 'trade_entrust_order_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (33, 'trade_deal_order_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (33, 'trade_deal_order_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (34, 'cash_recharge_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (34, 'cash_recharge_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (35, 'cash_withdraw_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (35, 'cash_withdraw_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (36, 'coin_recharge_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (36, 'coin_recharge_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (37, 'coin_withdraw_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (37, 'coin_withdraw_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (31, 'account_detail_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (31, 'account_detail_export', '导出');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (38, 'trade_area_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (38, 'trade_area_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (38, 'trade_area_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (38, 'trade_area_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (39, 'trade_coin_type_query', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (39, 'trade_coin_type_create', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (39, 'trade_coin_type_update', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (39, 'trade_coin_type_delete', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (40, 'trade_coin_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (40, 'trade_coin_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (40, 'trade_coin_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (40, 'trade_coin_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (41, 'trade_market_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (41, 'trade_market_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (41, 'trade_market_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (41, 'trade_market_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (42, 'admin_bank_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (42, 'admin_bank_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (42, 'admin_bank_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (42, 'admin_bank_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (43, 'config_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (43, 'config_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (43, 'config_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (43, 'config_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (44, 'sms_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (47, 'sys_privilege_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (47, 'sys_privilege_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (47, 'sys_privilege_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (47, 'sys_privilege_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (48, 'sys_role_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (48, 'sys_role_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (48, 'sys_role_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (48, 'sys_role_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (49, 'sys_user_query', '搜索');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (49, 'sys_user_create', '新建');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (49, 'sys_user_update', '编辑');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (49, 'sys_user_delete', '删除');
INSERT INTO `sys_privilege`(menu_id, `name`, description) VALUES (46, 'sys_user_log_query', '搜索');


-- 初始化-角色权限
INSERT INTO `sys_role_privilege` (role_id, privilege_id)
SELECT r.id, p.id FROM `sys_role` r CROSS JOIN `sys_privilege` p;


-- 初始化-用户角色权限
INSERT INTO `sys_role_privilege_user` (user_id, role_id, privilege_id)
SELECT u.id, r.id, p.id FROM `sys_user` u CROSS JOIN `sys_role` r CROSS JOIN `sys_privilege` p;
/* ---初始化完成--- */




