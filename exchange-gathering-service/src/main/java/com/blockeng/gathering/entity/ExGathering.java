package com.blockeng.gathering.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;


@Data
@Accessors(chain = true)
@TableName("my18_pay_temp")
public class ExGathering {

    @TableField(value = "makeMoneyTime")
    @ApiModelProperty(value = "打款时间",name = "makeMoneyTime")
    private Date makeMoneyTime;

    @TableField(value = "seqID")
    @ApiModelProperty(value = "流水号",name="seqID")
    private String seqID;

    @TableField(value = "moneyMaker")
    @ApiModelProperty(value="打款人姓名",name="moneyMaker")
    private String moneyMaker;

    @TableField(value = "referenceId")
    @ApiModelProperty(value = "附言内容,参考号+平台ID",name="referenceId")
    private String referenceId;

    @TableField(value="addmoney")
    @ApiModelProperty(value = "到账金额",name="addmoney")
    private double addmoney;

    @TableField(value = "poundage")
    @ApiModelProperty(value = "手续费",name="poundage")
    private double poundage;
}
