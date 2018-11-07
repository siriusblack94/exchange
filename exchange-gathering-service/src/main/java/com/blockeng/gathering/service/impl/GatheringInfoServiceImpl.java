package com.blockeng.gathering.service.impl;

import com.blockeng.gathering.entity.ExGathering;
import com.blockeng.gathering.entity.My18Gathering;
import com.blockeng.gathering.mapper.my18.My18GatheringMapper;
import com.blockeng.gathering.service.GatheringInfoService;
import com.blockeng.gathering.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class GatheringInfoServiceImpl implements GatheringInfoService {

    @Autowired
    private My18GatheringMapper my18GatheringMapper;
    @Value("${plate.id}")
    private String platformId;

    ThreadLocal<SimpleDateFormat> th_format=new ThreadLocal<SimpleDateFormat>(){

        @Override
        protected SimpleDateFormat initialValue() {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        }
    };


    @Override
    public My18Gathering getGatheringByReference(String referenceId) {
        My18Gathering my18Gathering=my18GatheringMapper.getGatheringInfoByRefenenceId(Integer.valueOf(referenceId+platformId));
        if(my18Gathering==null){
            return new My18Gathering();
        }
        my18Gathering.setReferenceId(StringUtil.RemoveLastThree(my18Gathering.getReferenceId()));
        return my18Gathering;
    }

    @Override
    public List<ExGathering> getGatheringByRefenceList(List<String> referenceIdList) {

        return null;
    }


    public ExGathering convertGatheringEntity(My18Gathering my18Gathering){

        ExGathering exGathering=new ExGathering();
        exGathering.setMoneyMaker(my18Gathering.getMoneyMaker());
        exGathering.setReferenceId(my18Gathering.getReferenceId());
        exGathering.setSeqID(my18Gathering.getSeqID());
        exGathering.setPoundage(my18Gathering.getPoundage());
        try{
            exGathering.setMakeMoneyTime(th_format.get().parse(my18Gathering.getMakeMoneyTime()));
        }catch (Exception e){
            e.printStackTrace();
        }
        return exGathering;
    }
}
