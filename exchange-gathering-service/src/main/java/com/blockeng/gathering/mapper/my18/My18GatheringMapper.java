package com.blockeng.gathering.mapper.my18;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.blockeng.gathering.entity.My18Gathering;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface My18GatheringMapper extends BaseMapper<My18Gathering> {

      public List<My18Gathering> getGatheringInfoByReferenceNumberList(List<String> referenceIdList);

      public My18Gathering getGatheringInfoByRefenenceId(@Param("referenceId") int referenceId);

}
