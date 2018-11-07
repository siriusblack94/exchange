package com.blockeng.gathering.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 充值记录
 * */
@Data
@Accessors(chain = true)
@TableName("cash_recharge")
public class CashRecharge {

    @TableField(value = "id")
    @ApiModelProperty(value = "订单ID",name = "id")
    private long orderId;

    @TableField(value = "remark")
    @ApiModelProperty(value = "参考号",name = "remark")
    private String remark;

    @TableField(value = "created")
    @ApiModelProperty(value = "订单创建时间",name = "created")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date created;

}
