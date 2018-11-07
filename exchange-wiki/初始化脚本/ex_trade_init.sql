-- 配置币种类型
DELETE FROM coin_type;
insert into coin_type(code, description, status) VALUES ('usdt', 'usdt', 1);
insert into coin_type(code, description, status) VALUES ('btc', 'btc', 1);
insert into coin_type(code, description, status) VALUES ('eth', 'eth', 1);
insert into coin_type(code, description, status) VALUES ('ethToken', 'ethToken', 1);


-- 配置币种
DELETE FROM coin;
insert into coin(name, title, img, type, wallet, round, base_amount, min_amount, max_amount, day_max_amount, min_fee_num, status, auto_out, rate, withdraw_flag, recharge_flag)
VALUES ('USDT', 'USDT', 'https://bhao.oss-cn-hongkong.aliyuncs.com/coin-usdt.png', 'usdt', 'rgb', 8, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1);
insert into coin(name, title, img, type, wallet, round, base_amount, min_amount, max_amount, day_max_amount, min_fee_num, status, auto_out, rate, withdraw_flag, recharge_flag)
VALUES ('BTC', 'BTC', 'https://bhao.oss-cn-hongkong.aliyuncs.com/coin-btc.png', 'btc', 'rgb', 8, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1);
insert into coin(name, title, img, type, wallet, round, base_amount, min_amount, max_amount, day_max_amount, min_fee_num, status, auto_out, rate, withdraw_flag, recharge_flag)
VALUES ('ETH', 'ETH', 'https://bhao.oss-cn-hongkong.aliyuncs.com/coin-eth.png', 'eth', 'rgb', 8, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1);
insert into coin(name, title, img, type, wallet, round, base_amount, min_amount, max_amount, day_max_amount, min_fee_num, status, auto_out, rate, withdraw_flag, recharge_flag)
VALUES ('NBXX', 'NBXX', '', 'ethToken', 'rgb', 8, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1);


-- 配置交易区域
DELETE FROM trade_area;
insert into trade_area(name, code, type, coin_id, coin_name, sort, status, base_coin)
VALUES ('USDT', 'USDT', 1, (SELECT t.id FROM coin t WHERE t.name = 'USDT'), 'USDT', 1, 1, 1);


-- 配置交易市场
DELETE FROM market;
INSERT INTO market (type, trade_area_id, sell_coin_id, buy_coin_id, symbol, name, title, img,
	open_price, fee_buy, fee_sell, num_min, num_max, trade_min, trade_max, price_scale, num_scale, merge_depth, trade_time, trade_week, sort, status)
VALUES (1, (SELECT t.id FROM trade_area t WHERE t.name = 'USDT'),
 (SELECT t.id FROM coin t WHERE t.name = 'BTC'),
 (SELECT t.id FROM coin t WHERE t.name = 'USDT'),
 'BTCUSDT', 'BTC/USDT', 'BTC/USDT', 'https://bhao.oss-cn-hongkong.aliyuncs.com/coin-btc.png',
	6400.15, 0.002, 0.002, 0.0001, 10000, 10, 10000000, 2, 4, '2,1,0', '00:00-23:59', '1,2,3,4,5,6,7', 1, 1);
INSERT INTO market (type, trade_area_id, sell_coin_id, buy_coin_id, symbol, name, title, img,
	open_price, fee_buy, fee_sell, num_min, num_max, trade_min, trade_max, price_scale, num_scale, merge_depth, trade_time, trade_week, sort, status)
VALUES (1, (SELECT t.id FROM trade_area t WHERE t.name = 'USDT'),
 (SELECT t.id FROM coin t WHERE t.name = 'ETH'),
 (SELECT t.id FROM coin t WHERE t.name = 'USDT'),
 'ETHUSDT', 'ETH/USDT', 'ETH/USDT', 'https://bhao.oss-cn-hongkong.aliyuncs.com/coin-eth.png',
	455.15, 0.002, 0.002, 0.0001, 100000, 10, 10000000, 2, 4, '2,1,0', '0:00-23:59', '1,2,3,4,5,6,7', 2, 1);
