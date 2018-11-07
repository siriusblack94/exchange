package com.blockeng.gathering.mapper.my18;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.blockeng.gathering.entity.CashRechargeSyn;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface My18CashRechargeSynMapper extends BaseMapper<CashRechargeSyn> {

    public void cleanDataOutOfDate(@Param("paramTime") Date date);

    public CashRechargeSyn getMaxTimeData(@Param("plateformId") String platformId);

    public void synOrderInfo(List<CashRechargeSyn> cashRechargeSyns);
}
