package com.blockeng.gathering.service;

import com.blockeng.gathering.entity.ExGathering;
import com.blockeng.gathering.entity.My18Gathering;

import java.util.List;

public interface GatheringInfoService {

    public My18Gathering getGatheringByReference(String referenceId);

    public List<ExGathering> getGatheringByRefenceList(List<String> referenceIdList);

}
