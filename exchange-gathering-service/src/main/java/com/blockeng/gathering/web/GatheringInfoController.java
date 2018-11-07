package com.blockeng.gathering.web;


import com.blockeng.gathering.entity.ExGathering;
import com.blockeng.gathering.entity.My18Gathering;
import com.blockeng.gathering.service.GatheringInfoService;
import com.blockeng.gathering.service.TimingSynDataService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/gathering")
@Api(value = "/gathering")
public class GatheringInfoController {

     @Autowired
     GatheringInfoService gatheringInfoService;

     @Autowired
     TimingSynDataService timingSynDataService;

     @RequestMapping("/test")
     public String test(){
         return "test!";
     }

     @RequestMapping("/getByReferenceId")
     public My18Gathering getGatheringByReferenceId(String referenceId){
          My18Gathering exGathering=gatheringInfoService.getGatheringByReference(referenceId);
          return exGathering;
     }

     @RequestMapping("/getByReferenceIdList")
     public List<ExGathering> getGatheringByReferenceListIdList(List<String> referenceIdList){

          return null;
     }

     @RequestMapping("/testSyn")
     public String testSyn(){
          timingSynDataService.synOrderInfo();
          return "success";
     }
}