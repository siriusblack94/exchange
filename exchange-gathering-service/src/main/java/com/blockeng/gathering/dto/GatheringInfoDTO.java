package com.blockeng.gathering.dto;


import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
@Accessors(chain = true)
public class GatheringInfoDTO implements Serializable {

    @NotNull(message = "用户ID不能为空")
    @ApiModelProperty(value = "用户ID",name = "userId",required = true)
    private long userId;

    @NotNull(message = "起始时间不能为空")
    @ApiModelProperty(value = "查询起始时间",name = "startTime",required = true)
    private String startTime;

    @NotNull(message = "结束时间不能为空")
    @ApiModelProperty(value = "查询结束时间",name="endTime",required=true)
    private String endTime;

}
