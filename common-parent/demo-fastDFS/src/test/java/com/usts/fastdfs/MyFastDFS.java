package com.usts.fastdfs;


import com.usts.utils.FastDFSClient;
import org.csource.fastdfs.*;
import org.junit.Test;

/**
 * Created by lenovo on 2019/8/11.
 */
public class MyFastDFS {

    /**
     * 需求：测试分布式文件系统fastDFS上传操作
     */

    @Test
    public void testUploadPic() throws Exception {

        //指定客户端配置文件绝对路径
        String conf = "D:\\Git\\project\\common-parent\\demo-fastDFS\\src\\main\\resources\\fdfs_client.conf";

        //指定上传的图片地址
        String pic = "E:\\www\\images\\0aa507941bbf43d7a985a03b6eb69848.jpeg";

        //读取客户端配置文件，连接远程图片服务器
        ClientGlobal.init(conf);

        //创建tracker服务客户端对象
        TrackerClient trackerClient = new TrackerClient();
        //从客户端对象中获取tracker服务对象
        TrackerServer trackerServer = trackerClient.getConnection();

        StorageServer storageServer = null;
        //创建storage客户端服务对象
        StorageClient storageClient = new StorageClient(trackerServer, storageServer);

        //直接上传图片
        String[] urls = storageClient.upload_file(pic, "jpg", null);

        //打印
        for(String url:urls){
            System.out.println(url);
        }
    }


    /**
     * 测试使用工具类进行分布式文件系统fastdfs上传操作
     * @throws Exception
     */
    @Test
    public void testUploadPicUtils() throws Exception {

        //指定客户端配置文件绝对路径
        String conf = "D:\\Git\\project\\common-parent\\demo-fastDFS\\src\\main\\resources\\fdfs_client.conf";

        //指定上传的图片地址
        String pic = "E:\\www\\images\\8dd0b6814a5b42b6a81c23ebedd27c5a.jpeg";

        //使用工具类进行上传
        //创建工具嘞对象
        FastDFSClient fastDFSClient = new FastDFSClient(conf);
        //上传
        String url = fastDFSClient.uploadFile(pic);

        System.out.println(url);

    }

}
