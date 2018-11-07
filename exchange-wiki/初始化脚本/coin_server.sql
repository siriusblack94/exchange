SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `coin_server`;
insert into `coin_server`(`id`,`rpc_ip`,`rpc_port`,`running`,`wallet_number`,`coin_name`,`mark`,`real_number`,`last_update_time`,`created`) values
('1015672795853910018','47.52.241.81','8846','0','532120','BTC','服务器正常','0','2018-07-16 14:09:59','2018-07-08 03:03:59'),
('1015894258013474818','47.75.180.142','8089','0','5973189','ETH','服务器正常','5973189','2018-07-16 14:12:00','2018-07-08 17:44:00');
SET FOREIGN_KEY_CHECKS = 1;

