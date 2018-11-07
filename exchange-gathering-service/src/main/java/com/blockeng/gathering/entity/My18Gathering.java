package com.blockeng.gathering.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;


@Data
@Accessors(chain = true)
@TableName("my18_pay_temp")
public class My18Gathering {

    @TableField(value = "o_time")
    @ApiModelProperty(value = "打款时间",name = "o_time")
    private String makeMoneyTime;

    @TableField(value = "O_id")
    @ApiModelProperty(value = "流水号",name="O_id")
    private String seqID;

    @TableField(value = "M_name")
    @ApiModelProperty(value="打款人姓名",name="M_name")
    private String moneyMaker;

    @TableField(value = "U_id")
    @ApiModelProperty(value = "附言内容,参考号+平台编号",name="U_id")
    private String referenceId;

    @TableField(value="addmoney")
    @ApiModelProperty(value = "到账金额",name="addmoney")
    private double addmoney;

    @TableField(value = "H_fee")
    @ApiModelProperty(value = "手续费",name="H_fee")
    private double poundage;
}
