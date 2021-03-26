
--补充op_today_profit_notes字段
alter table bage_bill add column `op_today_profit_notes` varchar(200) DEFAULT NULL COMMENT '每日收益备注（理财或其他业务）';