INSERT INTO market (type, trade_area_id, sell_coin_id, buy_coin_id, symbol, name, title, img,
	open_price, fee_buy, fee_sell, num_min, num_max, trade_min, trade_max, price_scale, num_scale, merge_depth, trade_time, trade_week, sort, status)
VALUES (1, (SELECT t.id FROM trade_area t WHERE t.name = 'USDT'),
 (SELECT t.id FROM coin t WHERE t.name = 'NBXX'),
 (SELECT t.id FROM coin t WHERE t.name = 'USDT'),
 'NBXXUSDT', 'NBXX/USDT', 'NBXX/USDT', '',
	1.15, 0.002, 0.002, 0.0001, 100000, 10, 10000000, 2, 4, '2,1,0', '0:00-23:59', '1,2,3,4,5,6,7', 3, 1);


-- 初始化用户
DELETE FROM user;
insert into user(type, username, paypass_setting, `status`, invite_code)
values (0, 'C2CAdmin', 0, 1, null);


-- 初始化资金账户
DELETE FROM account;
insert into account(user_id, coin_id, status, balance_amount, freeze_amount, recharge_amount, withdrawals_amount, net_value, lock_margin, float_profit, total_profit, rec_addr, version)
select t.id, c.id, 1, 500000000000, 0, 0, 0, 0, 0, 0, 0, '', 0 from user t CROSS JOIN coin c where t.username in ('C2CAdmin');


