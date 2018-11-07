package com.blockeng.gathering.cache;


import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 内存文映射 先将需缓存信息写入本地 暂替redis
 * */

//@ConfigurationProperties(prefix = "mmap.time")
//@Component()
public class MMapTimeCache {

//     private MappedByteBuffer buffer=null;
//
//     private ThreadLocal<SimpleDateFormat> tl_format;
//
//     private String filedir;
//
//     private String filesize;
//
//     private Map<String,Date> timeCache=new ConcurrentHashMap<String,Date>();
//
//     public MMapTimeCache(){
//
//          tl_format=new ThreadLocal<SimpleDateFormat>(){
//
//               @Override
//               protected SimpleDateFormat initialValue() {
//                    return new SimpleDateFormat("yyyyMMddHHmmss");
//               }
//          };
//          try {
//               buffer=new RandomAccessFile(filedir,"rw").getChannel().map(FileChannel.MapMode.READ_WRITE,0,14);
//          } catch (IOException e) {
//               e.printStackTrace();
//          }
//
//          String data=String.valueOf(buffer.get());
//          if(data!=null&&(!data.equals(""))){
//               try {
//                    timeCache.put("time",tl_format.get().parse(data));
//               } catch (ParseException e) {
//                    e.printStackTrace();
//               }
//          }
//          System.out.println(data);
//     }
//
//     public void writeTime(Date date){
//
//          buffer.put(tl_format.get().format(date).getBytes());
//          buffer.force();
//          timeCache.put("time",date);
//     }
//
//     public Date getTime(){
//
//          if(!timeCache.containsKey("time")){
//
//               return timeCache.get("time");
//
//          }else{
//
//               return new Date();
//          }
//     }
}
