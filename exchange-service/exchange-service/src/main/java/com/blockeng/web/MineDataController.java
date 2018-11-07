package com.blockeng.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.blockeng.entity.MineData;
import com.blockeng.framework.http.Response;
import com.blockeng.service.MineDataService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description:
 * @Author: Chen Long
 * @Date: Created in 2018/6/29 下午4:14
 * @Modified by: Chen Long
 */
@RestController
@RequestMapping("/mine/data")
@Api(value = "矿池数据", description = "矿池数据", tags = "矿池数据")
public class MineDataController {

    @Autowired
    private MineDataService mineDataService;

    /**
     * 查询当日挖矿数据
     *
     * @return
     */
    @GetMapping
    @ApiOperation(value = "mine--002  查询挖矿信息", notes = "挖矿信息", httpMethod = "GET")
    public Response getMinerInfo() {
        QueryWrapper<MineData> ew = new QueryWrapper<>();
        ew.orderByDesc("statistics_date");
        return Response.ok(mineDataService.selectOne(ew));
    }
}