-- 初始化config
DELETE FROM config;
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'WITHDRAW_MIN_AMOUNT', '最小取现额（USDT）', '最小取现额（USDT）', '100');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'WITHDRAW_MAX_AMOUNT', '最大取现额（USDT）', '最大取现额（USDT）', '50000');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'WITHDRAW_MIN_POUNDAGE', '最小取现手续费', '最小取现手续费', '0');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'WITHDRAW_POUNDAGE_RATE', '取现手续费率', '取现手续费率', '0');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'WITHDRAW_BASEAMOUNT', '取现基数', '取现值必须是基数的倍数，基数如果是100，那么取现值只能是100的倍数，例如：200,300等等', '1');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'WITHDRAW_DAY_MAX_AMOUNT', '每日最大提现额（USDT）', '每日最大提现额（USDT）', '500000');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'WITHDRAW_STATUS', '提现状态', '提现状态，0表示不能提现，1表示可以提现', '1');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'CNY2USDT', '人民币充值USDT换算费率', '人民币充值USDT换算费率', '6.42');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('CNY', 'USDT2CNY', '人民币提现USDT换算费率', '人民币提现USDT换算费率', '6.4');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('MINING', 'SWITCH', '挖矿开关', '挖矿开关', '1');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('MINING', 'COIN_ID', '挖矿币种ID', '挖矿币种ID', '1010101010101010104');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('MINING', 'COIN_NAME', '挖矿币种名称', '挖矿币种名称', 'NBXX');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('REGISTER_REWARD', 'SWITCH', '注册奖励开关', '注册奖励开关：1-开启；0-关闭；', '1');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('REGISTER_REWARD', 'COIN_ID', '注册奖励币种', '邀请奖励币种', '1010101010101010104');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('REGISTER_REWARD', 'AMOUNT', '注册奖励数量', '注册奖励数量', '1000');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('REGISTER_REWARD', 'START_TIME', '注册奖励开始时间', '注册奖励开始时间', '2018-05-25 00:00:00');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('REGISTER_REWARD', 'END_TIME', '注册奖励结束时间', '注册奖励结束时间', '2028-06-30 00:00:00');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('INVITE_REWARD', 'SWITCH', '邀请奖励开关', '邀请奖励开关：1-开启；0-关闭；', '1');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('INVITE_REWARD', 'COIN_ID', '邀请奖励币种', '邀请奖励币种', '1010101010101010104');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('INVITE_REWARD', 'AMOUNT', '邀请奖励金额', '邀请奖励金额', '200');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('INVITE_REWARD', 'START_TIME', '邀请奖励开始时间', '邀请奖励开始时间', '2018-05-25 00:00:00');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('INVITE_REWARD', 'END_TIME', '邀请奖励结束时间', '邀请奖励结束时间', '2028-06-30 00:00:00');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'REGISTER_VERIFY', '用户注册验证', '用户注册短信模板', '您正在注册平台账号。验证码：${code}，验证码有效时间：30分钟。请勿向任何人包括客服提供验证码！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'FORGOT_VERIFY', '用户找回密码验证', '用户找回密码模板', '您的短信验证码是${code}。您正在通过手机号重置登录密码，如非本人操作，请忽略该短信！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'REGISTER_AGENT', '注册成为代理商用户', '代理商注册短信模板', '恭喜您注册成为代理商用户！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'UNDER_LINE_REFUSE', '线下充值拒绝短信', '线下充值拒绝短信模板', '您在平台申请的线下充值${num}元已被拒绝，拒绝原因为:${reason}，如需退款或有疑问请联系在线客服！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'UNDER_LINE_SUCCESS', '线下充值成功短信', '线下充值成功短信模板', '您已在平台线下成功充值${num}元，人工到账确认时间为：${getTime}！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'WITHDRAW_APPLY', '提币申请', '提币申请短信模板', '您已在平台申请提币验证码为：${code}！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'WITHDRAW_SUCCESS', '提币成功', '提币成功短信模板', '您已在平台成功转出${amount}个${coinName}，请注意查收！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'CASH_WITHDRAW_REFUSE', '法币提现', '法币提现审核拒绝短信模板', '您在平台申请的提现：${num}元已被拒绝，拒绝原因为:${reason}，如需退款或有疑问请联系在线客服！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'FORGOT_PWD_VERIFY', '找回登录密码', '找回登录密码短信模板', '您手机验证码为：${code}，如有问题请拨打客服电话！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'CHANGE_PHONE_VERIFY', '修改手机号码', '修改手机号码短信模板', '您手机验证码为：${code}，如有问题请拨打客服电话！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'CHANGE_LOGIN_PWD_VERIFY', '修改登录密码', '修改登录密码短信模板', '您手机验证码为：${code}，如有问题请拨打客服电话！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'CHANGE_PAY_PWD_VERIFY', '修改资金密码', '修改资金密码短信模板', '您手机验证码为：${code}，如有问题请拨打客服电话！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'FORGOT_PAY_PWD_VERIFY', '找回资金密码', '找回资金密码短信模板', '您手机验证码为：${code}，如有问题请拨打客服电话！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'CASH_WITHDRAWS', '提现申请', '提现申请模板', '您手机验证码为：${code}，如有问题请拨打客服电话！退订回T');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SMS', 'COIN_RECHARGE_SUCCESS', '充币成功', '充币成功模板', '您已成功充值${amount}个${coinName}，到账确认时间为：${getTime}！');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SYSTEM', 'TRADE_STATUS', '系统交易状态', '币币交易状态：0-关闭；1-开启', '1');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SYSTEM', 'CASH_WITHDRAW_AUDIT_STEPS', '提现审核级数', '提现审核级数', '2');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SYSTEM', 'CASH_RECHARGE_AUDIT_STEPS', '充值审核级数', '充值审核级数', '2');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SYSTEM', 'COIN_WITHDRAW_AUDIT_STEPS', '提币审核级数', '提币审核级数', '2');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SYSTEM', 'PLATFORM_COIN_ID', '平台币ID', '平台币ID', '1010101010101010101');
INSERT INTO `config`(`type`, `code`, `name`, `desc`, `value`) VALUES ('SYSTEM', 'PLATFORM_COIN_NAME', '平台币名称', '平台币名称', 'USDT');




















