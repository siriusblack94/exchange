package com.blockeng.gathering.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@Accessors(chain = true)
@TableName("cash_recharge_syn")
public class CashRechargeSyn {

    @TableField(value = "order_id")
    @ApiModelProperty(value = "订单ID",name = "order_Id")
    private String orderId;

    @TableField(value = "remark")
    @ApiModelProperty(value = "订单ID",name = "remark")
    private String remark;

    @TableField(value = "created")
    @ApiModelProperty(value = "订单创建时间",name = "created")
    private Date created;

    @TableField(value = "plateform_id")
    @ApiModelProperty(value = "平台ID",name = "plateform_id")
    private String plateformId;

}
