SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `coin_balance`;
insert into `coin_balance`(`id`,`coin_id`,`coin_name`,`system_balance`,`coin_type`,`collect_account_balance`,`loan_account_balance`,`fee_account_balance`,`recharge_account_balance`,`last_update_time`,`created`) values
('1015672796294311938','1010101010101010102','BTC',null,'btc',0E-8,0E-8,0E-8,0E-8,'2018-07-08 03:03:59','2018-07-08 03:03:59'),
('1015894258164469761','1010101010101010103','ETH',null,'eth',2.00000000,0E-8,0E-8,0E-8,'2018-07-08 17:44:00','2018-07-08 17:44:00');
SET FOREIGN_KEY_CHECKS = 1;

